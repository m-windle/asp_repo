<%@ Page Title="Customer Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomersAdmin.aspx.cs" Inherits="AssignmentTwo.CustomersAdmin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h4><%: "Maintain Customers" %></h4>

    <div class="container">
        <div class="form-horizontal">
            <div class="form-group">
                <div class="col-md-1">
                    <asp:Label ID="lblTitle" runat="server" Text="Customer List" CssClass="control-label pull-right"></asp:Label>
                </div>
                <div>
                </div>
             </div>
        </div>
    </div>
</asp:Content>