<?php
include '../../../configuraciones.php';


if ($_REQUEST) {
    $id_variante = $_REQUEST['id_variante'];
    $array = [];
    $datos = obtener_datos($id_variante);
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




function obtener_datos($id_variante = false)
{
    $conexion = connection(DB);
    $tabla = TABLA_TIPO_VARIANTE_MARCADORES;

    if ($id_variante == false) {
        $sql = "SELECT id, nombre FROM {$tabla} ORDER BY id ASC";
    } else {
        $sql = "SELECT id, nombre FROM {$tabla} WHERE id != '$id_variante' ORDER BY id ASC";
    }

    return mysqli_query($conexion, $sql);
}
