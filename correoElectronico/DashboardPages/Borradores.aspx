<%@ Page Title="Borradores" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Borradores.aspx.cs" Inherits="correoElectronico.DashboardPages.Borradores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <script src="../scripts/toast.js"></script>
    <script src="../scripts/alert.js"></script>
    <script src="../scripts/modal.js"></script>
    <main>
        <h1 class="ms-3 ms-sm-0 mb-3 text-white">Borradores</h1>
        <div class="w-100 row mt-5 d-flex justify-content-center" runat="server" id="ImgEmpty">
            <div class="mt-5 d-flex justify-content-center col-8 col-sm-7 col-md-6 col-lg-4 col-xl-3">
                <img src="/Media/faq.png" alt="Empty" class="w-100" />
            </div>
            <h1 class="text-center fs-2 mt-3">Vaya... Al parecer no hay nada por aquí</h1>
        </div>
        <div runat="server" id="GridViewContainer" class="table-responsive">
            <asp:GridView ID="GridViewCorreos" runat="server" CssClass="table table-dark table-hover" AutoGenerateColumns="false" OnRowCommand="GridViewCorreos_RowCommand" OnRowDataBound="GridViewCorreos_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID Borrador" />
                    <asp:BoundField DataField="id_propietario" HeaderText="ID Propietario" />
                    <asp:TemplateField HeaderStyle-CssClass="w-5">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonVerCorreo" runat="server" CommandName="Editar" CommandArgument="<%# Container.DataItemIndex.ToString()%>">

                                <i class="fa-solid fa-pen-to-square rounded-5 p-2 me-1" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Seguir editando" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="destino" HeaderText="Destino" HeaderStyle-CssClass="w-25" ItemStyle-CssClass="fw-bold" />
                    <asp:BoundField DataField="asunto" HeaderText="Asunto" HeaderStyle-CssClass="w-25" ItemStyle-CssClass="fw-bold" />
                    <asp:BoundField DataField="mensaje" HeaderText="Mensaje" HeaderStyle-CssClass="w-50" />
                    <asp:TemplateField ItemStyle-CssClass="" HeaderStyle-CssClass="w-25">
                        <ItemTemplate>
                            <div class="d-flex">
                                <div class="d-flex">
                                    <asp:LinkButton runat="server" CommandName="Eliminar" CommandArgument="<%# Container.DataItemIndex.ToString()%>">
                                    <i class="fa-solid fa-trash-can rounded-5 p-2 me-1 hover-icon" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Eliminar" data-bs-placement="top" data-bs-delay='{"show": 400, "hide": 0}'></i>
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
                    <div class="w-100 d-flex align-items-center">
                        <h1 class="modal-title fs-4" id="labelModalRedactar">Nuevo Correo</h1>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="form-floating mb-3">
                        <asp:TextBox ID="TextBoxDestino" runat="server" CssClass="form-control bg-dark text-white custom-form-control textbox-redactar" placeholder="" TextMode="Email" />
                        <asp:Label Text="Destino:" runat="server" AssociatedControlID="TextBoxDestino" CssClass="text-white" />
                    </div>

                    <div class="form-floating bg-dark mb-3">
                        <asp:TextBox ID="TextBoxAsunto" runat="server" CssClass="form-control bg-dark text-white custom-form-control textbox-redactar" placeholder="" />
                        <asp:Label Text="Asunto:" runat="server" AssociatedControlID="TextBoxAsunto" CssClass="text-white" />
                    </div>

                    <div class="form-floating mb-3">
                        <asp:TextBox ID="TextBoxMensaje" runat="server" TextMode="MultiLine" CssClass="form-control bg-dark text-white custom-form-control h-100 textbox-redactar" placeholder="" />
                        <asp:Label Text="Mensaje:" runat="server" AssociatedControlID="TextBoxMensaje" CssClass="text-white" />
                    </div>
                </div>
                <div class="modal-footer border-0 d-flex justify-content-between">
                    <div>
                        <h1 class="text-muted fs-5">Borrador</h1>
                    </div>
                    <div>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <asp:Button Text="Enviar" type="button" CssClass="btn btn-danger" runat="server" ID="ButtonEnviarBorrador" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
