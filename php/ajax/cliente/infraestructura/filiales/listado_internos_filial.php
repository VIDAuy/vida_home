<?php
include '../../../../configuraciones.php';


$id = $_REQUEST['id'];
$tabla["data"] = [];


$datos = listado_emails($id);

while ($row = mysqli_fetch_assoc($datos)) {
    $id = $row["id"];
    $id_filial = $row["id_filial"];
    $interno = $row["interno"];

    $tabla["data"][] = [
        "id" => $id,
        "interno" => $interno,
        "acciones" => "<button class='btn btn-sm btn-info' onclick='editar_interno_filial(true, `" . $id . "`, `" . $id_filial . "`, `" . $interno . "`);'>✎</button>
        <button class='btn btn-sm btn-danger' onclick='eliminar_interno_filial(`" . $id . "`, `" . $id_filial . "`);'>❌</button>",
    ];
}



echo json_encode($tabla);




function listado_emails($id)
{
    $conexion = connection(DB);
    $tabla = TABLA_INTERNOS_FILIALES;

    $sql = "SELECT id, id_filial, interno FROM {$tabla} WHERE id_filial = '$id'";

    return mysqli_query($conexion, $sql);
}
