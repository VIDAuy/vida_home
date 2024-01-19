<?php
include '../../../../configuraciones.php';


$id_area = $_REQUEST['id_area'];
$id_marcador = $_REQUEST['id_marcador'];



$verificar_marcador = comprobar_marcador($id_area, $id_marcador);

if ($verificar_marcador === true) {
    $response['error'] = true;
    $response['mensaje'] = "El marcador ya esta asignado a esta área";
    die(json_encode($response));
}

$asignar_marcador = agregar_marcador($id_area, $id_marcador);

if ($asignar_marcador === false) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrieron errores al agregar el marcador";
    die(json_encode($response));
}


$response['error'] = false;
$response['mensaje'] = "Se agrego el marcador con éxito";

echo json_encode($response);




function comprobar_marcador($id_area, $id_marcador)
{
    $conexion = connection(DB);
    $tabla = TABLA_MARCADORES_X_AREA;

    $sql = "SELECT id FROM {$tabla} WHERE id_area = '{$id_area}' AND id_marcador = '{$id_marcador}'";

    $consulta = mysqli_query($conexion, $sql);
    return mysqli_fetch_assoc($consulta)['id'] == "" ? false : true;
}

function agregar_marcador($id_area, $id_marcador)
{
    $conexion = connection(DB);
    $tabla = TABLA_MARCADORES_X_AREA;

    $sql = "INSERT INTO {$tabla} (id_area, id_marcador) VALUES ('$id_area', '$id_marcador')";

    return mysqli_query($conexion, $sql);
}
