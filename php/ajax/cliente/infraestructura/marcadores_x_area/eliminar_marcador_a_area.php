<?php
include '../../../../configuraciones.php';

$id = $_REQUEST['id'];

$eliminar_marcador = eliminar_marcador($id);

if ($eliminar_marcador === false) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrieron errores al eliminar el marcador $id";
    die(json_encode($response));
}


$response['error'] = false;
$response['mensaje'] = "Se eliminó el marcador $id con éxito";

echo json_encode($response);





function eliminar_marcador($id)
{
    $conexion = connection(DB);
    $tabla = TABLA_MARCADORES_X_AREA;

    $sql = "DELETE FROM {$tabla} WHERE id = '$id'";

    return mysqli_query($conexion, $sql);
}
