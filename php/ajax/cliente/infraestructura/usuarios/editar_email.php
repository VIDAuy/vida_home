<?php
include '../../../../configuraciones.php';


$id = $_REQUEST['id'];
$email = $_REQUEST['email'];

if (validar_email($email) === true) {
    $response['error'] = true;
    $response['mensaje'] = "Debe ingresar un email válido";
    die(json_encode($response));
}


$cambiar_email = editar_email($id, $email);

if ($cambiar_email === false) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrieron errores al editar el email";
    die(json_encode($response));
}



$response['error'] = false;
$response['mensaje'] = "Se modificó el email con éxito";


echo json_encode($response);




function editar_email($id, $email)
{
    $conexion = connection(DB);
    $tabla = TABLA_EMAILS;

    $sql = "UPDATE {$tabla} SET email = '{$email}' WHERE id = '{$id}'";
    $consulta = mysqli_query($conexion, $sql);

    return $consulta == true ? mysqli_insert_id($conexion) : false;
}
