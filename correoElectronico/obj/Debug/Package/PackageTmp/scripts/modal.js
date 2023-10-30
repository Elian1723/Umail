function showModalCorreo() {
    const myModal = document.getElementById('modalMensaje');
    const modal = new bootstrap.Modal(myModal);
    modal.show();
}

function showModalRedactar(destino, asunto) {
    const myModal = document.getElementById('modalRedactar');
    const modal = new bootstrap.Modal(myModal);
    modal.show();

    const textBoxDestino = document.getElementById("TextBoxDestino");
    textBoxDestino.value = destino;

    const textBoxAsunto = document.getElementById("TextBoxAsunto");
    textBoxAsunto.value = asunto;
}

function showModalEditar(destino, asunto, mensaje) {
    const myModal = document.getElementById('modalRedactar');
    const modal = new bootstrap.Modal(myModal);
    modal.show();

    const textBoxDestino = document.getElementById("TextBoxDestino");
    textBoxDestino.value = destino;

    const textBoxAsunto = document.getElementById("TextBoxAsunto");
    textBoxAsunto.value = asunto;

    const textBoxMensaje = document.getElementById("TextBoxMensaje");
    textBoxMensaje.value = mensaje;
}

$('#modalRedactar').on('hidden.bs.modal', function (event) {
    const textBoxDestino = document.getElementById("TextBoxDestino");
    textBoxDestino.value = "";

    const textBoxAsunto = document.getElementById("TextBoxAsunto");
    textBoxAsunto.value = "";

    const textBoxMensaje = document.getElementById("TextBoxMensaje");
    textBoxMensaje.value = "";
})