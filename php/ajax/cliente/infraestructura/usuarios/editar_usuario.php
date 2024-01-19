<?php
include '../../../../configuraciones.php';

$id = $_REQUEST['id'];
$cedula = $_REQUEST['cedula'];
$nombre = $_REQUEST['nombre'];
$apellido = $_REQUEST['apellido'];
$area = $_REQUEST['area'];
$departamento = $_REQUEST['departamento'];


$editar_usuario = editar_datos($id, $cedula, $nombre, $apellido, $area, $departamento);

if ($editar_usuario === false) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrio un error al intentar editar el usuario";
    die(json_encode($response));
}



$response['error'] = false;
$response['mensaje'] = "Se ha editado el usuario con éxito";

echo json_encode($response);



function editar_datos($id, $cedula, $nombre, $apellido, $area, $departamento)
{
    $conexion = connection(DB);
    $tabla = TABLA_USUARIOS;

    $sql = "UPDATE {$tabla} SET nombre = '$nombre', apellido = '$apellido', area = '$area', departamento = '$departamento', usuario = '$cedula', `password` = '$cedula' WHERE id = '$id'";

    return mysqli_query($conexion, $sql);
}
