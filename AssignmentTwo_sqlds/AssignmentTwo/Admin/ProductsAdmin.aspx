<%@ Page Title="Products Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="ProductsAdmin.aspx.cs" Inherits="AssignmentTwo.Admin.ProductsAdmin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h4><%: "Maintain Products"  %></h4>

    <div class="container">
        <div class="form-horizontal">
            <div class="form-group">
                <div>
                    <asp:Label ID="lblTitle" runat="server" Text="Product List" CssClass="control-label pull-left text-info"></asp:Label>
                </div>
                <br /><br />
                <div>
                    <asp:Label ID="lblServerError" runat="server" Visible="False"></asp:Label>
                    <asp:ValidationSummary ID="valEditSummary" ValidationGroup="edit" runat="server" />
                    <asp:GridView OnRowUpdated="grdProducts_RowUpdated" OnRowDeleted="grdProducts_RowDeleted"
                        ID="grdProducts" runat="server" AllowPaging="True" AllowSorting="True" 
                        AutoGenerateColumns="False" 
                        DataKeyNames="ProductCode" 
                        DataSourceID="sqlProducts" 
                        BorderStyle="None" 
                        CssClass="table table-responsive" 
                        Width="1052px">
                        <AlternatingRowStyle BorderStyle="None" />
                        <Columns>
                            <asp:BoundField DataField="ProductCode" HeaderText="Product Code" ReadOnly="True" SortExpression="ProductCode" />
                            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtNameEdit" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valNameEdit" ControlToValidate="txtNameEdit" runat="server" ErrorMessage="Name is required" Text="*" ValidationGroup="edit"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Version" SortExpression="Version">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtVerEdit" runat="server" Text='<%# Bind("Version") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valVerEdit" ControlToValidate="txtVerEdit" runat="server" ErrorMessage="Version is Required" Text="*" ValidationGroup="edit"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="valVerTypeEdit" ControlToValidate="txtVerEdit" runat="server" ErrorMessage="Invalid version type" Text="*" Type="Double" Operator="DataTypeCheck" ValidationGroup="edit"></asp:CompareValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Version") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Release Date" SortExpression="ReleaseDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDateEdit" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valDateEdit" ControlToValidate="txtDateEdit" runat="server" ErrorMessage="Date is Required" Text="*" ValidationGroup="edit"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="valDateTypeEdit" ControlToValidate="txtDateEdit" runat="server" ErrorMessage="Invalid date" Text="*" ValidationGroup="edit" ViewStateMode="Inherit" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ValidationGroup="edit">
                                <ControlStyle CssClass="btn btn-info btn-xs"></ControlStyle>
                            </asp:CommandField>
                        </Columns>
                        <SelectedRowStyle BackColor="#0099FF" />
                    </asp:GridView>
                    
                    <asp:Label ID="lblInsert" CssClass="text-info" runat="server" Text="To add a new product, click 'Add New Product'"></asp:Label><br />
                    <br />
                    <asp:DetailsView ID="dvProductInsert" runat="server" Height="16px" Width="662px" DataSourceID="sqlProducts" AutoGenerateRows="False" BorderStyle="None">
                        <Fields>
                            <asp:TemplateField ShowHeader="False">
                                <InsertItemTemplate>
                                    <asp:Table ID="Table1" runat="server" CssClass="table">
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:Label ID="lblProdCode" CssClass="text-info" runat="server" Text="Product Code: "></asp:Label>
                                                <asp:TextBox ID="txtProdCode" CssClass="input-group left" runat="server" ValidationGroup="insert"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="reqProdCode" ControlToValidate="txtProdCode" CssClass="text-left" ValidationGroup="insert" runat="server" ErrorMessage="Product code is required" Text="*"></asp:RequiredFieldValidator><br />

                                                <asp:Label ID="lblProdName" CssClass="text-info" runat="server" Text="Product Name: "></asp:Label>
                                                <asp:TextBox ID="txtProdName" CssClass="input-group" runat="server" ValidationGroup="insert"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="reqProdName" ControlToValidate="txtProdName" ValidationGroup="insert" runat="server" ErrorMessage="Product name is required" Text="*"></asp:RequiredFieldValidator><br />

                                                <asp:Label ID="lblProdVer" CssClass="text-info" runat="server" Text="Version: "></asp:Label>
                                                <asp:TextBox ID="txtProdVer" CssClass="input-group" runat="server" ValidationGroup="insert"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="reqProdVer" ControlToValidate="txtProdVer" ValidationGroup="insert" runat="server" ErrorMessage="Product version is required" Text="*"></asp:RequiredFieldValidator><br />
                                                <asp:CompareValidator ID="valDecimal" ControlToValidate="txtProdVer" runat="server" ErrorMessage="Invalid version number" Text="*" Type="Double" ValidationGroup="insert" Operator="DataTypeCheck"></asp:CompareValidator>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:Label ID="lblProdDate" CssClass="text-info" runat="server" Text="Release Date: "></asp:Label>
                                                <asp:Calendar ID="calProdDate" runat="server"></asp:Calendar><br />
                                                <asp:CustomValidator ID="valDate" runat="server" OnServerValidate="valDate_ServerValidate" ValidationGroup="insert" ErrorMessage="Invalid date" Text="*"></asp:CustomValidator>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:ValidationSummary ID="valInsertSummary" ValidationGroup="insert" runat="server" />
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-info btn-sm" CausesValidation="True" CommandName="Insert" Text="Insert" ValidationGroup="insert"></asp:LinkButton>
                                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-info btn-sm" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-info btn-sm" CausesValidation="false" CommandName="New" Text="Add New Product"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                    </asp:DetailsView>
                    <br />
                </div>
             </div>
        </div>
    </div>

    <asp:SqlDataSource ID="sqlProducts" runat="server" ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" 
        DeleteCommand="DELETE FROM [Products] WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate" 
        InsertCommand="INSERT INTO [Products] ([ProductCode], [Name], [Version], [ReleaseDate]) VALUES (@ProductCode, @Name, @Version, @ReleaseDate)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [Products]" 
        UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Version] = @Version, [ReleaseDate] = @ReleaseDate WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate">
        <DeleteParameters>
            <asp:Parameter Name="original_ProductCode" Type="String" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Version" Type="Decimal" />
            <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter Name="ProductCode" ControlID="dvProductInsert$txtProdCode" PropertyName="Text"/>
            <asp:ControlParameter Name="Name" ControlID="dvProductInsert$txtProdName" PropertyName="Text"/>
            <asp:ControlParameter Name="Version" ControlID="dvProductInsert$txtProdVer" PropertyName="Text"/>
            <asp:ControlParameter Name="ReleaseDate" ControlID="dvProductInsert$calProdDate" PropertyName="SelectedDate"/>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Version" Type="Decimal" />
            <asp:Parameter Name="ReleaseDate" Type="DateTime" />
            <asp:Parameter Name="original_ProductCode" Type="String" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Version" Type="Decimal" />
            <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </asp:Content>