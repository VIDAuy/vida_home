<?php
include '../../../../configuraciones.php';


$id = $_REQUEST['id'];


$eliminar_usuario = eliminar_usuario($id);

if ($eliminar_usuario === false) {
    $response['error'] = true;
    $response['mensaje'] = ERROR_AL_ELIMINAR_USUARIO;
    die(json_encode($response));
}

$eliminar_email = eliminar_email($id);

if ($eliminar_email === false) {
    $response['error'] = true;
    $response['mensaje'] = ERROR_AL_ELIMINAR_EMAIL;
    die(json_encode($response));
}

$eliminar_interno = eliminar_interno($id);

if ($eliminar_interno === false) {
    $response['error'] = true;
    $response['mensaje'] = ERROR_AL_ELIMINAR_INTERNO;
    die(json_encode($response));
}


$response['error'] = false;
$response['mensaje'] = EXITO_AL_ELIMINAR;

echo json_encode($response);




function eliminar_usuario($id)
{
    $conexion = connection(DB);
    $tabla = TABLA_USUARIOS;

    $sql = "DELETE FROM {$tabla} WHERE id = '$id'";

    return mysqli_query($conexion, $sql);
}

function eliminar_email($id)
{
    $conexion = connection(DB);
    $tabla = TABLA_EMAILS;

    $sql = "DELETE FROM {$tabla} WHERE id_usuario = '$id'";

    return mysqli_query($conexion, $sql);
}

function eliminar_interno($id)
{
    $conexion = connection(DB);
    $tabla = TABLA_INTERNOS_USUARIOS;

    $sql = "DELETE FROM {$tabla} WHERE id_usuario = '$id'";

    return mysqli_query($conexion, $sql);
}
