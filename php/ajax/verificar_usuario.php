<?php
include '../configuraciones.php';


$id = $_REQUEST['id'];
$usuario = $_REQUEST['usuario'];
$tipo = $_REQUEST['tipo'];
$hash = $_REQUEST['hash'];


if (!$id || !$usuario || !is_numeric($tipo) || !$hash) {
    $response['error'] = true;
    $response['mensaje'] = "Usuario no logueado!";
    die(json_encode($response));
}


$validar = verificar_usuario($id, $usuario, null, $tipo, $hash, true);


if ($validar === false) {
    $response['error'] = true;
    $response['mensaje'] = "Credenciales inválidas!";
    die(json_encode($response));
}


$response['error'] = false;
$response['mensaje'] = "¡Bienvenido!";
echo json_encode($response);
