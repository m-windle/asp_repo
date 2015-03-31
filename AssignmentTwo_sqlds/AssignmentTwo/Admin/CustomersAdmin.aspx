<%@ Page Title="Customer Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomersAdmin.aspx.cs" Inherits="AssignmentTwo.Admin.CustomersAdmin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h4><%: "Maintain Customers" %></h4>

    <div class="container">
        <div class="form-horizontal">
            <div class="form-group">
                <div class="col-md-1">
                    <asp:Table runat="server" CssClass="table table-responsive">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblTitle" runat="server" Text="Customer List" CssClass="control-label pull-left text-info" Width="99px"></asp:Label><br /><br />
                            <asp:GridView CssClass="table" PagerSettings-Mode="NextPreviousFirstLast" PagerSettings-FirstPageText="<<| " PagerSettings-PreviousPageText=" < " PagerSettings-NextPageText="| > " PagerSettings-LastPageText=" |>>" ID="grdCustomers" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="sqlCustomers" Width="800px" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                                <Columns>
                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                                    <asp:CommandField ShowSelectButton="True" ControlStyle-CssClass="btn btn-info btn-xs" />
                                </Columns>
                                <EditRowStyle BackColor="#999999"></EditRowStyle>

                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                <PagerSettings FirstPageText="&lt;&lt;| " LastPageText=" |&gt;&gt;" NextPageText="| &gt; " PreviousPageText=" &lt; "></PagerSettings>

                                <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                                <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                                <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                                <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                                <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                            </asp:GridView> 
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="Label1" runat="server" Text="Customer Details" CssClass="control-label text-info"></asp:Label><br /><br />
                            <asp:DetailsView CssClass="table" ID="dvCustomerSelect" runat="server" Height="50px" Width="350px" DataKeyNames="CustomerID" DataSourceID="sqlCustomerSelect" AutoGenerateRows="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True"></CommandRowStyle>

                                <EditRowStyle BackColor="#999999"></EditRowStyle>

                                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True"></FieldHeaderStyle>
                                <Fields>
                                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" InsertVisible="False" SortExpression="CustomerID"></asp:BoundField>
                                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" Text='<%# Bind("Name") %>' ID="txtNameEdit"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="valNameEdit" ControlToValidate="txtNameEdit" runat="server" ErrorMessage="Name is required" Text="*" ValidationGroup="edit"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox runat="server" Text='<%# Bind("Name") %>' ID="txtNameInsert"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is required" Text="*" ValidationGroup="insert"></asp:RequiredFieldValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Name") %>' ID="Label1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Address" SortExpression="Address">
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" Text='<%# Bind("Address") %>' ID="txtAddressEdit"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="valAddressEdit" ControlToValidate="txtAddressEdit" runat="server" ErrorMessage="Address is required" Text="*" ValidationGroup="edit"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox runat="server" Text='<%# Bind("Address") %>' ID="txtAddressInsert"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="valAddressInsert" ControlToValidate="txtAddressInsert" runat="server" ErrorMessage="Address is required" Text="*" ValidationGroup="insert"></asp:RequiredFieldValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Address") %>' ID="Label2"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="City" SortExpression="City">
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" Text='<%# Bind("City") %>' ID="txtCityEdit"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="valCityEdit" ControlToValidate="txtCityEdit" runat="server" ValidationGroup="edit" ErrorMessage="City is required" Text="*"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox runat="server" Text='<%# Bind("City") %>' ID="txtCityInsert"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="valCityInsert" ControlToValidate="txtCityInsert" runat="server" ValidationGroup="insert" ErrorMessage="City is required" Text="*"></asp:RequiredFieldValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("City") %>' ID="Label3"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="State" SortExpression="State">
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" Text='<%# Bind("State") %>' ID="txtStateEdit" MaxLength="2"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="valStateEdit" runat="server" ControlToValidate="txtStateEdit" ValidationGroup="edit" ErrorMessage="State is required" Text="*"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox runat="server" Text='<%# Bind("State") %>' ID="txtStateInsert" MaxLength="2"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="valStateInsert" ControlToValidate="txtStateInsert" ValidationGroup="insert" runat="server" ErrorMessage="State is required" Text="*"></asp:RequiredFieldValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("State") %>' ID="Label4"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ZipCode" SortExpression="ZipCode">
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" Text='<%# Bind("ZipCode") %>' ID="txtZipEdit" MaxLength="6"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="valZipEdit" runat="server" ErrorMessage="Zip code is required" Text="*" ControlToValidate="txtZipEdit" ValidationGroup="edit"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="valTypeZipEdit" runat="server" ErrorMessage="Zip code is invalid" Text="*" ValidationGroup="edit" ControlToValidate="txtZipEdit"></asp:CompareValidator>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox runat="server" Text='<%# Bind("ZipCode") %>' ID="txtZipInsert" MaxLength="6"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="valZipInsert" runat="server" ErrorMessage="Zip code is required" Text="*" ControlToValidate="txtZipInsert" ValidationGroup="insert"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="valTypeZip" runat="server" ErrorMessage="Zip code is invalid" Text="*" ValidationGroup="insert" ControlToValidate="txtZipInsert"></asp:CompareValidator>
                                        Type="Integer" Operator="DataTypeCheck" </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("ZipCode") %>' ID="Label5"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" Text='<%# Bind("Phone") %>' ID="txtPhoneEdit" MaxLength="11"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="valPhoneEdit" runat="server" ErrorMessage="Phone is required" Text="*" ControlToValidate="txtPhoneEdit" ValidationGroup="edit"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="typePhoneEdit" runat="server" ErrorMessage="Invalid phone number" Text="*" ControlToValidate="txtPhoneEdit" ValidationGroup="edit" Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox runat="server" Text='<%# Bind("Phone") %>' ID="txtPhoneInsert" MaxLength="11"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="valPhoneInsert" runat="server" ErrorMessage="Phone is required" Text="*" ControlToValidate="txtPhoneInsert" ValidationGroup="insert"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="typePhoneInsert" runat="server" ErrorMessage="Invalid phone number" Text="*" ControlToValidate="txtPhoneInsert" ValidationGroup="insert" Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Phone") %>' ID="Label6"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" SortExpression="Email">
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" Text='<%# Bind("Email") %>' ID="txtEmailEdit"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="valEmailEdit" runat="server" ErrorMessage="Email is required" Text="*" ControlToValidate="txtEmailEdit" ValidationGroup="edit"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox runat="server" Text='<%# Bind("Email") %>' ID="txtEmailInsert"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="valEmailInsert" runat="server" ErrorMessage="Email is required" Text="*" ControlToValidate="txtEmailInsert" ValidationGroup="insert"></asp:RequiredFieldValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Email") %>' ID="Label7"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton runat="server" Text="Update" CommandName="Update" CausesValidation="True" ID="LinkButton1" ValidationGroup="edit"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" CausesValidation="True" ID="LinkButton1" ValidationGroup="insert"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="New" CommandName="New" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Delete" CommandName="Delete" CausesValidation="False" ID="LinkButton3"></asp:LinkButton>
                                        </ItemTemplate>

                                        <ControlStyle CssClass="btn btn-info btn-xs"></ControlStyle>
                                    </asp:TemplateField>

                                </Fields>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>
                            </asp:DetailsView>
                            <asp:ValidationSummary ID="valSumEdit" ValidationGroup="edit" runat="server" />
                            <asp:ValidationSummary ID="valSumInsert" ValidationGroup="insert" runat="server" />
                        </asp:TableCell>
                    </asp:TableRow>
                    </asp:Table>
                </div>
             </div>
        </div>
    </div>

    <asp:SqlDataSource ID="sqlCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Customers]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlCustomerSelect" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @original_CustomerID AND [Name] = @original_Name AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))" InsertCommand="INSERT INTO [Customers] ([Name], [Address], [City], [State], [ZipCode], [Phone], [Email]) VALUES (@Name, @Address, @City, @State, @ZipCode, @Phone, @Email)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Customers] WHERE ([CustomerID] = @CustomerID)" UpdateCommand="UPDATE [Customers] SET [Name] = @Name, [Address] = @Address, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [Phone] = @Phone, [Email] = @Email WHERE [CustomerID] = @original_CustomerID AND [Name] = @original_Name AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_CustomerID" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_State" Type="String" />
            <asp:Parameter Name="original_ZipCode" Type="String" />
            <asp:Parameter Name="original_Phone" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="grdCustomers" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="original_CustomerID" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_State" Type="String" />
            <asp:Parameter Name="original_ZipCode" Type="String" />
            <asp:Parameter Name="original_Phone" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>