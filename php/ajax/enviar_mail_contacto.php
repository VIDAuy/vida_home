<?php

include '../configuraciones.php';


$nombre  = $_REQUEST['nombre'];
$email   = $_REQUEST['email'];
$asunto  = $_REQUEST['asunto'];
$mensaje = $_REQUEST['mensaje'];


if (!$nombre || !$email || !$asunto || !$mensaje) {
    $response['error'] = true;
    $response['mensaje'] = ERROR_GENERAL;
    die(json_encode($response));
}



$response['error'] = false;
$response['mensaje'] = "Email enviado";

echo json_encode($response);
