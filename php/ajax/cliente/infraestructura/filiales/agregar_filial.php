<?php
include '../../../../configuraciones.php';


$nombre       = $_REQUEST['filial'];
$departamento = $_REQUEST['departamento'];
$emails       = $_REQUEST['emails_filiales'];
$internos     = $_REQUEST['internos_filiales'];


if ($nombre == "" || $departamento == "" || count($emails) == 0 || count($internos) == 0) {
    $response['error'] = true;
    $response['mensaje'] = ERROR_GENERAL;
    die(json_encode($response));
}

foreach ($emails as $email) {
    if (validar_email($email) === true) {
        $response['error'] = true;
        $response['mensaje'] = 'El email "' . $email . '" no es válido';
        die(json_encode($response));
    }
}

foreach ($internos as $interno) {
    if (!is_numeric($interno)) {
        $response['error'] = true;
        $response['mensaje'] = 'El interno "' . $interno . '" no es válido. <br> Solo se aceptan valores numéricos';
        die(json_encode($response));
    }
}


$id_filial = registrar_filial($nombre, $departamento);

if ($id_filial === false) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrio un error al registrar la filial";
    die(json_encode($response));
}


$ingresar_emails = registrar_emails($id_filial, $emails);

if ($ingresar_emails === false) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrio un error al registrar los emails";
    die(json_encode($response));
}


$ingresar_internos = registrar_internos($id_filial, $internos);

if ($ingresar_internos === false) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrio un error al registrar los emails";
    die(json_encode($response));
}




$response['error'] = false;
$response['mensaje'] = "Se registro la filial con éxito";

echo json_encode($response);




function registrar_filial($nombre, $departamento)
{
    $conexion = connection(DB);
    $tabla = TABLA_FILIALES;

    $sql = "INSERT INTO {$tabla} (nombre, departamento) VALUES ('$nombre', '$departamento')";
    $consulta = mysqli_query($conexion, $sql);

    return $consulta === true ? mysqli_insert_id($conexion) : false;
}

function registrar_emails($id_filial, $emails)
{
    $conexion = connection(DB);
    $tabla = TABLA_EMAILS_FILIALES;

    $errores = 0;
    foreach ($emails as $email) {

        $sql = "INSERT INTO {$tabla} (id_filial, email) VALUES ('$id_filial', '$email')";
        $consulta = mysqli_query($conexion, $sql);

        $errores = $consulta === false ? $errores++ : $errores;
    }

    return $errores == 0 ? true : false;
}

function registrar_internos($id_filial, $internos)
{
    $conexion = connection(DB);
    $tabla = TABLA_INTERNOS_FILIALES;

    $errores = 0;
    foreach ($internos as $interno) {

        $sql = "INSERT INTO {$tabla} (id_filial, interno) VALUES ('$id_filial', '$interno')";
        $consulta = mysqli_query($conexion, $sql);

        $errores = $consulta === false ? $errores++ : $errores;
    }

    return $errores == 0 ? true : false;
}
