<?php
include '../../../configuraciones.php';


if ($_REQUEST) {
    $id_usuario = $_REQUEST['id_usuario'];
    $array = [];
    $datos = obtener_datos($id_usuario);
} else {
    $datos = obtener_datos(false);
}


while ($row = mysqli_fetch_assoc($datos)) {
    $row['id'] = strtolower($row['id']);
    $row['nombre'] = ucfirst($row['nombre']);
    $row['apellido'] = ucfirst($row['apellido']);
    $f[] = $row;
}


$respuesta = array(
    'datos' => $f
);



echo json_encode($respuesta);




function obtener_datos($id_usuario = false)
{
    $conexion = connection(DB);
    $tabla = TABLA_USUARIOS;

    if ($id_usuario == false) {
        $sql = "SELECT id, nombre, apellido FROM {$tabla} ORDER BY nombre ASC";
    } else {
        $sql = "SELECT id, nombre, apellido FROM {$tabla} WHERE id != '$id_usuario' ORDER BY nombre ASC";
    }

    return mysqli_query($conexion, $sql);
}
