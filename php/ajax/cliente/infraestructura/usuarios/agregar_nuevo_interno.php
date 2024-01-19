<?php
include '../../../../configuraciones.php';

$id_usuario = $_REQUEST['id_usuario'];
$interno = $_REQUEST['interno'];


if (!is_numeric($interno)) {
    $response['error'] = true;
    $response['mensaje'] = ERROR_INTERNO_INVALIDO;
    die(json_encode($response));
}


$registrar = agregar_interno($id_usuario, $interno);

if ($registrar === false) {
    $response['error'] = true;
    $response['mensaje'] = ERROR_AL_REGISTRAR;
    die(json_encode($response));
}


$response['error'] = false;
$response['mensaje'] = EXITO_AL_REGISTRAR;

echo json_encode($response);


function agregar_interno($id_usuario, $interno)
{
    $conexion = connection(DB);
    $tabla = TABLA_INTERNOS_USUARIOS;

    $sql = "INSERT INTO {$tabla} (id_usuario, interno) VALUES ('$id_usuario', '$interno')";

    return mysqli_query($conexion, $sql);
}
