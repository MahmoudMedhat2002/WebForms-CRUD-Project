<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CRUD_Project.Login" %>

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
    <div class="container">
        <div class="row">
                <asp:Label Font-Bold="true" Font-Size="20" CssClass="text-center" ID="Label3" runat="server" Text="Login"></asp:Label>

                <div class="form-group">
                    <asp:Label CssClass="form-text" ID="Label1" runat="server" Text="UserName: "></asp:Label>
                    <br />
                    <asp:TextBox CssClass="form-control" ID="Emailtxt" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ForeColor="Red" runat="server" Text="Email is Required" ControlToValidate="Emailtxt"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <asp:Label CssClass="form-text" ID="Label2" runat="server" Text="Password: "></asp:Label>
                    <br />
                    <asp:TextBox CssClass="form-control" ID="Passtxt" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ForeColor="Red" runat="server" Text="Password is Required" ControlToValidate="Passtxt"></asp:RequiredFieldValidator>
                </div>

                <div class="text-center mt-3">
                    <asp:Button CssClass="btn btn-outline-primary" ID="Loginbtn" runat="server" Text="Login" OnClick="Loginbtn_Click" />
                </div>
            <div class="text-center mt-3">
                <asp:Button CausesValidation="false" CssClass="btn btn-outline-secondary" ID="main" runat="server" Text="Return To Welcome Page" OnClick="main_Click" />
            </div>
                <asp:Label CssClass="form-text" ID="resLabel" runat="server"></asp:Label>
        </div>

    </div>
    
</form>
</body>
</html>
