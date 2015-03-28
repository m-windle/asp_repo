<%@ Page Title="Contact List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactList.aspx.cs" Inherits="AssignmentTwo.ContactList" %>

<asp:Content ID="headerContent" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h3><%: Title %></h3>
    <h4>Manage your contact list</h4>
 </asp:Content>

<asp:Content ID="bodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="form-horizontal">
            <div class="form-group">
                <asp:Label ID="lblContacts" runat="server" Text="Contact list:" CssClass="col-md-2"></asp:Label>
                <asp:ListBox ID="lstContacts" runat="server" CssClass="col-md-6 form-control-static"/>
            </div>
            <div class="col-md-offset-6">
                    <asp:Button ID="btnRemove" runat="server" CssClass="btn  btn-sm" Text="Remove Contact" onclick="btnRemove_Click"/>
                    <asp:Button ID="btnEmpty" runat="server" CssClass="btn  btn-sm"  Text="Empty List" onclick="btnEmpty_Click"  />
            </div>
         </div>
        <div class="col-md-offset-2">
            <asp:Button ID="btnSelect" runat="server" CssClass="btn btn-default" Text="Select Additional Customers" PostBackUrl="~/Customers.aspx" /><br />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
         </div>
   </div>
</asp:Content>
