<?php
include '../../../../configuraciones.php';

$id = $_REQUEST['id'];

$eliminacion = eliminar_marcador($id);

if ($eliminacion === false) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrieron errores al eliminar el marcador";
    die(json_encode($response));
}


$response['error'] = false;
$response['mensaje'] = "Se eliminó el marcador con éxito";

echo json_encode($response);


function eliminar_marcador($id)
{
    $conexion = connection(DB);
    $tabla = TABLA_MARCADORES;

    $sql = "UPDATE {$tabla} SET activo = 0 WHERE id = '$id'";

    return mysqli_query($conexion, $sql);
}
