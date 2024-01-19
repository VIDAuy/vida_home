<?php
include '../../../configuraciones.php';


if ($_REQUEST) {
    $id_marcador = $_REQUEST['id_marcador'];
    $array = [];
    $datos = obtener_datos($id_marcador);
} else {
    $datos = obtener_datos(false);
}


while ($row = mysqli_fetch_assoc($datos)) {

    $id = strtolower($row['id']);
    $titulo = ucfirst($row['titulo']);
    $subtitulo = $row['sub_titulo'];

    $todo_titulo = $subtitulo == "" ? $titulo : $titulo . " ➡ " . $subtitulo;

    $row['id'] = $id;
    $row['titulo'] = $todo_titulo;
    $f[] = $row;
}


$respuesta = array(
    'datos' => $f
);



echo json_encode($respuesta);




function obtener_datos($id_marcador = false)
{
    $conexion = connection(DB);
    $tabla = TABLA_MARCADORES;

    if ($id_marcador == false) {
        $sql = "SELECT id, titulo, sub_titulo FROM {$tabla} WHERE activo = 1 ORDER BY titulo ASC";
    } else {
        $sql = "SELECT id, titulo, sub_titulo FROM {$tabla} WHERE id != '$id_marcador' AND activo = 1 ORDER BY titulo ASC";
    }

    return mysqli_query($conexion, $sql);
}
