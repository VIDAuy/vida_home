<?php
include '../../../../configuraciones.php';

$id = $_REQUEST['id'];

$eliminacion = eliminar_interno($id);

if ($eliminacion === false) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrieron errores al eliminar el interno";
    die(json_encode($response));
}


$response['error'] = false;
$response['mensaje'] = "Se eliminó el interno con éxito";

echo json_encode($response);


function eliminar_interno($id)
{
    $conexion = connection(DB);
    $tabla = TABLA_INTERNOS_FILIALES;

    $sql = "DELETE FROM {$tabla} WHERE id = '$id'";

    return mysqli_query($conexion, $sql);
}
