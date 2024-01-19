<?php
include '../../../../configuraciones.php';


$id = $_REQUEST['id'];
$tabla["data"] = [];


$datos = listado_emails($id);

while ($row = mysqli_fetch_assoc($datos)) {
    $id = $row["id"];
    $id_usuario = $row["id_usuario"];
    $email = $row["email"];

    $tabla["data"][] = [
        "id" => $id,
        "email" => $email,
        "acciones" => "<button class='btn btn-sm btn-info' onclick='editar_email_usuario(true, `" . $id . "`, `" . $id_usuario . "`, `" . $email . "`);'>✎</button>
        <button class='btn btn-sm btn-danger' onclick='eliminar_email_usuario(`" . $id . "`, `" . $id_usuario . "`);'>❌</button>",
    ];
}



echo json_encode($tabla);




function listado_emails($id)
{
    $conexion = connection(DB);
    $tabla = TABLA_EMAILS;

    $sql = "SELECT id, id_usuario, email FROM {$tabla} WHERE id_usuario = '$id'";

    return mysqli_query($conexion, $sql);
}
