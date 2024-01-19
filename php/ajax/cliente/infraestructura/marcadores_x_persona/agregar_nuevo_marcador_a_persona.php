<?php
include '../../../../configuraciones.php';

$id_usuario = $_REQUEST['id_usuario'];
$id_marcador = $_REQUEST['id_marcador'];
$id_area = obtener_area_usuario($id_usuario);


$verificar_marcador = comprobar_marcador_x_persona($id_usuario, $id_marcador);

if ($verificar_marcador === true) {
    $response['error'] = true;
    $response['mensaje'] = "El marcador seleccionado ya esta asignado a este usuario";
    die(json_encode($response));
}

$verificar_marcador_x_area = comprobar_marcador_x_area($id_area, $id_marcador);

if ($verificar_marcador_x_area === true) {
    $response['error'] = true;
    $response['mensaje'] = "El marcador que le desea asignar al usuario ya lo tiene disponible como marcador por área";
    die(json_encode($response));
}

$asignar_marcador = agregar_marcador($id_usuario, $id_marcador);

if ($asignar_marcador === false) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrieron errores al agregar el marcador";
    die(json_encode($response));
}


$response['error'] = false;
$response['mensaje'] = "Se agrego el marcador con éxito";

echo json_encode($response);



function obtener_area_usuario($id_usuario)
{
    $conexion = connection(DB);
    $tabla = TABLA_USUARIOS;

    $sql = "SELECT area FROM {$tabla} WHERE id = '$id_usuario'";
    $consulta = mysqli_query($conexion, $sql);

    return mysqli_fetch_assoc($consulta)['area'];
}

function comprobar_marcador_x_persona($id_usuario, $id_marcador)
{
    $conexion = connection(DB);
    $tabla = TABLA_MARCADORES_X_PERSONA;

    $sql = "SELECT id FROM {$tabla} WHERE id_usuario = '{$id_usuario}' AND id_marcador = '{$id_marcador}'";

    $consulta = mysqli_query($conexion, $sql);
    return mysqli_fetch_assoc($consulta)['id'] != "" ? true : false;
}

function comprobar_marcador_x_area($id_area, $id_marcador)
{
    $conexion = connection(DB);
    $tabla = TABLA_MARCADORES_X_AREA;

    $sql = "SELECT id FROM {$tabla} WHERE id_area = '{$id_area}' AND id_marcador = '{$id_marcador}'";

    $consulta = mysqli_query($conexion, $sql);
    return mysqli_fetch_assoc($consulta)['id'] == "" ? false : true;
}

function agregar_marcador($id_usuario, $id_marcador)
{
    $conexion = connection(DB);
    $tabla = TABLA_MARCADORES_X_PERSONA;

    $sql = "INSERT INTO {$tabla} (id_usuario, id_marcador) VALUES ('$id_usuario', '$id_marcador')";

    return mysqli_query($conexion, $sql);
}
