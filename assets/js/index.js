$(document).ready(async function () {

  comprobar_evacion_extender_sesion();

  let tipo = localStorage.getItem('tipo') == 1 ? "admin" : "cliente";

  let area = localStorage.getItem('area');
  let area_div = formar_area_div(area);
  localStorage.setItem("area_div", area_div);

  let partials = ["menu", "footer"];
  let partials_usuario = [area_div];
  let modals = [
    "modalPoliticasyProcedimientos",
    "modalSesionExpirada",
    "modalInternos_Mail",
    "modalPoliticasSeguridad",
    "modalMaterialSeguridadInformacion",
    "modalAgregarUsuario",
    "modalEditarUsuario",
    "modalAgregarEmail",
    "modalEditarEmail",
    "modalAgregarInternoUsuario",
    "modalEditarInternoUsuario",
    "modalAgregarMarcadorPorArea",
    "modalAgregarMarcadorPorPersona",
    "modalAgregarFilial",
    "modalEditarFilial",
    "modalAgregarEmailFilial",
    "modalEditarEmailFilial",
    "modalAgregarInternoFilial",
    "modalEditarInternoFilial",
    "modalAgregarMarcador",
    "modalEditarMarcador"];

  for (let i in partials) {
    cargarPartial('partials', partials[i]);
  }

  for (let i in partials_usuario) {
    cargarPartial(`partials/${tipo}`, partials_usuario[i]);
  }

  for (let i in modals) {
    cargarPartial('modals', modals[i]);
  }

  document.getElementById("mostrar_flecha").style.display = "block";

  abrirModal("vidashopmodal");

  (function ($) {
    var timeout;
    $(document).on('mousemove', function (event) {
      if (timeout !== undefined) {
        window.clearTimeout(timeout);
      }
      timeout = window.setTimeout(function () {
        //Creas una funcion nueva para jquery
        $(event.target).trigger('mousemoveend');
      }, 600000); //Determinas el tiempo en milisegundo aquí, 10 minutos
    });
  })(jQuery);
});





function solicitar_baja_cedula() {
  let cedula = $("#txt_cedula_ingresada").val();

  if (cedula == "") {
    error("Debe ingresar la cédula");
  } else if (validarCedula(cedula) == false) {
    error("Debe ingresar una cédula válida");
  } else {
    correcto("consultada");
  }
}


function abrir_modal_historial_bajas() {

  tabla_historial_bajas();

  $("#modal_historialBajas").modal('show');
}

function tabla_historial_bajas() {
  $('#modal_historialBajas').DataTable({
    ajax: `${url_app_ajax}/verificar_rutas.php`,
    columns: [
      { data: 'id' },
      { data: 'cedula' },
      { data: 'nombre' },
      { data: 'telefono' },
      { data: 'celular' },
      { data: 'radio' },
      { data: 'motivo' },
      { data: 'fecha_baja' },
      { data: 'estado' },
      { data: 'filial' },
      { data: 'info' },
    ],
    "order": [[0, 'asc']],
    "bDestroy": true,
    language: { url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json' },
  });
}

function cargar_en_div(section, div) {
  if (section == "todos") {
    cargar_todo_div();
  }
}



function comprobar_evacion_extender_sesion() {
  if (localStorage.getItem("status") == "pendiente") {
    cerrar_sesion();
  }
}

$(document).on('mousemoveend', function () {
  $("#txt_cedula_sesion_expirada").val('');
  abrirModal("modal_sesionExpirada");
  localStorage.setItem("status", "pendiente");
});

function extender_sesion() {
  let cedula = $("#txt_cedula_sesion_expirada").val();
  let usuario = localStorage.getItem("usuario");
  localStorage.setItem("status", "pendiente");

  if (cedula == "") {
    error("Debe ingresar su cédula");
    localStorage.setItem("status", "pendiente");
  } else if (cedula != usuario) {
    localStorage.clear();
    location.href = `${url_app}/login.html`;
    localStorage.setItem("status", "pendiente");
  } else {
    localStorage.setItem("modalExtender", cedula);
    correcto_pasajero("¡Su sesión se ha extendido!");
    cerrarModal("modal_sesionExpirada");
    localStorage.setItem("status", "ok");
  }
}


/*
function limpiarCampos() {
  //Campos a vaciar
  let campos = [
    "txt_form_cedula_coordinacion_carga",
    "txt_form_cedula",
    "txt_form_nombre",
    "txt_form_edad",
    "txt_form_movilizacion",
    "txt_form_direccion",
    "txt_form_tel_o_cel",
    "txt_form_lugar_consulta",
    "txt_form_fecha_y_hora",
    "txt_form_patologia",
    "txt_form_observacion",
    "url_para_pagar",
    "txt_email_a_mandar",
  ];
  //Vaciar campos
  vaciar_inputs(campos);
}
*/