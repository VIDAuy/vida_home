<?php

include '../../../../configuraciones.php';


$titulo = $_REQUEST['titulo'];
$sub_titulo = $_REQUEST['sub_titulo'];
$link = $_REQUEST['link'];
$variante = $_REQUEST['variante'];


if (validar_url($link) === false) {
    $respuesta['error'] = true;
    $respuesta['mensaje'] = ERROR_LINK_INVALIDO;
    die(json_encode($respuesta));
}


if (count($_FILES) > 0) {
    $imagen = $_FILES['imagen'];
    $tipo = $imagen['type'];

    if ($tipo == "image/jpg" || $tipo == "image/jpeg" || $tipo == "image/png") {
        $archivo = insertar_marcador($imagen, $titulo, $sub_titulo, $link, $variante);
    } else {
        $respuesta['error'] = true;
        $respuesta['mensaje'] = "El logo cargado solo puede ser de tipo .jpg, .jpeg o .png";
        die(json_encode($respuesta));
    }
} else {
    $respuesta['error'] = true;
    $respuesta['mensaje'] = "Debe ingresar un Logo";
    die(json_encode($respuesta));
}



$respuesta['error'] = false;
$respuesta['mensaje'] = 'Se ha cargado el nuevo marcador con éxito';



echo json_encode($respuesta);





function insertar_marcador($imagen, $titulo, $sub_titulo, $link, $variante)
{
    $conexion = connection(DB);
    $tabla = TABLA_MARCADORES;

    $extension_archivo = strtolower(pathinfo(basename($imagen["name"]), PATHINFO_EXTENSION));
    $nombre_archivo =  generarHash(20) . '.' . $extension_archivo;
    $ruta_origen = $imagen["tmp_name"];

    $destino = "../../../../../assets/img/logos/" . $nombre_archivo;


    $sub_titulo = $sub_titulo == "" ? NULL : $sub_titulo;

    if (move_uploaded_file($ruta_origen, $destino)) {
        $insert_carga = "INSERT INTO {$tabla}(logo, `url`, titulo, sub_titulo, variantes) VALUES ('{$nombre_archivo}', '{$link}', '{$titulo}', '{$sub_titulo}', '{$variante}')";
        $respuesta = mysqli_query($conexion, $insert_carga);
    } else {
        $respuesta['error'] = true;
        $respuesta['mensaje'] = "Error al cargar el archivo";
        die(json_encode($respuesta));
    }

    return $respuesta;
}
