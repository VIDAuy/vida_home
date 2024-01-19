$(document).ready(function () {

    mostrar_marcadores();
    tabla_usuarios();
    tabla_filiales();
    tabla_marcadores();
    tabla_marcadores_x_area();
    tabla_marcadores_x_persona();

});



/** TABLAS **/
function tabla_usuarios() {
    $('#tabla_usuarios').DataTable({
        ajax: `${url_app_ajax_cliente}/infraestructura/usuarios/listado_usuarios.php`,
        columns: [
            { data: 'id' },
            { data: 'cedula' },
            { data: 'interno' },
            { data: 'nombre' },
            { data: 'apellido' },
            { data: 'area' },
            { data: 'email' },
            { data: 'departamento' },
            { data: 'acciones' },
        ],
        "order": [[0, 'asc']],
        "bDestroy": true,
        language: { url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json' },
    });
}

function tabla_emails(id) {
    $('#tabla_administrar_emails').DataTable({
        ajax: `${url_app_ajax_cliente}/infraestructura/usuarios/listado_emails.php?id=${id}`,
        columns: [
            { data: 'id' },
            { data: 'email' },
            { data: 'acciones' },
        ],
        "order": [[0, 'asc']],
        "bDestroy": true,
        language: { url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json' },
    });
}

function tabla_internos_usuarios(id) {
    $('#tabla_administrar_internos_usuario').DataTable({
        ajax: `${url_app_ajax_cliente}/infraestructura/usuarios/listado_internos.php?id=${id}`,
        columns: [
            { data: 'id' },
            { data: 'interno' },
            { data: 'acciones' },
        ],
        "order": [[0, 'asc']],
        "bDestroy": true,
        language: { url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json' },
    });
}

function tabla_filiales() {
    $('#tabla_filiales').DataTable({
        ajax: `${url_app_ajax_cliente}/infraestructura/filiales/listado_filiales.php`,
        columns: [
            { data: 'id' },
            { data: 'nombre' },
            { data: 'interno' },
            { data: 'email' },
            { data: 'departamento' },
            { data: 'acciones' },
        ],
        "order": [[0, 'asc']],
        "bDestroy": true,
        language: { url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json' },
    });
}

function tabla_emails_filial(id) {
    $('#tabla_administrar_emails_filial').DataTable({
        ajax: `${url_app_ajax_cliente}/infraestructura/filiales/listado_emails_filial.php?id=${id}`,
        columns: [
            { data: 'id' },
            { data: 'email' },
            { data: 'acciones' },
        ],
        "order": [[0, 'asc']],
        "bDestroy": true,
        language: { url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json' },
    });
}

function tabla_internos_filial(id) {
    $('#tabla_administrar_internos_filial').DataTable({
        ajax: `${url_app_ajax_cliente}/infraestructura/filiales/listado_internos_filial.php?id=${id}`,
        columns: [
            { data: 'id' },
            { data: 'interno' },
            { data: 'acciones' },
        ],
        "order": [[0, 'asc']],
        "bDestroy": true,
        language: { url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json' },
    });
}

function tabla_marcadores() {
    $('#tabla_marcadores').DataTable({
        ajax: `${url_app_ajax_cliente}/infraestructura/marcadores/listar_marcadores.php`,
        columns: [
            { data: 'id' },
            { data: 'titulo' },
            { data: 'sub_titulo' },
            { data: 'imagen' },
            { data: 'link' },
            { data: 'variantes' },
            { data: 'acciones' },
        ],
        "order": [[0, 'asc']],
        "bDestroy": true,
        language: { url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json' },
    });
}

function tabla_marcadores_x_area() {
    $('#tabla_marcadores_x_area').DataTable({
        ajax: `${url_app_ajax_cliente}/infraestructura/marcadores_x_area/listado_marcadores_x_area.php`,
        columns: [
            { data: 'id' },
            { data: 'area' },
            { data: 'marcador' },
            { data: 'acciones' },
        ],
        "order": [[0, 'asc']],
        "bDestroy": true,
        language: { url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json' },
    });
}

function tabla_marcadores_x_persona() {
    $('#tabla_marcadores_x_persona').DataTable({
        ajax: `${url_app_ajax_cliente}/infraestructura/marcadores_x_persona/listado_marcadores_x_persona.php`,
        columns: [
            { data: 'id' },
            { data: 'cedula' },
            { data: 'nombre' },
            { data: 'apellido' },
            { data: 'marcador' },
            { data: 'acciones' },
        ],
        "order": [[0, 'asc']],
        "bDestroy": true,
        language: { url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json' },
    });
}
/** END TABLAS **/



/** LISTAR DATOS **/
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
/** END LISTAR DATOS **/



/** ABRIR MODAL **/
function abrir_modal_seguridad_informacion() {
    listar_material_seguridad_informacion();
    abrirModal('modal_materialSeguridadInformacion');
}
/** END ABRIR MODAL **/



/** LLENAR SELECT **/
function select_departamentos(opcion, div, id_departamento = null, nombre_departamento = null) {

    if (opcion == "Agregar") {

        document.getElementById(div).innerHTML = "<option value='' selected disabled>Seleccione un departamento</option>";

        $.ajax({
            type: "GET",
            url: `${url_app_ajax_cliente}/infraestructura/select_departamento.php`,
            dataType: "JSON",
            success: function (response) {
                let datos = response.datos;
                datos.map((val) => {
                    document.getElementById(div).innerHTML += `<option value="${val['id']}">${val['nombre']}</option>`;
                });
            }
        });
    } else {

        document.getElementById(div).innerHTML = `<option value='${id_departamento}' selected>${nombre_departamento}</option>`;

        $.ajax({
            type: "GET",
            url: `${url_app_ajax_cliente}/infraestructura/select_departamento.php?id_departamento=${id_departamento}`,
            dataType: "JSON",
            success: function (response) {
                let datos = response.datos;
                datos.map((val) => {
                    document.getElementById(div).innerHTML += `<option value="${val['id']}">${val['nombre']}</option>`;
                });
            }
        });
    }

}

function select_area(opcion, div, id_area = null, nombre_area = null) {

    if (opcion == "Agregar") {
        document.getElementById(div).innerHTML = "<option value='' selected disabled>Seleccione un área</option>";

        $.ajax({
            type: "GET",
            url: `${url_app_ajax_cliente}/infraestructura/select_area.php`,
            dataType: "JSON",
            success: function (response) {
                let datos = response.datos;
                datos.map((val) => {
                    document.getElementById(div).innerHTML += `<option value="${val['id']}">${val['nombre']}</option>`;
                });
            }
        });
    } else {
        document.getElementById(div).innerHTML = `<option value='${id_area}' selected>${nombre_area}</option>`;

        $.ajax({
            type: "GET",
            url: `${url_app_ajax_cliente}/infraestructura/select_area.php?id_area=${id_area}`,
            dataType: "JSON",
            success: function (response) {
                let datos = response.datos;
                datos.map((val) => {
                    document.getElementById(div).innerHTML += `<option value="${val['id']}">${val['nombre']}</option>`;
                });
            }
        });
    }
}

function select_marcadores(opcion, div, id_marcador = null, titulo_marcador = null) {

    if (opcion == "Agregar") {
        document.getElementById(div).innerHTML = "<option value='' selected disabled>Seleccione un marcador</option>";

        $.ajax({
            type: "GET",
            url: `${url_app_ajax_cliente}/infraestructura/select_marcador.php`,
            dataType: "JSON",
            success: function (response) {
                let datos = response.datos;
                datos.map((val) => {
                    document.getElementById(div).innerHTML += `<option value="${val['id']}">${val['titulo']}</option>`;
                });
            }
        });
    } else {
        document.getElementById(div).innerHTML = `<option value='${id_marcador}' selected>${titulo_marcador}</option>`;

        $.ajax({
            type: "GET",
            url: `${url_app_ajax_cliente}/infraestructura/select_marcador.php?id_marcador=${id_marcador}`,
            dataType: "JSON",
            success: function (response) {
                let datos = response.datos;
                datos.map((val) => {
                    document.getElementById(div).innerHTML += `<option value="${val['id']}">${val['titulo']}</option>`;
                });
            }
        });
    }
}

function select_variante_marcadores(opcion, div, id_variante = null, nombre_variante = null) {

    if (opcion == "Agregar") {
        document.getElementById(div).innerHTML = "<option value='' selected>Seleccione una variante</option>";

        $.ajax({
            type: "GET",
            url: `${url_app_ajax_cliente}/infraestructura/select_variantes_marcadores.php`,
            dataType: "JSON",
            success: function (response) {
                let datos = response.datos;
                datos.map((val) => {
                    document.getElementById(div).innerHTML += `<option value="${val['id']}">${val['nombre']}</option>`;
                });
            }
        });
    } else {
        document.getElementById(div).innerHTML = `<option value='${id_variante}' selected>${nombre_variante}</option>`;

        $.ajax({
            type: "GET",
            url: `${url_app_ajax_cliente}/infraestructura/select_variantes_marcadores.php?id_variante=${id_variante}`,
            dataType: "JSON",
            success: function (response) {
                let datos = response.datos;
                datos.map((val) => {
                    document.getElementById(div).innerHTML += `<option value="${val['id']}">${val['nombre']}</option>`;
                });
            }
        });
    }
}

function select_usuarios(opcion, div, id_usuario = null, nombre = null, apellido = null) {

    if (opcion == "Agregar") {
        document.getElementById(div).innerHTML = "<option value='' selected disabled>Seleccione un usuario</option>";

        $.ajax({
            type: "GET",
            url: `${url_app_ajax_cliente}/infraestructura/select_usuarios.php`,
            dataType: "JSON",
            success: function (response) {
                let datos = response.datos;
                datos.map((val) => {
                    document.getElementById(div).innerHTML += `<option value="${val['id']}">${val['nombre']} ${val['apellido']}</option>`;
                });
            }
        });
    } else {
        document.getElementById(div).innerHTML = `<option value='${id_usuario}' selected>${nombre} ${apellido}</option>`;

        $.ajax({
            type: "GET",
            url: `${url_app_ajax_cliente}/infraestructura/select_usuarios.php?id_usuario=${id_usuario}`,
            dataType: "JSON",
            success: function (response) {
                let datos = response.datos;
                datos.map((val) => {
                    document.getElementById(div).innerHTML += `<option value="${val['id']}">${val['nombre']} ${val['apellido']}</option>`;
                });
            }
        });
    }
}
/** END LLENAR SELECT **/



/** AGREGAR DATOS **/
function agregar_usuario(openModal = false) {
    if (openModal == true) {
        $("#txt_cedula_agregar").val('');
        $("#txt_nombre_agregar").val('');
        $("#txt_apellido_agregar").val('');
        emails_usuarios = [];
        document.getElementById("email_agregados_usuarios").innerHTML = "";
        internos_usuarios = [];
        document.getElementById("interno_agregados_usuarios").innerHTML = "";
        select_area("Agregar", "txt_area_agregar");
        select_departamentos("Agregar", "txt_departamento_agregar");
        abrirModal("modal_agregarUsuario");
    } else {
        let cedula = $("#txt_cedula_agregar").val();
        let nombre = $("#txt_nombre_agregar").val();
        let apellido = $("#txt_apellido_agregar").val();
        let area = document.getElementById('txt_area_agregar').value;
        let departamento = document.getElementById('txt_departamento_agregar').value;


        if (cedula == "") {
            error("Debe ingresar una cédula");
        } else if (internos_usuarios.length == 0) {
            error("Debe ingresar al menos un interno");
        } else if (nombre == "") {
            error("Debe ingresar un nombre");
        } else if (apellido == "") {
            error("Debe ingresar un apellido");
        } else if (area == "") {
            error("Debe seleccionar un área");
        } else if (departamento == "") {
            error("Debe seleccionar un departamento");
        } else if (emails_usuarios.length == 0) {
            error("Debe ingresar al menos un email");
        } else {

            $.ajax({
                type: "POST",
                url: `${url_app_ajax_cliente}/infraestructura/usuarios/agregar_usuario.php`,
                data: {
                    cedula: cedula,
                    interno: internos_usuarios,
                    nombre: nombre,
                    apellido: apellido,
                    area: area,
                    departamento: departamento,
                    emails: emails_usuarios
                },
                dataType: "JSON",
                beforeSend: function () {
                    mostrarLoader();
                },
                complete: function () {
                    mostrarLoader("O");
                },
                success: function (response) {
                    if (response.error === false) {
                        correcto(response.mensaje);
                        cerrarModal("modal_agregarUsuario");
                        $("#txt_cedula_agregar").val('');
                        $("#txt_interno_agregar").val('');
                        $("#txt_nombre_agregar").val('');
                        $("#txt_apellido_agregar").val('');
                        emails_usuarios = [];
                        document.getElementById("email_agregados_usuarios").innerHTML = "";
                        internos_usuarios = [];
                        document.getElementById("interno_agregados_usuarios").innerHTML = "";
                        tabla_usuarios();
                    } else {
                        error(response.mensaje);
                    }
                }
            });

        }
    }

}

function agregar_email_usuario(openModal = false) {
    if (openModal == true) {
        abrirModal("modal_agregarEmail");
        $("#txt_agregar_nuevo_email").val('');
    } else {
        let id_usuario = $("#txt_id_editar").val();
        let email = $("#txt_agregar_nuevo_email").val();

        if (id_usuario == "") {
            error("Error General");
        } else if (email == "") {
            error("Debe ingresar un email");
        } else {

            $.ajax({
                type: "POST",
                url: `${url_app_ajax_cliente}/infraestructura/usuarios/agregar_nuevo_email.php`,
                data: {
                    id_usuario: id_usuario,
                    email: email
                },
                dataType: "JSON",
                beforeSend: function () {
                    mostrarLoader();
                },
                complete: function () {
                    mostrarLoader("O");
                },
                success: function (response) {
                    if (response.error === false) {
                        correcto(response.mensaje);
                        cerrarModal("modal_agregarEmail");
                        tabla_emails(id_usuario);
                        tabla_usuarios();
                    } else {
                        error(response.mensaje);
                    }
                }
            });
        }
    }
}

function agregar_interno_usuario(openModal = false) {
    if (openModal == true) {
        abrirModal("modal_agregarInternoUsuario");
        $("#txt_agregar_nuevo_interno_usuario").val('');
    } else {
        let id_usuario = $("#txt_id_editar").val();
        let interno = $("#txt_agregar_nuevo_interno_usuario").val();

        if (id_usuario == "") {
            error("Error General");
        } else if (interno == "") {
            error("Debe ingresar un interno");
        } else {

            $.ajax({
                type: "POST",
                url: `${url_app_ajax_cliente}/infraestructura/usuarios/agregar_nuevo_interno.php`,
                data: {
                    id_usuario: id_usuario,
                    interno: interno
                },
                dataType: "JSON",
                beforeSend: function () {
                    mostrarLoader();
                },
                complete: function () {
                    mostrarLoader("O");
                },
                success: function (response) {
                    if (response.error === false) {
                        correcto(response.mensaje);
                        cerrarModal("modal_agregarInternoUsuario");
                        tabla_internos_usuarios(id_usuario);
                        tabla_usuarios();
                    } else {
                        error(response.mensaje);
                    }
                }
            });
        }
    }
}

function agregar_email_filial(openModal = false) {
    if (openModal == true) {
        abrirModal("modal_agregarEmailFilial");
        $("#txt_agregar_nuevo_email_filial").val('');
    } else {
        let id_filial = $("#txt_agregar_nuevo_id_filial").val();
        let email = $("#txt_agregar_nuevo_email_filial").val();


        if (id_filial == "") {
            error("Error General");
        } else if (email == "") {
            error("Debe ingresar un email");
        } else {

            $.ajax({
                type: "POST",
                url: `${url_app_ajax_cliente}/infraestructura/filiales/agregar_nuevo_email_filial.php`,
                data: {
                    id_filial: id_filial,
                    email: email
                },
                dataType: "JSON",
                beforeSend: function () {
                    mostrarLoader();
                },
                complete: function () {
                    mostrarLoader("O");
                },
                success: function (response) {
                    if (response.error === false) {
                        correcto(response.mensaje);
                        tabla_emails_filial(id_filial);
                        tabla_filiales();
                        cerrarModal("modal_agregarEmailFilial");
                    } else {
                        error(response.mensaje);
                    }
                }
            });
        }
    }
}

function agregar_interno_filial(openModal = false) {
    if (openModal == true) {
        abrirModal("modal_agregarInternoFilial");
        $("#txt_agregar_nuevo_interno_filial").val('');
    } else {
        let id_filial = $("#txt_agregar_nuevo_interno_id_filial").val();
        let interno = $("#txt_agregar_nuevo_interno_filial").val();


        if (id_filial == "") {
            error("Error General");
        } else if (interno == "") {
            error("Debe ingresar un email");
        } else {

            $.ajax({
                type: "POST",
                url: `${url_app_ajax_cliente}/infraestructura/filiales/agregar_nuevo_interno_filial.php`,
                data: {
                    id_filial: id_filial,
                    interno: interno
                },
                dataType: "JSON",
                beforeSend: function () {
                    mostrarLoader();
                },
                complete: function () {
                    mostrarLoader("O");
                },
                success: function (response) {
                    if (response.error === false) {
                        correcto(response.mensaje);
                        tabla_internos_filial(id_filial);
                        tabla_filiales();
                        cerrarModal("modal_agregarInternoFilial");
                    } else {
                        error(response.mensaje);
                    }
                }
            });
        }
    }
}

function agregar_filial(openModal = false) {
    if (openModal == true) {
        emails_filiales = [];
        internos_filiales = [];
        $("#txt_filial_nombre_agregar").val('');
        document.getElementById("email_agregados_filiales").innerHTML = "";
        document.getElementById("interno_agregados_filiales").innerHTML = "";
        select_departamentos("Agregar", "txt_filial_departamento_agregar");
        abrirModal("modal_agregarFilial");
    } else {
        let filial = $("#txt_filial_nombre_agregar").val();
        let departamento = $('#txt_filial_departamento_agregar option:selected').text();

        if (filial == "") {
            error("Debe ingresar el nombre del la filial");
        } else if (departamento == "") {
            error("Debe seleccionar un departamento");
        } else if (emails_filiales.length == 0) {
            error("Debe ingresar al menos un email");
        } else if (internos_filiales == 0) {
            error("Debe ingresar al menos un interno");
        } else {

            $.ajax({
                type: "POST",
                url: `${url_app_ajax_cliente}/infraestructura/filiales/agregar_filial.php`,
                data: {
                    filial: filial,
                    departamento: departamento,
                    emails_filiales: emails_filiales,
                    internos_filiales: internos_filiales,
                },
                dataType: "JSON",
                beforeSend: function () {
                    mostrarLoader();
                },
                complete: function () {
                    mostrarLoader("O");
                },
                success: function (response) {
                    if (response.error === false) {
                        correcto(response.mensaje);
                        $("#txt_filial_nombre_agregar").val('');
                        emails_filiales = [];
                        internos_filiales = [];
                        document.getElementById("email_agregados_filiales").innerHTML = "";
                        document.getElementById("interno_agregados_filiales").innerHTML = "";
                        tabla_filiales();
                        cerrarModal("modal_agregarFilial");
                    } else {
                        error(response.mensaje);
                    }
                }
            });

        }

    }

}

function agregar_marcador_x_area(openModal = false) {
    if (openModal == true) {
        select_area("Agregar", "select_areas_marcador_por_area");
        select_marcadores("Agregar", "select_marcadores");
        abrirModal("modal_agregarMarcadorPorArea");
    } else {
        let id_area = $("#select_areas_marcador_por_area").val();
        let id_marcador = $("#select_marcadores").val();


        if (id_area == "") {
            error("Debe seleccionar un área");
        } else if (id_marcador == "") {
            error("Debe ingresar un marcador");
        } else {

            $.ajax({
                type: "POST",
                url: `${url_app_ajax_cliente}/infraestructura/marcadores_x_area/agregar_nuevo_marcador_a_area.php`,
                data: {
                    id_area: id_area,
                    id_marcador: id_marcador
                },
                dataType: "JSON",
                beforeSend: function () {
                    mostrarLoader();
                },
                complete: function () {
                    mostrarLoader("O");
                },
                success: function (response) {
                    if (response.error === false) {
                        correcto(response.mensaje);
                        mostrar_marcadores();
                        tabla_marcadores_x_area();
                        cerrarModal("modal_agregarMarcadorPorArea");
                    } else {
                        error(response.mensaje);
                    }
                }
            });
        }
    }
}

function agregar_marcador(openModal = false) {
    if (openModal == true) {
        select_variante_marcadores("Agregar", "txt_variante_marcador_agregar");
        abrirModal("modal_agregarMarcador");
    } else {

        let titulo = $("#txt_titulo_marcador_agregar").val();
        let sub_titulo = $("#txt_sub_titulo_marcador_agregar").val();
        let logo = $("#txt_logo_marcador_agregar").val();
        let link = $("#txt_link_marcador_agregar").val();
        let variante = $("#txt_variante_marcador_agregar").val();


        if (titulo == "") {
            error("Ingrese un Título");
        } else if (link == "") {
            error("Debe ingresar un Link");
        } else if (variante == "") {
            error("Debe seleccionar una Variante");
        } else if (sub_titulo != "" && variante != 3) {
            error(`Solo puede ingresar un Sub Título si la variante es "Sub Título"`);
        } else if (logo == "") {
            error("Debe seleccionar un Logo");
        } else if (sub_titulo == "" && variante == 3) {
            error(`Debe ingresar un Sub Título`);
        } else {

            let formData = new FormData();
            formData.append("titulo", titulo);
            formData.append("sub_titulo", sub_titulo);
            formData.append("link", link);
            formData.append("variante", variante);
            formData.append('imagen', $('#txt_logo_marcador_agregar').prop("files")[0]);

            $.ajax({
                type: "POST",
                url: `${url_app_ajax_cliente}/infraestructura/marcadores/agregar_marcador.php`,
                data: formData,
                dataType: "JSON",
                contentType: false,
                processData: false,
                beforeSend: function () {
                    mostrarLoader();
                },
                complete: function () {
                    mostrarLoader("O");
                },
                success: function (response) {
                    if (response.error === false) {
                        correcto(response.mensaje);
                        tabla_marcadores();
                        cerrarModal("modal_agregarMarcador");
                    } else {
                        error(response.mensaje);
                    }
                }
            });
        }
    }
}

function agregar_marcador_x_persona(openModal = false) {
    if (openModal == true) {
        select_usuarios("Agregar", "select_usuarios_marcador_por_persona");
        select_marcadores("Agregar", "select_marcadores_x_persona");
        abrirModal("modal_agregarMarcadorPorPersona");
    } else {
        let id_area = localStorage.getItem("id_area");
        let id_usuario = $("#select_usuarios_marcador_por_persona").val();
        let id_marcador = $("#select_marcadores_x_persona").val();


        if (id_usuario == "") {
            error("Debe seleccionar un usuario");
        } else if (id_marcador == "") {
            error("Debe seleccionar un marcador");
        } else {

            $.ajax({
                type: "POST",
                url: `${url_app_ajax_cliente}/infraestructura/marcadores_x_persona/agregar_nuevo_marcador_a_persona.php`,
                data: {
                    id_usuario: id_usuario,
                    id_marcador: id_marcador,
                    id_area: id_area
                },
                dataType: "JSON",
                beforeSend: function () {
                    mostrarLoader();
                },
                complete: function () {
                    mostrarLoader("O");
                },
                success: function (response) {
                    if (response.error === false) {
                        correcto(response.mensaje);
                        mostrar_marcadores();
                        tabla_marcadores_x_persona();
                        cerrarModal("modal_agregarMarcadorPorPersona");
                    } else {
                        error(response.mensaje);
                    }
                }
            });
        }
    }
}
/** END AGREGAR DATOS **/



/** EDITAR DATOS **/
function editar_datos_usuario(openModal = false, id, usuario, nombre, apellido, id_area, nombre_area, id_departamento, departamento) {
    if (openModal == true) {
        $("#txt_id_editar").val(id);
        $("#txt_cedula_editar").val(usuario);
        $("#txt_nombre_editar").val(nombre);
        $("#txt_apellido_editar").val(apellido);
        tabla_emails(id);
        tabla_internos_usuarios(id);
        select_area("Editar", "txt_area_editar", id_area, nombre_area);
        select_departamentos("Editar", "txt_departamento_editar", id_departamento, departamento);
        abrirModal("modal_editarUsuario");
    } else {
        let id = $("#txt_id_editar").val();
        let cedula = $("#txt_cedula_editar").val();
        let nombre = $("#txt_nombre_editar").val();
        let apellido = $("#txt_apellido_editar").val();
        let area = document.getElementById('txt_area_editar').value;
        let departamento = document.getElementById('txt_departamento_editar').value;

        if (cedula == "") {
            error("Debe ingresar una cédula");
        } else if (nombre == "") {
            error("Debe ingresar un nombre");
        } else if (apellido == "") {
            error("Debe ingresar un apellido");
        } else if (area == "") {
            error("Debe seleccionar un área");
        } else if (departamento == "") {
            error("Debe seleccionar un departamento");
        } else {

            $.ajax({
                type: "POST",
                url: `${url_app_ajax_cliente}/infraestructura/usuarios/editar_usuario.php`,
                data: {
                    id: id,
                    cedula: cedula,
                    nombre: nombre,
                    apellido: apellido,
                    area: area,
                    departamento: departamento
                },
                dataType: "JSON",
                beforeSend: function () {
                    mostrarLoader();
                },
                complete: function () {
                    mostrarLoader("O");
                },
                success: function (response) {
                    if (response.error === false) {
                        correcto(response.mensaje);
                        cerrarModal("modal_editarUsuario");
                        tabla_usuarios();
                    } else {
                        error(response.mensaje);
                    }
                }
            });

        }
    }
}

function editar_email_usuario(openModal = false, id = null, id_usuario = null, correo = null) {
    if (openModal == true) {
        $("#txt_id_usuario_editar_email_usuario").val(id_usuario);
        $("#txt_id_editar_email_usuario").val(id);
        $("#txt_correo_editar_email_usuario").val(correo);
        abrirModal("modal_editarEmail");
    } else {
        let id = $("#txt_id_editar_email_usuario").val();
        let id_usuario = $("#txt_id_usuario_editar_email_usuario").val();
        let email = $("#txt_correo_editar_email_usuario").val();

        $.ajax({
            type: "POST",
            url: `${url_app_ajax_cliente}/infraestructura/usuarios/editar_email.php`,
            data: {
                id: id,
                email: email
            },
            dataType: "JSON",
            beforeSend: function () {
                mostrarLoader();
            },
            complete: function () {
                mostrarLoader("O");
            },
            success: function (response) {
                if (response.error === false) {
                    correcto(response.mensaje);
                    cerrarModal("modal_editarEmail");
                    tabla_emails(id_usuario);
                    tabla_usuarios();
                } else {
                    error(response.mensaje);
                }
            }
        });
    }
}

function editar_interno_usuario(openModal = false, id = null, id_usuario = null, interno = null) {
    if (openModal == true) {
        $("#txt_id_usuario_editar_interno_usuario").val(id_usuario);
        $("#txt_id_editar_interno_usuario").val(id);
        $("#txt_interno_editar_interno_usuario").val(interno);
        abrirModal("modal_editarInternoUsuario");
    } else {
        let id_usuario = $("#txt_id_usuario_editar_interno_usuario").val();
        let id = $("#txt_id_editar_interno_usuario").val();
        let interno = $("#txt_interno_editar_interno_usuario").val();

        $.ajax({
            type: "POST",
            url: `${url_app_ajax_cliente}/infraestructura/usuarios/editar_interno.php`,
            data: {
                id: id,
                interno: interno
            },
            dataType: "JSON",
            beforeSend: function () {
                mostrarLoader();
            },
            complete: function () {
                mostrarLoader("O");
            },
            success: function (response) {
                if (response.error === false) {
                    correcto(response.mensaje);
                    cerrarModal("modal_editarInternoUsuario");
                    tabla_internos_usuarios(id_usuario);
                    tabla_usuarios();
                } else {
                    error(response.mensaje);
                }
            }
        });
    }
}

function editar_datos_filial(openModal = false, id = null, nombre = null, departamento = null) {
    if (openModal == true) {
        $("#txt_filial_id_editar").val(id);
        $("#txt_filial_nombre_editar").val(nombre);
        select_departamentos("Editar", "txt_filial_departamento_editar", departamento, departamento);
        tabla_emails_filial(id);
        tabla_internos_filial(id);
        $("#txt_agregar_nuevo_id_filial").val(id);
        $("#txt_agregar_nuevo_interno_id_filial").val(id);
        abrirModal("modal_editarFilial");
    } else {
        let id = $("#txt_filial_id_editar").val();
        let nombre = $("#txt_filial_nombre_editar").val();
        let departamento = $("#txt_filial_departamento_editar option:selected").text();

        $.ajax({
            type: "POST",
            url: `${url_app_ajax_cliente}/infraestructura/filiales/editar_filial.php`,
            data: {
                id: id,
                nombre: nombre,
                departamento: departamento
            },
            dataType: "JSON",
            beforeSend: function () {
                mostrarLoader();
            },
            complete: function () {
                mostrarLoader("O");
            },
            success: function (response) {
                if (response.error === false) {
                    correcto(response.mensaje);
                    cerrarModal("modal_editarFilial");
                    tabla_emails_filial(id);
                    tabla_internos_filial(id);
                    tabla_filiales();
                } else {
                    error(response.mensaje);
                }
            }
        });
    }
}

function editar_email_filial(openModal = false, id = null, id_filial = null, correo = null) {
    if (openModal == true) {
        $("#txt_editar_nuevo_id_filial").val(id);
        $("#txt_editar_nuevo_id_filial_filial").val(id_filial);
        $("#txt_editar_nuevo_email_filial").val(correo);
        abrirModal("modal_editarEmailFilial");
    } else {
        let id = $("#txt_editar_nuevo_id_filial").val();
        let id_filial = $("#txt_editar_nuevo_id_filial_filial").val();
        let email = $("#txt_editar_nuevo_email_filial").val();

        $.ajax({
            type: "POST",
            url: `${url_app_ajax_cliente}/infraestructura/filiales/editar_email_filial.php`,
            data: {
                id: id,
                email: email
            },
            dataType: "JSON",
            beforeSend: function () {
                mostrarLoader();
            },
            complete: function () {
                mostrarLoader("O");
            },
            success: function (response) {
                if (response.error === false) {
                    correcto(response.mensaje);
                    tabla_emails_filial(id_filial);
                    tabla_filiales();
                    cerrarModal("modal_editarEmailFilial");
                } else {
                    error(response.mensaje);
                }
            }
        });
    }
}

function editar_interno_filial(openModal = false, id = null, id_filial = null, interno = null) {
    if (openModal == true) {
        $("#txt_editar_nuevo_interno_id_filial").val(id);
        $("#txt_editar_nuevo_interno_id_filial_filial").val(id_filial);
        $("#txt_editar_nuevo_interno_filial").val(interno);
        abrirModal("modal_editarInternoFilial");
    } else {
        let id = $("#txt_editar_nuevo_interno_id_filial").val();
        let id_filial = $("#txt_editar_nuevo_interno_id_filial_filial").val();
        let interno = $("#txt_editar_nuevo_interno_filial").val();

        $.ajax({
            type: "POST",
            url: `${url_app_ajax_cliente}/infraestructura/filiales/editar_interno_filial.php`,
            data: {
                id: id,
                interno: interno
            },
            dataType: "JSON",
            beforeSend: function () {
                mostrarLoader();
            },
            complete: function () {
                mostrarLoader("O");
            },
            success: function (response) {
                if (response.error === false) {
                    correcto(response.mensaje);
                    tabla_internos_filial(id_filial);
                    tabla_filiales();
                    cerrarModal("modal_editarInternoFilial");
                } else {
                    error(response.mensaje);
                }
            }
        });
    }
}

function editar_datos_marcador(openModal = false, id, titulo, sub_titulo, link, id_variante, nombre_variante) {
    if (openModal == true) {
        $("#txt_id_marcador_editar").val(id);
        $("#txt_titulo_marcador_editar").val(titulo);
        $("#txt_sub_titulo_marcador_editar").val(sub_titulo);
        $("#txt_link_marcador_editar").val(link);
        $("#txt_logo_marcador_editar").val('');

        select_variante_marcadores("Editar", "txt_variante_marcador_editar", id_variante, nombre_variante);
        abrirModal("modal_editarMarcador");
    } else {
        let id = $("#txt_id_marcador_editar").val();
        let titulo = $("#txt_titulo_marcador_editar").val();
        let sub_titulo = $("#txt_sub_titulo_marcador_editar").val();
        let link = $("#txt_link_marcador_editar").val();
        let variante = $("#txt_variante_marcador_editar").val();

        if (titulo == "") {
            error("Debe ingresar un Título");
        } else if (link == "") {
            error("Debe ingresar un Link");
        } else if (variante == "") {
            error("Debe seleccionar una variante");
        } else if (sub_titulo != "" && variante != 3) {
            error(`Solo puede ingresar un Sub Título si la variante es "Sub Título"`);
        } else if (sub_titulo == "" && variante == 3) {
            error(`Debe ingresar un Sub Título`);
        } else {

            let formData = new FormData();
            formData.append("id", id);
            formData.append("titulo", titulo);
            formData.append("sub_titulo", sub_titulo);
            formData.append("link", link);
            formData.append("variante", variante);
            formData.append('imagen', $('#txt_logo_marcador_editar').prop("files")[0]);

            $.ajax({
                type: "POST",
                url: `${url_app_ajax_cliente}/infraestructura/marcadores/editar_marcador.php`,
                data: formData,
                dataType: "JSON",
                contentType: false,
                processData: false,
                beforeSend: function () {
                    mostrarLoader();
                },
                complete: function () {
                    mostrarLoader("O");
                },
                success: function (response) {
                    if (response.error === false) {
                        correcto(response.mensaje);
                        mostrar_marcadores();
                        tabla_marcadores();
                        tabla_marcadores_x_area();
                        cerrarModal("modal_editarMarcador");
                    } else {
                        error(response.mensaje);
                    }
                }
            });

        }
    }
}
/** END EDITAR DATOS **/



/** ELIMINAR DATOS **/
function confirmar_eliminar_usuario(id) {
    Swal.fire({
        title: 'Estas seguro?',
        text: "Vas a eliminar el usuario " + id + "!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, eliminar!',
        cancelButtonText: 'Cancelar',
    }).then((result) => {
        if (result.isConfirmed) {

            $.ajax({
                type: "POST",
                url: `${url_app_ajax_cliente}/infraestructura/usuarios/eliminar_usuario.php`,
                data: {
                    id: id
                },
                dataType: "JSON",
                beforeSend: function () {
                    mostrarLoader();
                },
                complete: function () {
                    mostrarLoader("O");
                },
                success: function (response) {
                    if (response.error === false) {
                        correcto(response.mensaje);
                        tabla_usuarios();
                    } else {
                        error(response.mensaje);
                    }
                }
            });

        }
    });
}

function eliminar_email_usuario(id, id_usuario) {
    Swal.fire({
        title: 'Estas seguro?',
        text: "Vas a eliminar el email " + id + "!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, eliminar!',
        cancelButtonText: 'Cancelar',
    }).then((result) => {
        if (result.isConfirmed) {

            $.ajax({
                type: "POST",
                url: `${url_app_ajax_cliente}/infraestructura/usuarios/eliminar_email.php`,
                data: {
                    id: id
                },
                dataType: "JSON",
                beforeSend: function () {
                    mostrarLoader();
                },
                complete: function () {
                    mostrarLoader("O");
                },
                success: function (response) {
                    if (response.error === false) {
                        correcto(response.mensaje);
                        tabla_emails(id_usuario);
                        tabla_usuarios();
                    } else {
                        error(response.mensaje);
                    }
                }
            });

        }
    });
}

function eliminar_interno_usuario(id, id_usuario) {
    Swal.fire({
        title: 'Estas seguro?',
        text: "Vas a eliminar el interno " + id + "!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, eliminar!',
        cancelButtonText: 'Cancelar',
    }).then((result) => {
        if (result.isConfirmed) {

            $.ajax({
                type: "POST",
                url: `${url_app_ajax_cliente}/infraestructura/usuarios/eliminar_interno.php`,
                data: {
                    id: id
                },
                dataType: "JSON",
                beforeSend: function () {
                    mostrarLoader();
                },
                complete: function () {
                    mostrarLoader("O");
                },
                success: function (response) {
                    if (response.error === false) {
                        correcto(response.mensaje);
                        tabla_internos_usuarios(id_usuario);
                        tabla_usuarios();
                    } else {
                        error(response.mensaje);
                    }
                }
            });

        }
    });
}

function confirmar_eliminar_filial(id) {
    Swal.fire({
        title: 'Estas seguro?',
        text: "Vas a eliminar la filial " + id + "!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, eliminar!',
        cancelButtonText: 'Cancelar',
    }).then((result) => {
        if (result.isConfirmed) {

            $.ajax({
                type: "POST",
                url: `${url_app_ajax_cliente}/infraestructura/filiales/eliminar_filial.php`,
                data: {
                    id: id
                },
                dataType: "JSON",
                beforeSend: function () {
                    mostrarLoader();
                },
                complete: function () {
                    mostrarLoader("O");
                },
                success: function (response) {
                    if (response.error === false) {
                        correcto(response.mensaje);
                        tabla_filiales();
                    } else {
                        error(response.mensaje);
                    }
                }
            });

        }
    });
}

function eliminar_email_filial(id, id_filial) {
    Swal.fire({
        title: 'Estas seguro?',
        text: "Vas a eliminar el email " + id + "!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, eliminar!',
        cancelButtonText: 'Cancelar',
    }).then((result) => {
        if (result.isConfirmed) {

            $.ajax({
                type: "POST",
                url: `${url_app_ajax_cliente}/infraestructura/filiales/eliminar_email_filial.php`,
                data: {
                    id: id
                },
                dataType: "JSON",
                beforeSend: function () {
                    mostrarLoader();
                },
                complete: function () {
                    mostrarLoader("O");
                },
                success: function (response) {
                    if (response.error === false) {
                        correcto(response.mensaje);
                        tabla_emails_filial(id_filial);
                        tabla_filiales();
                    } else {
                        error(response.mensaje);
                    }
                }
            });

        }
    });
}

function eliminar_interno_filial(id, id_filial) {
    Swal.fire({
        title: 'Estas seguro?',
        text: "Vas a eliminar el interno " + id + "!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, eliminar!',
        cancelButtonText: 'Cancelar',
    }).then((result) => {
        if (result.isConfirmed) {

            $.ajax({
                type: "POST",
                url: `${url_app_ajax_cliente}/infraestructura/filiales/eliminar_interno_filial.php`,
                data: {
                    id: id
                },
                dataType: "JSON",
                beforeSend: function () {
                    mostrarLoader();
                },
                complete: function () {
                    mostrarLoader("O");
                },
                success: function (response) {
                    if (response.error === false) {
                        correcto(response.mensaje);
                        tabla_internos_filial(id_filial);
                        tabla_filiales();
                    } else {
                        error(response.mensaje);
                    }
                }
            });

        }
    });
}

function confirmar_eliminar_marcador_area(id_asignacion_marcador, nombre_area, titulo_marcador) {
    Swal.fire({
        title: 'Estas seguro?',
        text: `Vas a eliminar el marcador "${titulo_marcador}" del área "${nombre_area}"!`,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, eliminar!',
        cancelButtonText: 'Cancelar',
    }).then((result) => {
        if (result.isConfirmed) {

            $.ajax({
                type: "POST",
                url: `${url_app_ajax_cliente}/infraestructura/marcadores_x_area/eliminar_marcador_a_area.php`,
                data: {
                    id: id_asignacion_marcador
                },
                dataType: "JSON",
                beforeSend: function () {
                    mostrarLoader();
                },
                complete: function () {
                    mostrarLoader("O");
                },
                success: function (response) {
                    if (response.error === false) {
                        correcto(response.mensaje);
                        mostrar_marcadores();
                        tabla_marcadores_x_area();
                    } else {
                        error(response.mensaje);
                    }
                }
            });

        }
    });
}

function confirmar_eliminar_marcador(id) {
    Swal.fire({
        title: 'Estas seguro?',
        text: `Vas a eliminar el marcador "${id}""!`,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, eliminar!',
        cancelButtonText: 'Cancelar',
    }).then((result) => {
        if (result.isConfirmed) {

            $.ajax({
                type: "POST",
                url: `${url_app_ajax_cliente}/infraestructura/marcadores/eliminar_marcador.php`,
                data: {
                    id: id
                },
                dataType: "JSON",
                beforeSend: function () {
                    mostrarLoader();
                },
                complete: function () {
                    mostrarLoader("O");
                },
                success: function (response) {
                    if (response.error === false) {
                        correcto(response.mensaje);
                        mostrar_marcadores();
                        tabla_marcadores();
                    } else {
                        error(response.mensaje);
                    }
                }
            });

        }
    });
}

function confirmar_eliminar_marcador_persona(id_asignacion_marcador, nombre_usuario, apellido_usuario, titulo_marcador) {

    let usuario = apellido_usuario == "" ? nombre_usuario : nombre_usuario + " " + apellido_usuario;

    Swal.fire({
        title: 'Estas seguro?',
        text: `Vas a eliminar el marcador "${titulo_marcador}" del usuario "${usuario}"!`,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, eliminar!',
        cancelButtonText: 'Cancelar',
    }).then((result) => {
        if (result.isConfirmed) {

            $.ajax({
                type: "POST",
                url: `${url_app_ajax_cliente}/infraestructura/marcadores_x_persona/eliminar_marcador_a_persona.php`,
                data: {
                    id: id_asignacion_marcador
                },
                dataType: "JSON",
                beforeSend: function () {
                    mostrarLoader();
                },
                complete: function () {
                    mostrarLoader("O");
                },
                success: function (response) {
                    if (response.error === false) {
                        correcto(response.mensaje);
                        mostrar_marcadores();
                        tabla_marcadores_x_persona();
                    } else {
                        error(response.mensaje);
                    }
                }
            });

        }
    });
}
/** END ELIMINAR DATOS **/










function mostrar_lista_usuarios(tipo) {

    if (tipo == "Email") {
        div = "email_agregados_usuarios";
        array = emails_usuarios;
    } else {
        div = "interno_agregados_usuarios";
        array = internos_usuarios;
    }

    document.getElementById(div).innerHTML = "";

    array.map((val) => {
        document.getElementById(div).innerHTML += `<li class="list-group-item d-flex justify-content-between align-items-center">${val}<span class="badge bg-danger rounded-pill" style="cursor: pointer;" onclick="eliminar_lista_usuarios('${val}', '${tipo}')">❌</span></li>`;
    });

}

function agregar_lista_usuarios(tipo, div) {
    let campo = $(`#${div}`).val();

    if (campo != "") {
        let array = tipo == "Email" ? emails_usuarios : internos_usuarios;

        array.push(campo);
        mostrar_lista_usuarios(tipo, div);
        $(`#${div}`).val('');
    } else {
        error(`Debe ingresar un ${tipo}`);
    }
}

function eliminar_lista_usuarios(elemento, tipo) {

    if (tipo == "Email") {
        emails_usuarios = emails_usuarios.filter(campo => campo != elemento);
    } else {
        internos_usuarios = internos_usuarios.filter(campo => campo != elemento);
    }

    mostrar_lista_usuarios(tipo);
}





function mostrar_lista_filiales(tipo) {

    if (tipo == "Email") {
        div = "email_agregados_filiales";
        array = emails_filiales;
    } else {
        div = "interno_agregados_filiales";
        array = internos_filiales;
    }

    document.getElementById(div).innerHTML = "";

    array.map((val) => {
        document.getElementById(div).innerHTML += `<li class="list-group-item d-flex justify-content-between align-items-center">${val}<span class="badge bg-danger rounded-pill" style="cursor: pointer;" onclick="eliminar_lista_filiales('${val}', '${tipo}')">❌</span></li>`;
    });

}

function agregar_lista_filiales(tipo, div) {
    let campo = $(`#${div}`).val();

    if (campo != "") {
        let array = tipo == "Email" ? emails_filiales : internos_filiales;

        array.push(campo);
        mostrar_lista_filiales(tipo, div);
        $(`#${div}`).val('');
    } else {
        error(`Debe ingresar un ${tipo}`);
    }
}

function eliminar_lista_filiales(elemento, tipo) {

    if (tipo == "Email") {
        emails_filiales = emails_filiales.filter(campo => campo != elemento);
    } else {
        internos_filiales = internos_filiales.filter(campo => campo != elemento);
    }

    mostrar_lista_filiales(tipo);
}