document.getElementById("ButtonEnviar").addEventListener('click', () => {
    let destino = $("#TextBoxDestino").val(),
        asunto = $("#TextBoxAsunto").val(),
        mensaje = $("#TextBoxMensaje").val();

    $.ajax({
        url: '/controller.aspx',
        headers: { "X-Test-Header": "validar-campos" },
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
            }
            else {
                Swal.fire({
                    icon: 'success',
                    title: 'Correo enviado exitosamente',
                    confirmButtonText: 'Ok',
                })
            }
        },
        error: function (data) {
            console.log(data);
        }
    })
})