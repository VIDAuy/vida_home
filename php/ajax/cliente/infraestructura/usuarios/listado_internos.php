<?php
include '../../../../configuraciones.php';


$id = $_REQUEST['id'];
$tabla["data"] = [];


$datos = listado_internos($id);

while ($row = mysqli_fetch_assoc($datos)) {
    $id = $row["id"];
    $id_usuario = $row["id_usuario"];
    $interno = $row["interno"];

    $tabla["data"][] = [
        "id" => $id,
        "interno" => $interno,
        "acciones" => "<button class='btn btn-sm btn-info' onclick='editar_interno_usuario(true, `" . $id . "`, `" . $id_usuario . "`, `" . $interno . "`);'>✎</button>
        <button class='btn btn-sm btn-danger' onclick='eliminar_interno_usuario(`" . $id . "`, `" . $id_usuario . "`);'>❌</button>",
    ];
}



echo json_encode($tabla);




function listado_internos($id)
{
    $conexion = connection(DB);
    $tabla = TABLA_INTERNOS_USUARIOS;

    $sql = "SELECT id, id_usuario, interno FROM {$tabla} WHERE id_usuario = '$id'";

    return mysqli_query($conexion, $sql);
}
