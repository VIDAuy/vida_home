<?php
include '../../../../configuraciones.php';


$cedula = $_REQUEST['cedula'];
$nombre = $_REQUEST['nombre'];
$apellido = $_REQUEST['apellido'];
$area = $_REQUEST['area'];
$departamento = $_REQUEST['departamento'];
$emails = $_REQUEST['emails'];
$internos = $_REQUEST['interno'];


if ($cedula == "" || $nombre == "" || $apellido == "" || $area == "" || $departamento == "" || count($emails) == 0 || count($internos) == 0) {
    $response['error'] = true;
    $response['mensaje'] = ERROR_GENERAL;
    die(json_encode($response));
}

foreach ($emails as $email) {
    if (validar_email($email) == true) {
        $response['error'] = true;
        $response['mensaje'] = "El email <span class='fw-bolder'> $email </span> no es válido";
        die(json_encode($response));
    }
}

foreach ($internos as $interno) {
    if (!is_numeric($interno)) {
        $response['error'] = true;
        $response['mensaje'] = "El interno <span class='fw-bolder'> $interno </span> no es válido. <br> ¡Solo se admiten caracteres numéricos!";
        die(json_encode($response));
    }
}


$id_usuario = insertar_usuario($nombre, $apellido, $area, $departamento, $cedula);

if ($id_usuario === false) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrieron errores al agregar el usuario";
    die(json_encode($response));
}

$agregar_emails = insertar_emails($id_usuario, $emails);

if ($agregar_emails > 0) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrieron errores al agregar los emails";
    die(json_encode($response));
}

$agregar_internos = insertar_internos($id_usuario, $internos);

if ($agregar_internos > 0) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrieron errores al agregar los internos";
    die(json_encode($response));
}



$response['error'] = false;
$response['mensaje'] = "Se creo el usuario con éxito";


echo json_encode($response);






function insertar_usuario($nombre, $apellido, $area, $departamento, $cedula)
{
    $conexion = connection(DB);
    $tabla = TABLA_USUARIOS;
    $hash = generarHash(50);

    $sql = "INSERT INTO {$tabla} (nombre, apellido, area, departamento, usuario, `password`, `hash`) VALUES ('$nombre', '$apellido', '$area', '$departamento', '$cedula', '$cedula', '$hash')";
    $consulta = mysqli_query($conexion, $sql);

    return $consulta == true ? mysqli_insert_id($conexion) : false;
}


function insertar_emails($id_usuario, $emails)
{
    $conexion = connection(DB);
    $tabla = TABLA_EMAILS;

    $errores = 0;
    foreach ($emails as $email) {
        $sql = "INSERT INTO {$tabla} (id_usuario, email) VALUES ('$id_usuario', '$email')";
        $consulta = mysqli_query($conexion, $sql);

        if ($consulta === false) {
            $errores++;
        }
    }

    return $errores;
}

function insertar_internos($id_usuario, $internos)
{
    $conexion = connection(DB);
    $tabla = TABLA_INTERNOS_USUARIOS;

    $errores = 0;
    foreach ($internos as $interno) {
        $sql = "INSERT INTO {$tabla} (id_usuario, interno) VALUES ('$id_usuario', '$interno')";
        $consulta = mysqli_query($conexion, $sql);

        if ($consulta === false) {
            $errores++;
        }
    }

    return $errores;
}
