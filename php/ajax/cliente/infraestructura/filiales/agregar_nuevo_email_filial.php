<?php
include '../../../../configuraciones.php';

$id_filial = $_REQUEST['id_filial'];
$email = $_REQUEST['email'];


if (validar_email($email) === true) {
    $response['error'] = true;
    $response['mensaje'] = "Debe ingresar un email válido";
    die(json_encode($response));
}


$eliminacion = agregar_email($id_filial, $email);

if ($eliminacion === false) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrieron errores al agregar el email";
    die(json_encode($response));
}


$response['error'] = false;
$response['mensaje'] = "Se agrego el email con éxito";

echo json_encode($response);


function agregar_email($id_filial, $email)
{
    $conexion = connection(DB);
    $tabla = TABLA_EMAILS_FILIALES;

    $sql = "INSERT INTO {$tabla} (id_filial, email) VALUES ('$id_filial', '$email')";

    return mysqli_query($conexion, $sql);
}
