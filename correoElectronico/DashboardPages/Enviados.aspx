<%@ Page Title="Enviados" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Enviados.aspx.cs" Inherits="correoElectronico.DashboardPages.Enviados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <script src="../scripts/toast.js"></script>
    <script src="../scripts/alert.js"></script>
    <script src="../scripts/modal.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
    <main>
        <div class="w-100 d-flex justify-content-between align-items-center">
            <h1 class="d-block ms-3 ms-sm-0 mb-3 text-white">Enviados</h1>
            <asp:LinkButton runat="server" CssClass="me-3" OnClick="CargarCorreos">
        <i class="fa-solid fa-rotate-right fs-5 rounded-5 p-2 me-1 hover-icon text-white" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Actualizar" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
            </asp:LinkButton>
        </div>
        <div class="w-100 row mt-5 d-flex justify-content-center" runat="server" id="ImgEmpty">
            <div class="mt-5 d-flex justify-content-center col-8 col-sm-7 col-md-6 col-lg-4 col-xl-3">
                <img src="/Media/faq.png" alt="Empty" class="w-100" />
            </div>
            <h1 class="text-center fs-2 mt-3">Vaya... Al parecer no hay nada por aquí</h1>
        </div>
        <div runat="server" id="GridViewContainer" class="table-responsive">
            <asp:GridView ID="GridViewCorreos" runat="server" CssClass="table table-dark table-hover" AutoGenerateColumns="false" OnRowCommand="GridViewCorreos_RowCommand" OnRowDataBound="GridViewCorreos_RowDataBound" AllowPaging="true" PageSize="11" OnPageIndexChanging="GridViewCorreos_PageIndexChanging" PagerStyle-CssClass="pagination">
                <Columns>
                    <asp:BoundField DataField="id_cc" HeaderText="ID de correo" />
                    <asp:BoundField DataField="id_correo" HeaderText="ID de correo" />
                    <asp:BoundField DataField="leido" HeaderText="ID de correo" />
                    <asp:TemplateField HeaderStyle-CssClass="w-5">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonVerCorreo" CssClass="bg-transparent" runat="server" CommandName="Ver" CommandArgument="<%# Container.DataItemIndex.ToString()%>">
                                <i class="fa-solid fa-eye rounded-5 p-2 me-1" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Ver correo" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" HeaderStyle-CssClass="w-10" ItemStyle-CssClass="fw-bold" />
                    <asp:BoundField DataField="apellido" HeaderText="Apellido" />
                    <asp:BoundField DataField="asunto" HeaderText="Asunto" HeaderStyle-CssClass="w-10" ItemStyle-CssClass="fw-bold" />
                    <asp:BoundField DataField="mensaje" HeaderText="Mensaje" HeaderStyle-CssClass="w-75" />
                    <asp:BoundField DataField="fecha" HeaderText="Fecha" DataFormatString="{0:dd-MM-yyyy}" />
                    <asp:TemplateField ItemStyle-CssClass="" HeaderStyle-CssClass="w-25">
                        <ItemTemplate>
                            <div class="d-flex">
                                <div>
                                    <asp:LinkButton runat="server" CssClass="bg-transparent" CommandName="Leido" CommandArgument="<%# Container.DataItemIndex.ToString()%>">
                                        <i class="fa-solid fa-envelope rounded-5 p-2 me-1 hover-icon" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Marcar como leído" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                                    </asp:LinkButton>
                                </div>
                                <div class="d-flex">
                                    <asp:LinkButton runat="server" CssClass="bg-transparent" CommandName="Eliminado" CommandArgument="<%# Container.DataItemIndex.ToString()%>">
                                        <i class="fa-solid fa-trash-can rounded-5 p-2 me-1 hover-icon" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Eliminar" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                                    </asp:LinkButton>
                                </div>
                                <div class="d-flex">
                                    <asp:LinkButton runat="server" CssClass="bg-transparent" CommandName="Archivar" CommandArgument="<%# Container.DataItemIndex.ToString()%>">
                                        <i class="fa-solid fa-box-archive rounded-5 p-2 me-1 hover-icon" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Archivar" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </main>

    <%--Modales--%>
    <div class="modal fade" id="modalMensaje" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-fullscreen-sm-down modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content bg-dark">
                <div class="modal-header d-flex flex-column">
                    <div class="w-100 d-flex flex-column justify-items-center">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <asp:Label ID="LabelDate" runat="server" />
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="d-flex align-items-center">
                            <asp:Label ID="LabelOrigen" runat="server" CssClass="fs-5 fw-bold" />
                            <asp:Label ID="LabelEmail" runat="server" CssClass="ms-3" />
                        </div>
                        <div>
                            <asp:Label ID="LabelAsunto" runat="server" CssClass="fs-5" />
                        </div>
                    </div>
                </div>
                <div class="modal-body">
                    <div>
                        <asp:Label ID="LabelMensaje" runat="server" />
                    </div>
                </div>
                <div class="modal-footer border-0 d-flex justify-content-between">
                    <div>
                        <asp:Label ID="LabelIDCorreo" runat="server" CssClass="text-muted" />
                    </div>
                    <div>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <asp:Button Text="Enviar otro correo" type="button" CssClass="btn btn-danger" runat="server" ID="ButtonResponder" OnClick="ButtonResponder_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../scripts/pagination.js"></script>
</asp:Content>
