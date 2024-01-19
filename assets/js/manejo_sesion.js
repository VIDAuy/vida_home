$(document).ready(function () {

    validarSesionUsuario();

});


function validarSesionUsuario() {
    let id = localStorage.getItem("id");
    let usuario = localStorage.getItem("usuario");
    let tipo = localStorage.getItem("tipo");
    let hash = localStorage.getItem("hash");

    $.ajax({
        type: "POST",
        url: `${url_app_ajax}/verificar_usuario.php`,
        data: {
            id: id,
            usuario: usuario,
            tipo: tipo,
            hash: hash
        },
        dataType: "JSON",
        success: function (response) {
            if (response.error === false) {
                correcto_pasajero(response.mensaje);
            } else {
                error(response.mensaje);
                location.href = `${url_app}/login.html`;
            }
        }
    });
}

function cerrar_sesion() {
    localStorage.clear();
    location.href = `${url_app}/login.html`;
}