<?php
include '../../../../configuraciones.php';

$id = $_REQUEST['id'];

$eliminar_filial = eliminar_filial($id);

if ($eliminar_filial === false) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrieron errores al eliminar la filial";
    die(json_encode($response));
}


$eliminar_email = eliminar_email($id);

if ($eliminar_email === false) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrieron errores al eliminar los email";
    die(json_encode($response));
}

$eliminar_interno = eliminar_interno($id);

if ($eliminar_interno === false) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrieron errores al eliminar los internos";
    die(json_encode($response));
}


$response['error'] = false;
$response['mensaje'] = "Se eliminó la filial con éxito";

echo json_encode($response);




function eliminar_filial($id)
{
    $conexion = connection(DB);
    $tabla = TABLA_FILIALES;

    $sql = "DELETE FROM {$tabla} WHERE id = '$id'";

    return mysqli_query($conexion, $sql);
}

function eliminar_email($id)
{
    $conexion = connection(DB);
    $tabla = TABLA_EMAILS_FILIALES;

    $sql = "DELETE FROM {$tabla} WHERE id_filial = '$id'";

    return mysqli_query($conexion, $sql);
}

function eliminar_interno($id)
{
    $conexion = connection(DB);
    $tabla = TABLA_INTERNOS_FILIALES;

    $sql = "DELETE FROM {$tabla} WHERE id_filial = '$id'";

    return mysqli_query($conexion, $sql);
}
