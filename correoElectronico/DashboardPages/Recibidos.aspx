<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Recibidos.aspx.cs" Inherits="correoElectronico.DashboardPages.Recibidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../scripts/toast.js"></script>
    <script src="../scripts/alert.js"></script>
    <main>
        <h1 class="ms-3 m-sm-0 text-white">Recibidos</h1>
        <div class="table-responsive">
            <asp:GridView ID="GridViewCorreos" runat="server" CssClass="table table-dark table-hover"></asp:GridView>
        </div>

        <%--<ul class="list-group">
            <li class="list-group-item bg-dark text-white d-flex justify-content-between">
                <span class="w-100 content-hidden">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi fermentum, lacus nec interdum efficitur, turpis odio gravida erat, ut hendrerit orci velit nec quam. Aenean lacinia dui nec mauris cursus, sed ullamcorper turpis laoreet. Maecenas non risus elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque dictum dui eget turpis tincidunt pellentesque. Morbi laoreet massa sit amet ipsum posuere venenatis. Integer sit amet est a massa imperdiet maximus. In hac habitasse platea dictumst. Donec quis malesuada turpis. Curabitur eleifend eros sit amet ultrices tempor. Integer eget molestie risus. In elementum tristique turpis, ac condimentum justo hendrerit ut. In ac dictum neque, in ullamcorper orci. Quisque at tincidunt elit, ac ultricies sapien. In hac habitasse platea dictumst. Proin quis erat vitae dolor sollicitudin blandit at sed velit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Pellentesque euismod tortor et tincidunt efficitur. In non enim risus. Suspendisse malesuada hendrerit aliquet. Ut sodales lorem eu lacinia condimentum. Nulla iaculis ullamcorper maximus. Nunc erat leo, elementum eu neque nec, pulvinar vestibulum dolor. Nunc congue, diam vitae rhoncus molestie, augue nisl ultricies ante, efficitur sagittis tortor urna vitae dui. Sed sagittis vulputate magna, eu maximus nulla aliquam a. Pellentesque eleifend at urna eget convallis. Donec dapibus, justo vitae tempus tincidunt, dui nibh vestibulum tortor, eu volutpat diam nisi et ante. Sed eu ipsum et urna rhoncus interdum. Nulla eget ultricies ex. Mauris interdum sodales tortor. Proin convallis viverra orci, ut sollicitudin eros hendrerit condimentum. Sed congue sit amet neque at pellentesque. Etiam lobortis semper nisl sed aliquet. Cras ornare efficitur faucibus. Aliquam lectus felis, accumsan eu consequat sed, interdum quis arcu. Suspendisse accumsan est id diam posuere, vitae pulvinar enim placerat. In consequat turpis vitae eros elementum, vel volutpat diam placerat. Proin efficitur varius tortor. Suspendisse nulla tellus, interdum id rutrum in, iaculis vitae justo. Vestibulum vel turpis id diam dapibus pulvinar. Morbi mi augue, dapibus vel elementum in, pharetra quis odio. Integer eget lacus est. Morbi blandit erat nec euismod blandit. Donec dolor neque, congue eu nisi ac, aliquet congue nibh. Sed pellentesque, risus vel hendrerit ullamcorper, erat quam rhoncus nibh, ut aliquet purus nibh rutrum est. Maecenas vitae velit nisi. Proin mattis mattis diam sit amet lacinia. In accumsan sagittis cursus. Duis sit amet convallis sapien. Etiam tortor turpis, porttitor eget urna non, finibus consequat ex. Sed cursus turpis sit amet pharetra ornare. Proin rutrum, sapien sit amet dapibus tristique, dolor metus porttitor sapien, feugiat blandit ipsum ipsum a lacus.
                </span>
                <div class="d-flex">
                    <div>
                        <asp:LinkButton runat="server" OnClick="ToggleLeido">
                            <i class="fa-solid fa-envelope rounded-5 p-2 me-1 hover-font" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Marcar como leído" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                    <div>
                        <asp:LinkButton runat="server" OnClick="EliminarCorreo">
                            <i class="fa-solid fa-trash-can rounded-5 hover-font p-2 me-1" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Eliminar" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                    <div>
                        <asp:LinkButton runat="server" OnClick="ArchivarCorreo">
                            <i class="fa-solid fa-box-archive rounded-5 hover-font p-2 me-1" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Archivar" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                </div>
            </li>
            <li class="list-group-item bg-dark text-white d-flex justify-content-between">
                <span>A second item</span>
                <div class="d-flex">
                    <div>
                        <asp:LinkButton runat="server" OnClick="ToggleLeido">
            <i class="fa-solid fa-envelope rounded-5 p-2 me-1 hover-font" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Marcar como leído" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                    <div>
                        <asp:LinkButton runat="server" OnClick="EliminarCorreo">
            <i class="fa-solid fa-trash-can rounded-5 hover-font p-2 me-1" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Eliminar" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                </div>
            </li>
            <li class="list-group-item bg-dark text-white d-flex justify-content-between">
                <span>A third item</span>
                <div class="d-flex">
                    <div>
                        <asp:LinkButton runat="server" OnClick="ToggleLeido">
            <i class="fa-solid fa-envelope rounded-5 p-2 me-1 hover-font" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Marcar como leído" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                    <div>
                        <asp:LinkButton runat="server" OnClick="EliminarCorreo">
            <i class="fa-solid fa-trash-can rounded-5 hover-font p-2 me-1" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Eliminar" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                </div>
            </li>
            <li class="list-group-item bg-dark text-white d-flex justify-content-between">
                <span>A fourth item</span>
                <div class="d-flex">
                    <div>
                        <asp:LinkButton runat="server" OnClick="ToggleLeido">
            <i class="fa-solid fa-envelope rounded-5 p-2 me-1 hover-font" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Marcar como leído" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                    <div>
                        <asp:LinkButton runat="server" OnClick="EliminarCorreo">
            <i class="fa-solid fa-trash-can rounded-5 hover-font p-2 me-1" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Eliminar" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                </div>
            </li>
            <li class="list-group-item bg-dark text-white d-flex justify-content-between">
                <span>And a fifth one</span>
                <div class="d-flex">
                    <div>
                        <asp:LinkButton runat="server" OnClick="ToggleLeido">
            <i class="fa-solid fa-envelope rounded-5 p-2 me-1 hover-font" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Marcar como leído" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                    <div>
                        <asp:LinkButton runat="server" OnClick="EliminarCorreo">
            <i class="fa-solid fa-trash-can rounded-5 hover-font p-2 me-1" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Eliminar" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                </div>
            </li>
            <li class="list-group-item bg-dark text-white d-flex justify-content-between">
                <span>An item</span>
                <div class="d-flex">
                    <div>
                        <asp:LinkButton runat="server" OnClick="ToggleLeido">
            <i class="fa-solid fa-envelope rounded-5 p-2 me-1 hover-font" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Marcar como leído" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                    <div>
                        <asp:LinkButton runat="server" OnClick="EliminarCorreo">
            <i class="fa-solid fa-trash-can rounded-5 hover-font p-2 me-1" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Eliminar" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                </div>
            </li>
            <li class="list-group-item bg-dark text-white d-flex justify-content-between">
                <span>A second item</span>
                <div class="d-flex">
                    <div>
                        <asp:LinkButton runat="server" OnClick="ToggleLeido">
            <i class="fa-solid fa-envelope rounded-5 p-2 me-1 hover-font" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Marcar como leído" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                    <div>
                        <asp:LinkButton runat="server" OnClick="EliminarCorreo">
            <i class="fa-solid fa-trash-can rounded-5 hover-font p-2 me-1" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Eliminar" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                </div>
            </li>
            <li class="list-group-item bg-dark text-white d-flex justify-content-between">
                <span>A third item</span>
                <div class="d-flex">
                    <div>
                        <asp:LinkButton runat="server" OnClick="ToggleLeido">
            <i class="fa-solid fa-envelope rounded-5 p-2 me-1 hover-font" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Marcar como leído" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                    <div>
                        <asp:LinkButton runat="server" OnClick="EliminarCorreo">
            <i class="fa-solid fa-trash-can rounded-5 hover-font p-2 me-1" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Eliminar" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                </div>
            </li>
            <li class="list-group-item bg-dark text-white d-flex justify-content-between">
                <span>A fourth item</span>
                <div class="d-flex">
                    <div>
                        <asp:LinkButton runat="server" OnClick="ToggleLeido">
            <i class="fa-solid fa-envelope rounded-5 p-2 me-1 hover-font" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Marcar como leído" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                    <div>
                        <asp:LinkButton runat="server" OnClick="EliminarCorreo">
            <i class="fa-solid fa-trash-can rounded-5 hover-font p-2 me-1" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Eliminar" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                </div>
            </li>
            <li class="list-group-item bg-dark text-white d-flex justify-content-between">
                <span>And a fifth one</span>
                <div class="d-flex">
                    <div>
                        <asp:LinkButton runat="server" OnClick="ToggleLeido">
            <i class="fa-solid fa-envelope rounded-5 p-2 me-1 hover-font" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Marcar como leído" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                    <div>
                        <asp:LinkButton runat="server" OnClick="EliminarCorreo">
            <i class="fa-solid fa-trash-can rounded-5 hover-font p-2 me-1" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Eliminar" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                </div>
            </li>
            <li class="list-group-item bg-dark text-white d-flex justify-content-between">
                <span>An item</span>
                <div class="d-flex">
                    <div>
                        <asp:LinkButton runat="server" OnClick="ToggleLeido">
            <i class="fa-solid fa-envelope rounded-5 p-2 me-1 hover-font" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Marcar como leído" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                    <div>
                        <asp:LinkButton runat="server" OnClick="EliminarCorreo">
            <i class="fa-solid fa-trash-can rounded-5 hover-font p-2 me-1" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Eliminar" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                </div>
            </li>
            <li class="list-group-item bg-dark text-white d-flex justify-content-between">
                <span>A second item</span>
                <div class="d-flex">
                    <div>
                        <asp:LinkButton runat="server" OnClick="ToggleLeido">
            <i class="fa-solid fa-envelope rounded-5 p-2 me-1 hover-font" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Marcar como leído" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                    <div>
                        <asp:LinkButton runat="server" OnClick="EliminarCorreo">
            <i class="fa-solid fa-trash-can rounded-5 hover-font p-2 me-1" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Eliminar" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                </div>
            </li>
            <li class="list-group-item bg-dark text-white d-flex justify-content-between">
                <span>A third item</span>
                <div class="d-flex">
                    <div>
                        <asp:LinkButton runat="server" OnClick="ToggleLeido">
            <i class="fa-solid fa-envelope rounded-5 p-2 me-1 hover-font" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Marcar como leído" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                    <div>
                        <asp:LinkButton runat="server" OnClick="EliminarCorreo">
            <i class="fa-solid fa-trash-can rounded-5 hover-font p-2 me-1" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Eliminar" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                        </asp:LinkButton>
                    </div>
                </div>
            </li>
        </ul>--%>
    </main>
</asp:Content>
