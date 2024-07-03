<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateProduct.aspx.cs" Inherits="CRUD_Project.UpdateProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn-script.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="app.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" 
    integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" 
    crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js" integrity="sha512-2rNj2KJ+D8s1ceNasTIex6z4HWyOnEYLVC3FigGOmyQCZc2eBXKgOxQmo3oKLHyfcj53uz4QMsRCWNbLd32Q1g==" 
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <div class="col-md-8 offset-2">
                <div class="row mb-2">
                    <h3>Update Product</h3>
                </div>
                <div class="form-group row mb-4">
                    <asp:Label CssClass="form-label col-md-1" ID="NameLabel" runat="server" Text="Name: "></asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox CssClass="form-control" ID="NameInput" runat="server"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator CssClass="form-label col-md-3" ID="RequiredFieldValidator1" runat="server"
                        ErrorMessage="Name is Required" ControlToValidate="NameInput" ForeColor="red"></asp:RequiredFieldValidator>
                    <br />
                </div>
                <div class="form-group row mb-4">
                    <asp:Label ID="DescLabel" CssClass="form-label col-md-1" runat="server" Text="Desc: "></asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox ID="DescInput" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator CssClass="form-label col-md-3" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Description is Required"
                        ControlToValidate="DescInput" ForeColor="red"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group row mb-4">
                    <asp:Label CssClass="form-label col-md-1" ID="PriceLabel" runat="server" Text="Price: "></asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox CssClass="form-control" ID="PriceInput" runat="server"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator CssClass="form-label col-md-3" ID="RequiredFieldValidator3" runat="server"
                        ErrorMessage="Price is Required" ControlToValidate="PriceInput" ForeColor="red"></asp:RequiredFieldValidator>
                    <div class="form-group row mt-4">
                        <asp:Label ID="Label4" CssClass="form-label col-md-1" runat="server" Text="Select category "></asp:Label>
                        <div class="col-md-8">
                            <asp:DropDownList ID="List1" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-10 mt-4 d-flex justify-content-center">
                            <asp:Button CssClass="btn btn-outline-warning" ID="UpdateProductbtn" runat="server" Text="Update Product" OnClick="UpdateProductbtn_Click" />
                        </div>
                    </div>

                </div>
                
                
                
            </div>
           
        </div>

            
    </form>
</body>
</html>
