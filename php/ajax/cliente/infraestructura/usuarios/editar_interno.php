<?php
include '../../../../configuraciones.php';


$id = $_REQUEST['id'];
$interno = $_REQUEST['interno'];

if (!is_numeric($interno)) {
    $response['error'] = true;
    $response['mensaje'] = ERROR_INTERNO_INVALIDO;
    die(json_encode($response));
}


$cambiar_interno = editar_interno($id, $interno);

if ($cambiar_interno === false) {
    $response['error'] = true;
    $response['mensaje'] = ERROR_AL_MODIFICAR_INTERNO;
    die(json_encode($response));
}



$response['error'] = false;
$response['mensaje'] = EXITO_AL_MODIFICAR;


echo json_encode($response);




function editar_interno($id, $interno)
{
    $conexion = connection(DB);
    $tabla = TABLA_INTERNOS_USUARIOS;

    $sql = "UPDATE {$tabla} SET interno = '{$interno}' WHERE id = '{$id}'";
    $consulta = mysqli_query($conexion, $sql);

    return $consulta == true ? mysqli_insert_id($conexion) : false;
}
