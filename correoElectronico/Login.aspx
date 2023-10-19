<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="correoElectronico.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="es">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.js"></script>
    <script src="./scripts/alert.js"></script>
    <link href="./style.css" rel="stylesheet" />
    <title>Iniciar Sesión</title>
</head>
<body class="overflow-hidden">
    <form id="form1" runat="server" class="vh-100 row align-items-center justify-content-center needs-validation" novalidate="">
        <div class="col-12 col-md-10 col-md-9 col-xl-7 d-flex p-0">
            <div class="col py-5 bg-gray-800 d-none d-md-flex justify-content-center align-items-center custom-rounded-start">
                <img src="./Media/image-login.png" alt="image login" class="w-75 p-0 py-5" />
            </div>
            <div class="col p-4 bg-gray-300 aside-login custom-rounded-end">
                <div class="d-flex justify-content-center">
                    <img src="./Media/logo2.png" alt="Alternate Text" class="w-25 d-none d-md-block" />
                    <img src="./Media/logo.png" alt="Alternate Text" class="w-25 d-block d-md-none" />
                </div>
                <div class="h-100 d-flex flex-column justify-content-center py-1">
                    <h2 class="text-dark fs-4 text-center mb-5 aside-login">Inicia sesión con tu cuenta</h2>
                    <div class="form-floating mt-3">
                        <asp:TextBox type="email" ID="TextBoxEmail" runat="server" CssClass="form-control text-dark aside-login" placeholder="correo@ejemplo.com" required="" />
                        <asp:Label Text="Correo electrónico" runat="server" AssociatedControlID="TextBoxEmail" CssClass="text-dark text-opacity-75 text-gray-300-md" />
                        <div class="invalid-feedback">
                            Debes ingresar una dirección de correo válida.
                        </div>
                    </div>

                    <div class="form-floating mt-3">
                        <asp:TextBox type="password" ID="TextBoxPassword" runat="server" class="form-control text-dark aside-login" placeholder="contraseña" TextMode="Password" required="" />
                        <asp:Label Text="Contraseña" runat="server" AssociatedControlID="TextBoxPassword" CssClass="text-dark text-opacity-75 text-gray-300-md" />
                        <div class="invalid-feedback">
                            Debes ingresar tu contraseña.
                        </div>
                    </div>

                    <div class="d-flex justify-content-center mt-4">
                        <asp:Button Text="Inicar sesión" ID="ButtonIniciarSesion" runat="server" CssClass="btn btn-danger py-2 px-4" OnClick="ButtonIniciarSesion_Click" />
                    </div>

                    <div class="text-center mt-5">
                        <a href="./SignIn.aspx" class="text-decoration-none text-danger">Crear una cuenta</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="./scripts/bs-validate.js"></script>
</body>
</html>
