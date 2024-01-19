<?php
include '../../configuraciones.php';


$tabla["data"] = [];


$datos = listado_usuarios();

while ($row = mysqli_fetch_assoc($datos)) {
    $id = $row["id"];
    $nombre = $row["nombre"];
    $apellido = $row["apellido"];
    $area = $row["area"];
    $departamento = $row["departamento"];
    $consultar_email = obtener_email($id);
    $listado_email = [];
    $email = "";
    $consultar_interno = obtener_interno($id);
    $listado_interno = [];
    $interno = "";


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


    $tabla["data"][] = [
        "id"           => $id,
        "interno"      => $interno,
        "nombre"       => $nombre . " " . $apellido,
        "sector"       => $area,
        "email"        => $email,
        "departamento" => $departamento . "/Uruguay"
    ];
}



echo json_encode($tabla);






function listado_usuarios()
{
    $conexion = connection(DB);
    $tabla1 = TABLA_USUARIOS;
    $tabla2 = TABLA_AREAS;
    $tabla3 = TABLA_DEPARTAMENTOS;

    $sql = "SELECT
    u.id,
    u.usuario,
    u.nombre,
    u.apellido,
    u.area AS 'id_area',
    a.nombre AS 'area',
    u.departamento AS 'id_departamento',
    d.nombre AS 'departamento'
    FROM
    {$tabla1} u
    INNER JOIN {$tabla2} a ON a.id = u.area
    INNER JOIN {$tabla3} d ON d.id = u.departamento
    WHERE u.activo = 1";

    return mysqli_query($conexion, $sql);
}

function obtener_email($id)
{
    $conexion = connection(DB);
    $tabla = TABLA_EMAILS;

    $sql = "SELECT email FROM {$tabla} WHERE id_usuario = '$id'";

    $consulta = mysqli_query($conexion, $sql);

    return $consulta;
}

function obtener_interno($id)
{
    $conexion = connection(DB);
    $tabla = TABLA_INTERNOS_USUARIOS;

    $sql = "SELECT interno FROM {$tabla} WHERE id_usuario = '$id'";

    $consulta = mysqli_query($conexion, $sql);

    return $consulta;
}
