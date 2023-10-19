<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="correoElectronico.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="es">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Registrarse</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/a75a44cb4d.js" crossorigin="anonymous"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.js"></script>
    <script src="./scripts/alert.js"></script>
    <link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet" />
    <link href="./style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="vh-100 d-flex align-items-center needs-validation" novalidate="">
        <div class="row h-100 w-100 justify-content-center align-items-center">
            <div class="h-75 col-12 col-md-8 col-xl-6 col-xxl-5 p-5 py-sm-4 px-xl-5 py-xl-3  bg-gray-300 rounded-3 wrap-signin h-signin">
                <main class="row h-100 overflow-auto">
                    <div class="col-12 d-flex justify-content-center">
                        <img src="./Media/logo2.png" alt="Alternate Text" class="w-25 d-none d-xl-block" />
                        <img src="./Media/logo.png" alt="Alternate Text" class="w-25 d-block d-xl-none" />
                    </div>

                    <h1 class="col-12 text-dark fs-3 text-center mt-2 mb-4 wrap-signin">Crear una nueva cuenta</h1>

                    <h2 class="text-dark fs-5 col-12 mb-3 wrap-signin">Datos de usuario</h2>

                    <div class="col-12 col-sm-6 mb-3">
                        <div class="input-group">
                            <label class="input-group-text" for="TextBoxName"><i class="fa-solid fa-user text-dark"></i></label>
                            <asp:TextBox ID="TextBoxName" runat="server" CssClass="form-control" placeholder="Nombre" required="" />
                        </div>
                    </div>

                    <div class="col-12 col-sm-6 mb-3">
                        <div class="input-group">
                            <label class="input-group-text" for="TextBoxLastName"><i class="fa-solid fa-user text-dark"></i></label>
                            <asp:TextBox ID="TextBoxLastName" runat="server" CssClass="form-control" placeholder="Apellido" required="" />
                        </div>
                    </div>

                    <div class="col-12 col-sm-6 mb-3">
                        <div class="input-group col-6">
                            <label class="input-group-text" for="TextBoxDate"><i class="fa-solid fa-cake-candles text-dark"></i></label>
                            <asp:TextBox ID="TextBoxDate" TextMode="Date" runat="server" CssClass="form-control" placeholder="Fecha de nacimiento" aria-describedby="user-date" required="" />
                        </div>
                    </div>

                    <div class="col-12 col-sm-6 mb-3">
                        <div class="input-group">
                            <label class="input-group-text" for="DropDownListGender"><i class="fa-solid fa-venus-mars text-dark"></i></label>
                            <asp:DropDownList ID="DropDownListGender" runat="server" CssClass="form-select" required="">
                                <asp:ListItem Value="" Text="Seleccionar género"></asp:ListItem>
                                <asp:ListItem Value="masculino" Text="Masculino"></asp:ListItem>
                                <asp:ListItem Value="femenino" Text="Femenino"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <h2 class="text-dark fs-5 col-12 mb-3 wrap-signin">Credenciales</h2>

                    <div class="col-12 mb-3">
                        <div class="input-group">
                            <asp:TextBox type="text" ID="TextBoxEmail" runat="server" CssClass="form-control" placeholder="Correo de usuario" required="" />
                            <label class="input-group-text" for="TextBoxEmail">@umail.com</label>
                        </div>
                        <div class="form-text">El correo electrónico no debe inlcuir caracteres especiales ni espacios. Tampoco debe sobrepasar los 25 caracteres.</div>
                    </div>

                    <div class="col-12 col-md-6 col-xl-12 mb-3">
                        <div class="input-group">
                            <label class="input-group-text" for="TextBoxPassword"><i class="fa-solid fa-lock text-dark"></i></label>
                            <asp:TextBox ID="TextBoxPassword" TextMode="Password" runat="server" CssClass="form-control" placeholder="Contraseña" required="" />
                        </div>
                        <div class="form-text">La contraseña debe tener mínimo 5 caracteres y un máximo de 35.</div>
                    </div>

                    <div class="col-12 col-md-6 col-xl-12 mb-3">
                        <div class="input-group">
                            <label class="input-group-text" for="TextBoxPasswordConfirmed"><i class="fa-solid fa-lock text-dark"></i></label>
                            <asp:TextBox ID="TextBoxPasswordConfirmed" TextMode="Password" runat="server" CssClass="form-control" placeholder="Confirmar contraseña" required="" />
                        </div>
                    </div>

                    <div class="col-12 d-flex justify-content-center mb-5 m-md-0">
                        <div class="w-75 d-flex flex-column-reverse flex-sm-row justify-content-between align-items-center gap-3 gap-sm-0">
                            <div>
                                <a href="./Login.aspx" class="text-decoration-none text-danger">Iniciar sesión</a>
                            </div>
                            <div>
                                <asp:Button Text="Crear cuenta" ID="ButtonCrearCuenta" runat="server" CssClass="btn btn-danger py-2 px-4" OnClick="ButtonCrearCuenta_Click" />
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </form>
    <script src="./scripts/bs-validate.js"></script>
</body>
</html>
