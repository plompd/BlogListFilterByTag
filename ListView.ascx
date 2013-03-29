<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListView.ascx.cs" Inherits="SitefinityWebApp.Widgets.Blogs.ListView" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.ContentUI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.Comments" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Import Namespace="Telerik.Sitefinity" %>

<telerik:RadListView ID="Repeater" ItemPlaceholderID="ItemsContainer" OnItemDataBound="Repeater_ItemDataBound" runat="server" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
    <LayoutTemplate>
        <sf:ContentBrowseAndEditToolbar ID="MainBrowseAndEditToolbar" runat="server" Mode="Add"></sf:ContentBrowseAndEditToolbar>
        <asp:PlaceHolder ID="ItemsContainer" runat="server" />
    </LayoutTemplate>
    <ItemTemplate>
        <h2>
          <sf:DetailsViewHyperLink ID="DetailsViewHyperLink1" TextDataField="Title" ToolTipDataField="Description" runat="server" /></h2>
          <p>
            <sf:FieldListView ID="PostContent" runat="server" Text="{0}" Properties="Summary" />
          </p>
          <sf:DetailsViewHyperLink ID="FullStory" Text="<%$ Resources:BlogResources, FullStory %>" runat="server" CssClass="read-more" />
          <asp:Literal ID="Literal2" Text="<%$ Resources:Labels, By %>" runat="server" />
          <sf:PersonProfileView ID="PersonProfileView1" runat="server" />
          <asp:Literal ID="tags" runat="server"></asp:Literal>
          <sf:ContentBrowseAndEditToolbar ID="BrowseAndEditToolbar" runat="server" Mode="Edit,Delete,Unpublish"></sf:ContentBrowseAndEditToolbar>
    </ItemTemplate>
</telerik:RadListView>
<sf:Pager id="pager" runat="server"></sf:Pager>

<asp:PlaceHolder ID="socialOptionsContainer" runat="server" />
