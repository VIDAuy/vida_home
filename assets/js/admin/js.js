$(document).ready(function () {

    let tipo = localStorage.getItem('tipo') == 1 ? "admin" : "cliente";

    let partials = [];

    for (let i in partials) {
        cargarPartial(`partials/${tipo}`, partials[i]);
    }
});


function buscarSocio() {
    let cedula = $("#txt_cedula_ingresada").val();

    document.getElementById("siEsSocio").style.display = "none";
    document.getElementById("noEsSocio").style.display = "none";
    document.getElementById("noEsSocioRegistro").style.display = "none";


    $.ajax({
        type: "GET",
        url: `${url_app_ajax}/cargar_datos_socios.php?cedula=${cedula}`,
        dataType: "JSON",
        success: function (response) {
            console.log(response);
            if (response.error === false) {

                $("#txt_cedula_socio").text(cedula);

                llenar_select_avisar_a();

                if (response.siEsSocio === true) {
                    let datos = response.datos;
                    let fecha_afiliacion = datos['fecha_afiliacion'];
                    let nombre = datos['nombre'];
                    let radio = datos['radio'];
                    let sucursal = datos['sucursal'];
                    let telefono = datos['telefono'];
                    let inspira = datos['inspira'];

                    $("#txt_nombre_completo_socio").text(nombre);
                    $("#txt_fecha_afiliacion_socio").text(fecha_afiliacion);
                    $("#txt_sucursal_socio").text(sucursal);
                    $("#txt_telefono_socio").text(telefono);
                    $("#txt_radio_socio").text(radio);
                    $("#txt_inspira_socio").text(inspira);

                    document.getElementById("siEsSocio").style.display = "block";
                } else if (response.noEsSocio === true) {
                    warning(response.mensaje);
                    document.getElementById("noEsSocio").style.display = "block";
                } else if (response.noEsSocioRegistro === true) {
                    let datos = response.datos;
                    let nombre = datos['nombre'];
                    let telefono = datos['telefono'];

                    $("#txt_nombre_noSocioConRegistros").text(nombre);
                    $("#text_telefono_noSocioConRegistros").text(telefono);

                    warning(response.mensaje);

                    document.getElementById("noEsSocioRegistro").style.display = "block";
                }
            } else {
                error(response.mensaje);
            }
        }
    });

}


function llenar_select_avisar_a() {

    $(".agregarFiliales").empty();
    let primera_linea = '<option selected value="">No avisar</option>';
    $(primera_linea).appendTo(".agregarFiliales");

    $.ajax({
        url: `${url_app_ajax}/obtener_avisar_a.php`,
        dataType: "JSON",
        success: function (r) {
            $.each(r.datos, function (i, v) {
                let nuevaLinea = '<option value="' + v.id + '">' + v.usuario + "</option>";
                $(nuevaLinea).appendTo(".agregarFiliales");
            });
        },
    });
}


function ocultarInformacion() {
    if ($("#txt_cedula_ingresada").val() != $("txt_cedula_socio").text()) {
        document.getElementById("siEsSocio").style.display = "none";
        document.getElementById("noEsSocio").style.display = "none";
        document.getElementById("noEsSocioRegistro").style.display = "none";
    }
}