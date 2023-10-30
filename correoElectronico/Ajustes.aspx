<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ajustes.aspx.cs" Inherits="correoElectronico.Ajustes" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.js"></script>
    <script src="https://kit.fontawesome.com/a75a44cb4d.js" crossorigin="anonymous"></script>
    <script src="./scripts/alert.js"></script>
    <link href="./style.css" rel="stylesheet" />
    <link rel="shortcut icon" href="/Media/favicon.ico" type="image/x-icon" />
    <title>Ajustes</title>
</head>
<body class="overflow-hidden">
    <form id="form1" runat="server" class="row vh-100 w-100 justify-content-center align-items-center needs-validation position-relative overflow-hidden" novalidate="">
        <main class="col-12 col-sm-10 col-md-9 col-lg-7 col-xl-5 ps-4 p-sm-3" style="margin-bottom: 7% !important;">
            <div class="row">
                <div class="col-12 mb-5 d-flex flex-column align-items-center">
                    <i class="fa-solid fa-user mb-3 fs-1"></i>
                    <asp:Label ID="LabelEmail" runat="server" CssClass="text-white" />
                </div>

                <div class="col-12 col-sm-6">
                    <div class="form-floating mb-2 bg-dark index-0">
                        <asp:TextBox ID="TextBoxName" runat="server" CssClass="form-control bg-transparent text-white" placeholder="Nombre" />
                        <asp:Label Text="Nombre:" AssociatedControlID="TextBoxName" runat="server" CssClass="text-white bg-transparent" />
                    </div>
                </div>

                <div class="col-12 col-sm-6 mb-3">
                    <div class="form-floating bg-dark index-0">
                        <asp:TextBox ID="TextBoxLastName" runat="server" CssClass="form-control bg-transparent text-white" placeholder="Apellido" />
                        <asp:Label Text="Apellido:" AssociatedControlID="TextBoxLastName" runat="server" CssClass="text-white bg-transparent" />
                    </div>
                </div>

                <div class="col-12 col-sm-6 mb-3">
                    <div class="form-floating bg-dark index-0">
                        <asp:TextBox ID="TextBoxDate" TextMode="Date" runat="server" CssClass="form-control bg-transparent text-white" placeholder="Fecha de nacimiento" />
                        <asp:Label Text="Fecha de nacimiento:" AssociatedControlID="TextBoxDate" runat="server" CssClass="text-white bg-transparent" />
                    </div>
                </div>

                <div class="col-12 col-sm-6 mb-3">
                    <div class="form-floating bg-dark index-0">
                        <asp:DropDownList runat="server" ID="DropDownListGender" CssClass="form-control bg-dark text-white">
                            <asp:ListItem Text="Seleccionar género" Value="" />
                            <asp:ListItem Text="Masculino" Value="masculino" />
                            <asp:ListItem Text="Femenino" Value="femenino" />
                        </asp:DropDownList>
                        <asp:Label Text="Género:" AssociatedControlID="DropDownListGender" runat="server" CssClass="text-white bg-transparent" />
                    </div>
                </div>

                <div class="col-12 mb-3">
                    <div class="form-floating bg-dark index-0">
                        <asp:TextBox ID="TextBoxOldPassword" TextMode="Password" runat="server" CssClass="form-control bg-transparent text-white" placeholder="Contraseña actual" />
                        <asp:Label Text="Contraseña actual" AssociatedControlID="TextBoxOldPassword" runat="server" CssClass="text-white bg-transparent" />
                    </div>
                </div>

                <div class="col-12 col-sm-6 mb-3">
                    <div class="form-floating bg-dark index-0">
                        <asp:TextBox ID="TextBoxNewPassword" TextMode="Password" runat="server" CssClass="form-control bg-transparent text-white" placeholder="Nueva contraseña" />
                        <asp:Label Text="Nueva contraseña" AssociatedControlID="TextBoxNewPassword" runat="server" CssClass="text-white bg-transparent" />
                    </div>
                </div>

                <div class="col-12 col-sm-6 mb-4">
                    <div class="form-floating bg-dark index-0">
                        <asp:TextBox ID="TextBoxConfirmedPassword" TextMode="Password" runat="server" CssClass="form-control bg-transparent text-white index-0" placeholder="Confirmar contraseña" />
                        <asp:Label Text="Confirmar contraseña" AssociatedControlID="TextBoxConfirmedPassword" runat="server" CssClass="text-white bg-transparent" />
                    </div>
                </div>

                <div class="col-12 mb-3 d-flex flex-column align-items-center">
                    <asp:Button ID="ButtonSave" runat="server" Text="Guardar cambios" CssClass="btn btn-danger mb-3" OnClick="ButtonSave_Click" />
                    <a href="./DashboardPages/Recibidos.aspx" class="bg-transparent border-0 text-danger text-decoration-none">Regresar</a>
                </div>
            </div>
        </main>
        <img src="./Media/icon.png" class="position-absolute w-50 position-right-0 index-1 d-none d-md-block" />
    </form>
    <script src="./scripts/bs-validate.js"></script>
</body>
</html>
