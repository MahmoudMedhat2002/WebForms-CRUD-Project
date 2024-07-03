<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductHome.aspx.cs" Inherits="CRUD_Project.ProductHome" %>

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
        <div class="container mt-5">
            <div class="row">
                <div class=" d-flex justify-content-center">


                    <asp:GridView CssClass="table" ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None" Height="254px" Width="490px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:ButtonField ControlStyle-CssClass="btn btn-warning" ButtonType="Button" HeaderText="Update" Text="Update" CommandName="Update" />
                            <asp:ButtonField ControlStyle-CssClass="btn btn-danger" ButtonType="Button" HeaderText="Delete" Text="Delete" CommandName="Delete" />
                        </Columns>

                    </asp:GridView>
                    <br />

                </div>
            </div>
            <div class="row float-end">
                <asp:Button CssClass="btn btn-primary fload-end" ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Product" />
            </div>
        </div>
    </form>
</body>
</html>
 