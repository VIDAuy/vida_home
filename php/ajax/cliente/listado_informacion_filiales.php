<?php
include '../../configuraciones.php';


$tabla["data"] = [];


$datos = listado_filiales();

while ($row = mysqli_fetch_assoc($datos)) {
    $id = $row["id"];
    $nombre = $row["nombre"];
    $departamento = $row["departamento"];
    $consultar_interno = obtener_interno($id);
    $listado_interno = [];
    $interno = "";
    $consultar_email = obtener_email($id);
    $listado_email = [];
    $email = "";

    while ($int = mysqli_fetch_assoc($consultar_interno)) {
        $inter = $int['interno'];
        array_push($listado_interno, $inter);
    }

    if (count($listado_interno) == 1) {
        $interno = $listado_interno[0];
    } else if (count($listado_interno) > 1) {
        foreach ($listado_interno as $int) {
            if ($interno == "") {
                $interno = $int;
            } else {
                $interno = $interno . " / " . $int;
            }
        }
    }

    while ($correo = mysqli_fetch_assoc($consultar_email)) {
        $emial = $correo['email'];
        array_push($listado_email, $emial);
    }

    if (count($listado_email) == 1) {
        $email = $listado_email[0];
    } else if (count($listado_email) > 1) {
        foreach ($listado_email as $correos) {
            if ($email == "") {
                $email = $correos;
            } else {
                $email = $email . " - " . $correos;
            }
        }
    }


    $tabla["data"][] = [
        "id"           => $id,
        "filial"       => $nombre,
        "interno"      => $interno,
        "email"        => $email,
        "departamento" => $departamento . "/Uruguay"
    ];
}



echo json_encode($tabla);




function listado_filiales()
{
    $conexion = connection(DB);
    $tabla = TABLA_FILIALES;

    $sql = "SELECT id, nombre, departamento FROM {$tabla} WHERE activo = 1";

    return mysqli_query($conexion, $sql);
}


function obtener_interno($id)
{
    $conexion = connection(DB);
    $tabla = TABLA_INTERNOS_FILIALES;

    $sql = "SELECT interno FROM {$tabla} WHERE id_filial = '$id'";

    $consulta = mysqli_query($conexion, $sql);

    return $consulta;
}


function obtener_email($id)
{
    $conexion = connection(DB);
    $tabla = TABLA_EMAILS_FILIALES;

    $sql = "SELECT email FROM {$tabla} WHERE id_filial = '$id'";

    $consulta = mysqli_query($conexion, $sql);

    return $consulta;
}
