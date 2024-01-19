<?php
include '../../../../configuraciones.php';

$id_filial = $_REQUEST['id_filial'];
$interno = $_REQUEST['interno'];


if (!is_numeric($interno)) {
    $response['error'] = true;
    $response['mensaje'] = "Debe ingresar un interno válido. <br> Solo se aceptan números";
    die(json_encode($response));
}


$eliminacion = agregar_interno($id_filial, $interno);

if ($eliminacion === false) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrieron errores al agregar el interno";
    die(json_encode($response));
}


$response['error'] = false;
$response['mensaje'] = "Se agrego el interno con éxito";

echo json_encode($response);


function agregar_interno($id_filial, $interno)
{
    $conexion = connection(DB);
    $tabla = TABLA_INTERNOS_FILIALES;

    $sql = "INSERT INTO {$tabla} (id_filial, interno) VALUES ('$id_filial', '$interno')";

    return mysqli_query($conexion, $sql);
}
