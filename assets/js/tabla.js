$('#tabla_example').DataTable({
  ajax: `${url_app_ajax}/cierre_actual_x_servicios.php`,
  columns: [
    { data: 'id_servicio' },
    { data: 'servicio' },
    { data: 'cantidad' },
  ],
  "order": [[0, 'asc']],
  "bDestroy": true,
  language: { url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json' },
  dom: 'Bfrtip',
  buttons: ['excel'],
});