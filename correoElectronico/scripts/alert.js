// ----- Incorrectos -----
function showUserIncorrect() {
    Swal.fire({
        title: 'Credenciales incorrectas',
        icon: 'error',
        confirmButtonText: 'Ok'
    });
}

function showDestinyNotExist() {
    Swal.fire({
        title: 'No se encontró el destinatario',
        text: 'Su mensaje se moverá a borradores',
        icon: 'error',
        confirmButtonText: 'Ok'
    });
}

function showEmailIncorrect() {
    Swal.fire({
        title: 'El correo ingresado es incorrecto',
        icon: 'error',
        confirmButtonText: 'Ok'
    });
}

// ----- Requeridos -----
function showPasswordRequired() {
    Swal.fire({
        title: 'Campos incompletos',
        icon: 'warning',
        text: 'Si ingresa una contraseña debe rellenar todos los campos de contraseña',
        confirmButtonText: 'Ok'
    });
}

function showPasswordIncorrect() {
    Swal.fire({
        title: 'Las contraseñas no coinciden',
        icon: 'warning',
        confirmButtonText: 'Ok'
    });
}

function showRequiredFields() {
    Swal.fire({
        title: 'Campos incompletos',
        icon: 'warning',
        confirmButtonText: 'Ok'
    });
}

// ----- Correctos -----
function showChangesSaved() {
    Swal.fire({
        title: 'Cambios guardados',
        icon: 'success',
        confirmButtonText: 'Ok'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = "./DashboardPages/Recibidos.aspx";
        }
    });
}

function showUserCreated() {
    Swal.fire({
        title: 'Usuario creado exitosamente',
        icon: 'success',
        confirmButtonText: 'Ok'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = "./Login.aspx";
        }
    })
}

// ----- Otros -----
function showUserExist() {
    Swal.fire({
        title: 'Ya existe un usuario con este correo',
        icon: 'info',
        confirmButtonText: 'Ok'
    });
}