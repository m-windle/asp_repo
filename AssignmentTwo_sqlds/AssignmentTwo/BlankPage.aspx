﻿<%@ Page Title="Blank Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BlankPage.aspx.cs" Inherits="AssignmentTwo.BlankPage" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h4><%: Title %></h4>

    <div class="container">
        <div class="form-horizontal">
            <div class="form-group">
                <div class="col-md-1">
                    <asp:Label ID="Label1" runat="server" Text="Label" CssClass="control-label pull-right"></asp:Label>
                </div>
                <div>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control">Test</asp:TextBox>
                </div>
             </div>
        </div>
    </div>
</asp:Content>