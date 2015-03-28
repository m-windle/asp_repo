<%@ Page Title="Surveys" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Surveys.aspx.cs" Inherits="AssignmentTwo.Surveys" %>

<asp:Content ID="headerContent" ContentPlaceHolderID="FeaturedContent" runat="server">
  <h3><%: Title %></h3>
  <h4>Collect feedback from customers</h4>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="form-horizontal">
            <div class="form-group">
                  <asp:Label ID="lblNoIncidents" runat="server" CssClass="text-danger"></asp:Label>
            </div>
            <div class="input-append">
                <asp:Label ID="lblCustomer" runat="server" Text="Enter your customer ID:" CssClass="col-md-2"></asp:Label>
                <asp:TextBox ID="txtCustomerID" runat="server" CssClass="form-control col-sm-1"></asp:TextBox>&nbsp;&nbsp;
                <asp:Button ID="btnGetIncidents" runat="server" Text="Get Incidents" CssClass="btn btn-sm" ValidationGroup="CustomerID" onclick="btnGetIncidents_Click"></asp:Button>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCustomerID"
                                Display="Dynamic" ErrorMessage="You must enter a customer ID." 
                                ValidationGroup="CustomerID" CssClass="text-danger" />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtCustomerID"
                                Display="Dynamic" ErrorMessage="Customer ID must be an integer." Operator="DataTypeCheck"
                                Type="Integer" ValidationGroup="CustomerID" CssClass="text-danger" />
            </div>
            <div><br /></div>
            <div class="form-group col-md-8">
                <asp:ListBox ID="lstIncidents" runat="server" CssClass="form-control"  Enabled="False"></asp:ListBox>&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="You must select an incident." ControlToValidate="lstIncidents" 
                    InitialValue="None" Display="Dynamic" Enabled="False" 
                    ValidationGroup="Submit" CssClass="text-danger" />

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" 
                    SelectCommand="SELECT [CustomerID], [ProductCode], [DateOpened], [Title], [DateClosed], [TechID], [IncidentID] FROM [Incidents] ORDER BY [DateClosed]">
                </asp:SqlDataSource>
            </div>
            <div class="form-group col-md-12">
                <asp:Label ID="lblHeading" runat="server" Font-Bold="True" Text="Please rate this incident by the following categories:" Enabled="False"></asp:Label>
            </div>
           <div class="form-group col-md-12">
                  <asp:Label ID="lblResponseTime" runat="server" Text="Response time:" Enabled="False" CssClass="col-md-2"></asp:Label>
                 <asp:RadioButtonList ID="rblResponseTime" runat="server" RepeatDirection="Horizontal" TextAlign="Right" Enabled="False" CellPadding="5" CellSpacing="5" >
                            <asp:ListItem Value="1">Not satisfied</asp:ListItem>
                            <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
                            <asp:ListItem Value="3">Satisfied</asp:ListItem>
                            <asp:ListItem Value="4">Completely satisfied</asp:ListItem>
                  </asp:RadioButtonList>
            </div>
             <div class="form-group col-md-12">
                  <asp:Label ID="lblEfficiency" runat="server" Text="Technician efficiency:" Enabled="False" CssClass="col-md-2"></asp:Label>
                   <asp:RadioButtonList ID="rblEfficiency" runat="server" RepeatDirection="Horizontal" TextAlign="Right" RepeatLayout="Table"  Enabled="False" >
                            <asp:ListItem Value="1">Not satisfied</asp:ListItem>
                            <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
                            <asp:ListItem Value="3">Satisfied</asp:ListItem>
                            <asp:ListItem Value="4">Completely satisfied</asp:ListItem>
                  </asp:RadioButtonList>
            </div>
             <div class="form-group col-md-12">
                 <asp:Label ID="lblResolution" runat="server" Text="Problem resolution:" Enabled="False" CssClass="col-md-2"></asp:Label>
                    <asp:RadioButtonList ID="rblResolution" runat="server" RepeatDirection="Horizontal" TextAlign="Right" RepeatLayout="Table"  Enabled="False" >
                            <asp:ListItem Value="1">Not satisfied</asp:ListItem>
                            <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
                            <asp:ListItem Value="3">Satisfied</asp:ListItem>
                            <asp:ListItem Value="4">Completely satisfied</asp:ListItem>
                   </asp:RadioButtonList>
            </div>
            <div class="form-group col-md-12">
                <asp:Label ID="lblComments" runat="server" Text="Additional comments:" Enabled="False" CssClass="col-md-2"></asp:Label>
                <asp:TextBox ID="txtComments" runat="server"  Rows="6" TextMode="MultiLine" CssClass="col-md-6" Enabled="False"></asp:TextBox>
            </div>
            <div class="form-group col-md-12">
                <asp:CheckBox ID="chkContact" runat="server" Text="Please contact me to discuss this incident" Enabled="False"  TextAlign="Right"/>
            </div>
            <div class="form-group col-md-12">
                  <asp:RadioButton ID="rdoContactByEmail" runat="server" GroupName="Contact"  TextAlign="Right" Text="Contact by email" Enabled="False" />
                  <asp:RadioButton ID="rdoContactByPhone" runat="server" GroupName="Contact" TextAlign="Right" Text="Contact by phone" Enabled="False" />
            </div>
             <div class="form-group col-md-12">
                  <asp:Button ID="btnSubmit" runat="server" Text="Submit" Enabled="False" ValidationGroup="Submit" CssClass="btn btn-default" onclick="btnSubmit_Click"/>
            </div>

        </div>
    </div>
</asp:Content>
