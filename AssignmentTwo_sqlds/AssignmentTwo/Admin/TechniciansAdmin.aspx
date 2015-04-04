<%@ Page Title="Technicians Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TechniciansAdmin.aspx.cs" Inherits="AssignmentTwo.TechniciansAdmin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h4><%: "Technician Maintenance" %></h4>

    <div class="container">
        <div class="form-horizontal">
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Technicians List" CssClass="control-label pull-left text-info" Width="158px"></asp:Label><br /><br />
                <div class="col-md-1">                    
                    <asp:Table ID="tblTechs" runat="server" CssClass="table table-responsive" Width="794px">
                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                <asp:Label ID="Label2" runat="server" Text="Select a Technician" CssClass="control-label pull-left text-info" Width="158px"></asp:Label><br />
                            </asp:TableHeaderCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:DropDownList AutoPostBack="true" CssClass="dropdown" ID="ddlTechs" runat="server" DataSourceID="sqlTechs" DataTextField="Name" DataValueField="TechID"></asp:DropDownList><br /><br />
                                <asp:DetailsView CssClass="table table-responsive" ID="dvTechs" runat="server" Height="50px" Width="500px" AutoGenerateRows="False" DataKeyNames="TechID" DataSourceID="sqlTechSelect" BorderStyle="None">
                                    <Fields>
                                        <asp:BoundField DataField="TechID" HeaderText="TechID" ReadOnly="True" InsertVisible="False" SortExpression="TechID"></asp:BoundField>
                                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
                                        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone"></asp:BoundField>
                                        <asp:CommandField ShowInsertButton="True" ShowEditButton="True" ShowDeleteButton="True">
                                            <ControlStyle CssClass="btn btn-info btn-xs"></ControlStyle>
                                        </asp:CommandField>
                                    </Fields>
                                </asp:DetailsView>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>
             </div>
        </div>
    </div>

<asp:SqlDataSource ID="sqlTechSelect" runat="server" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:TechSupportConnectionString %>' DeleteCommand="DELETE FROM [Technicians] WHERE [TechID] = @original_TechID AND [Name] = @original_Name AND [Email] = @original_Email AND [Phone] = @original_Phone" InsertCommand="INSERT INTO [Technicians] ([Name], [Email], [Phone]) VALUES (@Name, @Email, @Phone)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Technicians] WHERE ([TechID] = @TechID)" UpdateCommand="UPDATE [Technicians] SET [Name] = @Name, [Email] = @Email, [Phone] = @Phone WHERE [TechID] = @original_TechID AND [Name] = @original_Name AND [Email] = @original_Email AND [Phone] = @original_Phone">
                    <DeleteParameters>
                        <asp:Parameter Name="original_TechID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Email" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Phone" Type="String"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Phone" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlTechs" PropertyName="SelectedValue" Name="TechID" Type="Int32"></asp:ControlParameter>
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Phone" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_TechID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Email" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Phone" Type="String"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sqlTechs" runat="server" ConnectionString='<%$ ConnectionStrings:TechSupportConnectionString %>' SelectCommand="SELECT [TechID], [Name] FROM [Technicians] ORDER BY [Name]"></asp:SqlDataSource>
</asp:Content>