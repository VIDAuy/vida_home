$(document).ready(function () {

    mostrar_marcadores();

});



function mostrar_marcadores() {
    let id_area = localStorage.getItem("id_area");
    let id_usuario = localStorage.getItem("id");
    document.getElementById("td_tabla_menu").innerHTML = "";

    $.ajax({
        type: "GET",
        url: `${url_app_ajax_cliente}/mostrar_marcadores.php`,
        data: {
            id_area: id_area,
            id_usuario: id_usuario
        },
        dataType: "JSON",
        success: function (response) {
            response.map((val) => {
                document.getElementById("td_tabla_menu").innerHTML += val;
            });
        }
    });
}


function abrir_modal_seguridad_informacion() {
    listar_material_seguridad_informacion();
    abrirModal('modal_materialSeguridadInformacion');
}

function listar_material_seguridad_informacion() {

    document.getElementById("listar_material_seguridad_informacion").innerHTML = "";

    $.ajax({
        type: "GET",
        url: `${url_app_ajax_cliente}/listar_material_iso.php`,
        dataType: "JSON",
        success: function (response) {
            let datos = response.datos;
            datos.map((val) => {
                document.getElementById("listar_material_seguridad_informacion").innerHTML += val;
            });
        }
    });
}