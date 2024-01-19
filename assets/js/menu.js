$(document).ready(async function () {

    let id = localStorage.getItem('id');
    mostrar_nombre_usuario(id);

    let tipo = localStorage.getItem('tipo');
    mostrar_contenido_menu(tipo);
});


function mostrar_nombre_usuario(id) {
    let usuario = localStorage.getItem("nombre");
    let nombre_usuario = primera_letra_mayuscula(usuario);
    document.getElementById("nombre_usuario").innerHTML = nombre_usuario;
}


function mostrar_contenido_menu(tipo) {

    switch (parseInt(tipo)) {
        case 1:
            document.getElementById("contenido_nivel").innerHTML = `
                <button class="nav-link scrollto active item_menu" onclick="alert('Alertas')">
                    <span>
                        <i class="bi bi-bell"></i>
                        <span>Alertas
                            <span
                                class="position-absolute top-25 start-75 translate-middle badge rounded-pill bg-danger p-1">
                                100+
                            </span>
                        </span>
                    </span>
                </button>
                <button class="nav-link scrollto active item_menu" onclick="solicitar_baja_cedula()">
                    <i class="bx bx-archive-in"></i>
                    <span>Solicitar la baja</span>
                </button>
                <button class="nav-link scrollto active item_menu" onclick="alert('Gestionar bajas')">
                    <i class="bx bx-calendar-minus"></i>
                    <span>Gestionar bajas</span>
                </button>
                <button class="nav-link scrollto active item_menu" onclick="abrir_modal_historial_bajas()">
                    <i class="bx bx-book"></i>
                    <span>Ver historial de bajas</span>
                </button>`;
            break;
        case 2:
            document.getElementById("contenido_nivel").innerHTML = `
            <button class="nav-link scrollto active item_menu" onclick="abrirModalInternos_Mail()">
                <i class="bx bx-info-circle"></i>
                <span>Internos / Mail</span>
            </button>

            <button class="nav-link scrollto active item_menu" onclick="abrirModalPoliticasSeguridad()">
                <i class="bx bx-info-square"></i>
                <span>Políticas de Seguridad</span>
            </button>
                `;
            break;
    }
}



function abrirModalInternos_Mail() {
    tabla_informacion_central();
    tabla_informacion_filiales();
    abrirModal("modal_internosMail");
}

function abrirModalPoliticasSeguridad() {
    abrirModal("modal_politicasSeguridad");
}

function tabla_informacion_central() {
    $('#tabla_informacion_central').DataTable({
        ajax: `${url_app_ajax_cliente}/listado_informacion_central.php`,
        columns: [
            { data: 'id' },
            { data: 'interno' },
            { data: 'nombre' },
            { data: 'sector' },
            { data: 'email' },
            { data: 'departamento' },
        ],
        columnDefs: [
            {
                "targets": [0],
                "visible": false,
                "searchable": false
            }],
        "order": [[0, 'asc']],
        "bDestroy": true,
        language: { url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json' },
    });
}

function tabla_informacion_filiales() {
    $('#tabla_informacion_filiales').DataTable({
        ajax: `${url_app_ajax_cliente}/listado_informacion_filiales.php`,
        columns: [
            { data: 'id' },
            { data: 'filial' },
            { data: 'interno' },
            { data: 'email' },
            { data: 'departamento' },
        ],
        columnDefs: [
            {
                "targets": [0],
                "visible": false,
                "searchable": false
            }],
        "order": [[0, 'asc']],
        "bDestroy": true,
        language: { url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json' },
    });
}