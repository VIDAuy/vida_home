<?php
include '../../../../configuraciones.php';

$id = $_REQUEST['id'];

$eliminacion = eliminar_email($id);

if ($eliminacion === false) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrieron errores al eliminar el email";
    die(json_encode($response));
}


$response['error'] = false;
$response['mensaje'] = "Se eliminó el email con éxito";

echo json_encode($response);


function eliminar_email($id)
{
    $conexion = connection(DB);
    $tabla = TABLA_EMAILS;

    $sql = "DELETE FROM {$tabla} WHERE id = '$id'";

    return mysqli_query($conexion, $sql);
}
