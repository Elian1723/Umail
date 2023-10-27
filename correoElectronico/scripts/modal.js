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