<?php
include '../../../../configuraciones.php';

$id = $_REQUEST['id'];

$eliminacion = eliminar_interno($id);

if ($eliminacion === false) {
    $response['error'] = true;
    $response['mensaje'] = ERROR_AL_ELIMINAR;
    die(json_encode($response));
}


$response['error'] = false;
$response['mensaje'] = EXITO_AL_ELIMINAR;

echo json_encode($response);


function eliminar_interno($id)
{
    $conexion = connection(DB);
    $tabla = TABLA_INTERNOS_USUARIOS;

    $sql = "DELETE FROM {$tabla} WHERE id = '$id'";

    return mysqli_query($conexion, $sql);
}
