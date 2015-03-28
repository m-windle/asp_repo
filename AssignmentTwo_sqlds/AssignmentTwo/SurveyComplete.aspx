<%@ Page Title="Survey Completed" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SurveyComplete.aspx.cs" Inherits="AssignmentTwo.SurveyComplete" %>

<asp:Content ID="headerContent" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h3><%: Title %></h3>
    <h4></h4>
 </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="form-horizontal">
            <div class="form-group">
                <asp:Label ID="lblMessage" runat="server" CssClass="text-success" ></asp:Label>
            </div>
            <div class="form-group">
                 <asp:Button ID="Button1" runat="server" PostBackUrl="~/Customers.aspx" Text="Return to Survey"  CssClass="btn btn-default"/>
            </div>
        </div>
    </div>
</asp:Content>
