<?php
include '../../../../configuraciones.php';

$id_usuario = $_REQUEST['id_usuario'];
$email = $_REQUEST['email'];


if (validar_email($email) === true) {
    $response['error'] = true;
    $response['mensaje'] = "Debe ingresar un email válido";
    die(json_encode($response));
}


$eliminacion = agregar_email($id_usuario, $email);

if ($eliminacion === false) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrieron errores al agregar el email";
    die(json_encode($response));
}


$response['error'] = false;
$response['mensaje'] = "Se agrego el email con éxito";

echo json_encode($response);


function agregar_email($id_usuario, $email)
{
    $conexion = connection(DB);
    $tabla = TABLA_EMAILS;

    $sql = "INSERT INTO {$tabla} (id_usuario, email) VALUES ('$id_usuario', '$email')";

    return mysqli_query($conexion, $sql);
}
