<?php
include '../../../../configuraciones.php';

$id = $_REQUEST['id'];
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

        $imagen_actual = obtener_nombre_imagen($id);
        if ($imagen_actual != "") {
            if (unlink("../../../assets/img/logos/" . $imagen_actual)) {
                $editar_marcador = editar_marcador_imagen($id, $titulo, $sub_titulo, $link, $variante, $imagen);
            } else {
                $respuesta['error'] = true;
                $respuesta['message'] = "Ocurrio un error al eliminar el logo existente";
                die(json_encode($respuesta));
            }
        } else {
            $editar_marcador = editar_marcador_imagen($id, $titulo, $sub_titulo, $link, $variante, $imagen);
        }
    } else {
        $respuesta['error'] = true;
        $respuesta['message'] = "El logo cargado solo puede ser de tipo .jpg, .jpeg o .png";
        die(json_encode($respuesta));
    }
} else {
    $editar_marcador = editar_marcador($id, $titulo, $sub_titulo, $link, $variante);
}



if ($editar_marcador === false) {
    $response['error'] = true;
    $response['mensaje'] = "Ocurrio un error al intentar editar el usuario";
    die(json_encode($response));
}



$response['error'] = false;
$response['mensaje'] = "Se ha editado el usuario con éxito";

echo json_encode($response);





function editar_marcador_imagen($id, $titulo, $sub_titulo, $link, $variante, $imagen)
{
    $conexion = connection(DB);
    $tabla = TABLA_MARCADORES;

    $extension_archivo = strtolower(pathinfo(basename($imagen["name"]), PATHINFO_EXTENSION));
    $nombre_archivo =  generarHash(20) . '.' . $extension_archivo;
    $ruta_origen = $imagen["tmp_name"];

    $destino = "../../../assets/img/logos/" . $nombre_archivo;

    $sub_titulo = $sub_titulo == "" ? NULL : $sub_titulo;

    if (move_uploaded_file($ruta_origen, $destino)) {
        $sql = "UPDATE {$tabla} SET logo = '$nombre_archivo', `url` = '$link', titulo = '$titulo', sub_titulo = '$sub_titulo', variantes = '$variante' WHERE id = '$id'";
        $respuesta = mysqli_query($conexion, $sql);
    } else {
        $respuesta['error'] = true;
        $respuesta['message'] = "Error al cargar el archivo";
        die(json_encode($respuesta));
    }

    return $respuesta;
}

function editar_marcador($id, $titulo, $sub_titulo, $link, $variante)
{
    $conexion = connection(DB);
    $tabla = TABLA_MARCADORES;

    $sql = "UPDATE {$tabla} SET titulo = '$titulo', sub_titulo = '$sub_titulo', `url` = '$link', variantes = '$variante' WHERE id = '$id'";

    return mysqli_query($conexion, $sql);
}

function obtener_nombre_imagen($id)
{
    $conexion = connection(DB);
    $tabla = TABLA_MARCADORES;

    $sql = "SELECT logo FROM {$tabla} WHERE id = '$id'";
    $consulta = mysqli_query($conexion, $sql);

    return mysqli_fetch_assoc($consulta)['logo'];
}
