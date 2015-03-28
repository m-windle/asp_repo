<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AssignmentTwo.Default" %>

<asp:Content runat="server" ID="headerContentPlaceHolder" ContentPlaceHolderID="FeaturedContent">
      <div class="jumbotron">
          <p class="lead">SportsPro - Sports management software for the sports enthusiast</p>
           <p><a href="#" class="btn btn-primary btn-large">Learn more &raquo;</a></p>

      </div>
</asp:Content>

<asp:Content ID="mainContentPlaceHolder" ContentPlaceHolderID="MainContent" runat="server">
     

    <div class="row">
        <div class="col-md-4">
            <h4>Getting started</h4>
            <p>
                Go to <a href= "Customers.aspx">Customers</a> section to search for your customer information.
            </p>
            <p>
                <a class="btn btn-default" href="Customers.aspx">Learn more &raquo;</a>
            </p>
        </div>
       
        <div class="col-md-4">
            <h4>What do you think about our service?</h4>
            <p>
                <a href="Surveys.aspx">Submit a survey</a> to provide your feedbac for any support we have provided to you recently.
            </p>
             <p>
                <a class="btn btn-default" href="Surveys.aspx">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h4>Adminstration</h4>
            <p>
               Modify Customers and Products data....
            </p>
            <p>
                <a class="btn btn-default" href="Admin/ProductsAdmin.aspx">Learn more &raquo;</a>
            </p>
        </div>
    </div>


</asp:Content>
