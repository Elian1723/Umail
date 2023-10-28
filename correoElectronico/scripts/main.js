const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

const navSideBar = document.getElementById("nav-sidebar");
const iconsItem = document.querySelectorAll(".icon-item");
const containersItem = document.querySelectorAll(".container-item");
const spanItem = document.querySelectorAll(".span-item");
const badgeBlock = document.querySelectorAll(".badge-custom-block");
const badgeAbsolute = document.querySelectorAll(".badge-custom-absolute");
const content = document.getElementById("Content");

document.getElementById("LinkButtonMenu").addEventListener("click", async e => {
    e.preventDefault();
    if (navSideBar.classList.contains("nav-contraido")) {
        navSideBar.classList.remove("nav-contraido");
        navSideBar.classList.add("nav-expandido");

        spanItem.forEach(span => {
            setTimeout(() => {
                span.classList.toggle("d-none");
            }, 270)
        })

        badgeBlock.forEach(badge => {
            badge.classList.toggle("d-none");
        })

        badgeAbsolute.forEach(badge => {
            badge.classList.toggle("d-none");
        })
    }
    else {
        spanItem.forEach(span => {
            span.classList.toggle("d-none");
        })

        badgeBlock.forEach(badge => {
            setTimeout(() => {
                badge.classList.toggle("d-none");
            }, 150)
        })

        badgeAbsolute.forEach(badge => {
            setTimeout(() => {
                badge.classList.toggle("d-none");
            }, 150)
        })

        navSideBar.classList.remove("nav-expandido");
        navSideBar.classList.add("nav-contraido");
    }

    if (window.matchMedia("(max-width: 576px)").matches)
        content.classList.toggle("d-none");

    iconsItem.forEach(icon => {
        icon.classList.toggle("hover-sidebar");
    })

    containersItem.forEach(container => {
        container.classList.toggle("hover-sidebar");
    })

    document.getElementById("icon-redactar").classList.toggle("btn-danger");
    document.getElementById("container-redactar").classList.toggle("btn-danger");
});

const buttonsPrevent = document.querySelectorAll(".prevent-default");

buttonsPrevent.forEach(button => {
    button.addEventListener("click", e => {
        e.preventDefault();
    })
});

const toastTrigger = document.querySelectorAll(".ButtonEliminarEmail");
const toastEliminado = document.getElementById('toastMensajeEliminado');

if (toastTrigger.length > 0) {
    const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastEliminado)

    toastTrigger.forEach(trigger => {
        trigger.addEventListener('click', () => {
            toastBootstrap.show();
        })
    })
}

let destino = "";
document.getElementById("TextBoxDestino").addEventListener("keyup", e => {
    destino = e.target.value;
});

let asunto = "";
document.getElementById("TextBoxAsunto").addEventListener("keyup", e => {
    asunto = e.target.value;
});

let mensaje = "";
document.getElementById("TextBoxMensaje").addEventListener("keyup", e => {
    mensaje = e.target.value;
});

//const ValidarCampos = async () => {
//    if (destino == null || destino == "" || destino == NaN)
//        return true;
//    else if (asunto == null || asunto == "" || asunto == NaN)
//        return true;
//    else if (mensaje == null || mensaje == "" || mensaje == NaN)
//        return true;
//    else
//        return false;
//}


//document.getElementById("ButtonEnviar").addEventListener("click", e => {
//    ValidarCampos().then(response => {
//        if (response) {
//            Swal.fire({
//                title: 'Campos incompletos',
//                icon: 'warning',
//                confirmButtonText: 'Ok'
//            })

//            e.preventDefault();
//        }
//    });
//});