<?php
include '../../../../configuraciones.php';


$id = $_REQUEST['id'];
$interno = $_REQUEST['interno'];


if (!is_numeric($interno)) {
    $response['error'] = true;
    $response['mensaje'] = "Debe ingresar un interno válido. <br> Solo se aceptan números";
    die(json_encode($response));
}


$cambiar_interno = editar_interno($id, $interno);

if ($cambiar_interno === false) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrieron errores al editar el interno";
    die(json_encode($response));
}



$response['error'] = false;
$response['mensaje'] = "Se modificó el interno con éxito";


echo json_encode($response);




function editar_interno($id, $interno)
{
    $conexion = connection(DB);
    $tabla = TABLA_INTERNOS_FILIALES;

    $sql = "UPDATE {$tabla} SET interno = '{$interno}' WHERE id = '{$id}'";
    $consulta = mysqli_query($conexion, $sql);

    return $consulta == true ? mysqli_insert_id($conexion) : false;
}
