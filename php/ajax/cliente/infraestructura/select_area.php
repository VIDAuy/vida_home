<?php
include '../../../configuraciones.php';


if ($_REQUEST) {
    $id_area = $_REQUEST['id_area'];
    $array = [];
    $datos = obtener_datos($id_area);
} else {
    $datos = obtener_datos(false);
}


while ($row = mysqli_fetch_assoc($datos)) {
    $row['id'] = strtolower($row['id']);
    $row['nombre'] = ucfirst($row['nombre']);
    $f[] = $row;
}


$respuesta = array(
    'datos' => $f
);



echo json_encode($respuesta);




function obtener_datos($id_area = false)
{
    $conexion = connection(DB);
    $tabla = TABLA_AREAS;

    if ($id_area == false) {
        $sql = "SELECT id, nombre FROM {$tabla} ORDER BY id ASC";
    } else {
        $sql = "SELECT id, nombre FROM {$tabla} WHERE id != '$id_area' ORDER BY id ASC";
    }

    return mysqli_query($conexion, $sql);
}
