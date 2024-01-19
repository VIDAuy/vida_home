$(document).ready(function () {

    validarSesion();

    document.getElementById("mostrar_login").style.display = "block";

});


function validarSesion() {
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
                location.href = `${url_app}/index.html`;
            } else {
                gestionarLocalStorage();
            }
        }
    });
}


function ingresar() {
    let usuario = $("#txt_usuario").val();
    let password = $("#txt_password").val();

    $.ajax({
        type: "POST",
        url: `${url_app_ajax}/login.php`,
        data: {
            usuario: usuario,
            password: password
        },
        dataType: "JSON",
        success: function (response) {
            if (response.error === false) {
                correcto(response.mensaje);

                let datos = response.datos;
                gestionarLocalStorage(datos);

                location.href = `${url_app}/index.html`;
            } else {
                error(response.mensaje);
            }
        }
    });
}


function gestionarLocalStorage(datos = null) {
    if (datos === null) {
        localStorage.clear();
    } else {
        let id = datos["id"];
        let nombre = datos["nombre"];
        let apellido = datos["apellido"];
        let id_area = datos["id_area"];
        let area = datos["area"];
        let departamento = datos["departamento"];
        let usuario = datos["usuario"];
        let tipo = datos["tipo"];
        let hash = datos["hash"];

        localStorage.setItem("id", id);
        localStorage.setItem("nombre", nombre);
        localStorage.setItem("apellido", apellido);
        localStorage.setItem("id_area", id_area);
        localStorage.setItem("area", area);
        localStorage.setItem("departamento", departamento);
        localStorage.setItem("usuario", usuario);
        localStorage.setItem("tipo", tipo);
        localStorage.setItem("hash", hash);
        localStorage.setItem("status", "ok");
    }

}