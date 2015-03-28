<%@ Page Title="Customers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="AssignmentTwo.Customers" %>

<asp:Content ID="headerContent" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h3><%: Title %></h3>
    <h4>Search and view your customer contact information</h4>
 </asp:Content>

<asp:Content ID="bodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container">
   <div class="form-horizontal">
        <div class="form-group">
            <asp:Label ID="lblCustomers" runat="server" Text="Select a customer:" CssClass="col-md-2"></asp:Label>
            <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True" />
         </div>
         <div class="form-group">
            <asp:Label runat="server" Text="Address:" CssClass="col-md-2"></asp:Label>
            <asp:Label ID="lblAddress" runat="server">Value</asp:Label><br />
            <asp:Label ID="lblCityStateZip" runat="server" CssClass="col-md-offset-2">Value</asp:Label>
         </div>
         <div class="form-group">
            <asp:Label runat="server" Text="Phone:" CssClass="col-md-2"></asp:Label>
            <asp:Label ID="lblPhone" runat="server">Value</asp:Label>
         </div>
       <div class="form-group">
            <asp:Label runat="server" Text="Email:" CssClass="col-md-2"></asp:Label>
            <asp:Label ID="lblEmail" runat="server">Value</asp:Label>
        </div>
        <div class="form-group">
             <asp:Button ID="btnAdd" runat="server"  CssClass="btn btn-default"  Text="Add to Contact List" onclick="btnAdd_Click" />&nbsp;
             <asp:Button ID="btnDisplay" runat="server" CssClass="btn btn-default" PostBackUrl="~/ContactList.aspx" Text="Display Contact List" /><br />
             <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" 
                            SelectCommand="SELECT * FROM [Customers] ORDER BY [Name]">
            </asp:SqlDataSource> 
        </div>

   </div>
         </div>
</asp:Content>
