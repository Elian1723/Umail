document.getElementById("ButtonEnviar").addEventListener('click', () => {
    let destino = $("#TextBoxDestino").val(),
        asunto = $("#TextBoxAsunto").val(),
        mensaje = $("#TextBoxMensaje").val();

    $.ajax({
        url: '/controller.aspx',
        headers: { "X-Test-Header": "enviar-borrador" },
        data: { address: destino, subject: asunto, message: mensaje },
        type: "post",
        success: function (data, textStatus, request) {
            if (data.substring(0, 5) === "error") {
                if (request.getResponseHeader("X-Test-Header") == "camposVacios") {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Todos los campos son requeridos',
                        confirmButtonText: 'Ok',
                    })
                } else if (request.getResponseHeader("X-Test-Header") == "destinoNoExiste") {
                    Swal.fire({
                        icon: 'error',
                        title: 'El destinatario no existe',
                        confirmButtonText: 'Ok',
                    })
                }
                else if (request.getResponseHeader("X-Test-Header") == "mensajeLargo") {
                    Swal.fire({
                        icon: 'error',
                        title: 'El mensaje es demasiado largo',
                        confirmButtonText: 'Ok',
                    })
                }
            }
            else {
                hideModalRedactar();
                showToastEnviado();

                $("#TextBoxDestino").val("");
                $("#TextBoxAsunto").val("");
                $("#TextBoxMensaje").val("");
            }
        },
        error: function (data) {
            console.log("Ocurrió un error insperado");
        }
    })
})

function hideModalRedactar() {
    $('#modalRedactar').modal('hide')
}

function showToastEnviado() {
    const customToast = document.getElementById('toastMensajeEnviado');
    const toastBootstrap = bootstrap.Toast.getOrCreateInstance(customToast);
    toastBootstrap.show();
}