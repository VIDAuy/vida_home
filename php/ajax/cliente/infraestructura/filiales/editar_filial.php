<?php
include '../../../../configuraciones.php';


$id = $_REQUEST['id'];
$nombre = $_REQUEST['nombre'];
$departamento = $_REQUEST['departamento'];


if ($nombre == "") {
    $response['error'] = true;
    $response['mensaje'] = "Debe ingresar un nombre";
    die(json_encode($response));
}

if ($departamento == "") {
    $response['error'] = true;
    $response['mensaje'] = "Debe seleccionar un departamento";
    die(json_encode($response));
}


$editar = editar_filial($id, $nombre, $departamento);

if ($cambiar_email === false) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrieron errores al editar la filial";
    die(json_encode($response));
}



$response['error'] = false;
$response['mensaje'] = "Se modificó la filial con éxito";


echo json_encode($response);




function editar_filial($id, $nombre, $departamento)
{
    $conexion = connection(DB);
    $tabla = TABLA_FILIALES;

    $sql = "UPDATE {$tabla} SET nombre = '$nombre', departamento = '{$departamento}' WHERE id = '{$id}'";
    $consulta = mysqli_query($conexion, $sql);

    return $consulta == true ? mysqli_insert_id($conexion) : false;
}
