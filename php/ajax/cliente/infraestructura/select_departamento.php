<?php
include '../../../configuraciones.php';


if ($_REQUEST) {
    $id_departamento = $_REQUEST['id_departamento'];

    $id_departamento = !is_numeric($id_departamento) ? obtener_id_departamento($id_departamento) : $id_departamento;

    $array = [];
    $datos = obtener_datos($id_departamento);
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




function obtener_datos($id_departamento = false)
{
    $conexion = connection(DB);
    $tabla = TABLA_DEPARTAMENTOS;

    if ($id_departamento == false) {
        $sql = "SELECT id, nombre FROM {$tabla} ORDER BY id ASC";
    } else {
        $sql = "SELECT id, nombre FROM {$tabla} WHERE id != '$id_departamento' ORDER BY id ASC";
    }

    return mysqli_query($conexion, $sql);
}

function obtener_id_departamento($id_departamento)
{
    $conexion = connection(DB);
    $tabla = TABLA_DEPARTAMENTOS;

    $sql = "SELECT id FROM {$tabla} WHERE nombre = '$id_departamento' ORDER BY id ASC";
    $consulta = mysqli_query($conexion, $sql);

    return mysqli_fetch_assoc($consulta)['id'];
}
