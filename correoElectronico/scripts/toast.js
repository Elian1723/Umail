function showToastEnviado() {
    const toastEnviado = document.getElementById('toastMensajeEnviado');
    const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastEnviado);
    toastBootstrap.show();
}

function showToastLeido() {
    const toastLeido = document.getElementById('toastMensajeLeido');
    const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLeido);
    toastBootstrap.show();
}

function showToastNoLeido() {
    const toastNoLeido = document.getElementById('toastMensajeNoLeido');
    const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastNoLeido);
    toastBootstrap.show();
}

function showToastEliminado() {
    const toastEliminado = document.getElementById('toastMensajeEliminado');
    const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastEliminado);
    toastBootstrap.show();
}

function showToastArchivado() {
    const toastArchivado = document.getElementById('toastMensajeArchivado');
    const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastArchivado);
    toastBootstrap.show();
}