using System;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.OpenAccess;
using Telerik.Sitefinity.Blogs.Model;
using Telerik.Sitefinity.Model;
using Telerik.Sitefinity.Taxonomies;
using Telerik.Sitefinity.Taxonomies.Model;
using Telerik.Sitefinity.Web;
using Telerik.Sitefinity.Web.UI;
using Telerik.Web.UI;

namespace SitefinityWebApp.Widgets.Blogs {

  public partial class ListView : System.Web.UI.UserControl {
  
    protected void Repeater_ItemDataBound(object sender, Telerik.Web.UI.RadListViewItemEventArgs e) {
    
      var data = ((RadListViewDataItem)e.Item).DataItem as BlogPost;
      var placeholder = e.Item.FindControl("tags") as SitefinityLabel;
      placeholder.Text = RenderFlatTaxaAsLink(data, "Tags");
    }
  
    public string RenderFlatTaxaAsLink(BlogPost post, string taxonomyFieldName) {
    
      var baseUrl = string.Empty;
      var currentProvider = SiteMapBase.GetCurrentProvider();
      
      if (currentProvider == null || currentProvider != null && currentProvider.CurrentNode == null) { return string.Empty; } else {
        var currentNode = currentProvider.CurrentNode as PageSiteNode;
        if (currentNode == null) { baseUrl = currentProvider.CurrentNode.Url; } else {
          var firstPageDataNode = RouteHelper.GetFirstPageDataNode(currentNode, true);
          if (!currentNode.IsGroupPage || !(firstPageDataNode.Url != currentProvider.CurrentNode.Url)) { baseUrl = currentProvider.CurrentNode.Url; } else {
            baseUrl = firstPageDataNode.Url;
          }
        }
      }
      
      var tagList = "";
      var tags = post.GetValue<TrackedList<Guid>>(taxonomyFieldName);
        
      if (tags != null && tags.Count() > 0) {
        tagList = " | ";
        var taxManager = TaxonomyManager.GetManager();
        foreach (var tag in tags) {
          var t = taxManager.GetTaxon<FlatTaxon>(tag);
          var url = string.Format("{0}/-in-{1}/{2}/{3}", VirtualPathUtility.ToAbsolute(baseUrl), t.Taxonomy.Name, t.Taxonomy.Name, t.UrlName);
          var link = string.Format("<a class='tag' href='{0}'><span>{1}</span></a>", url, t.Title).ToString();
          tagList += link;
        }
      }
      
      return tagList;
    }
  }
}
