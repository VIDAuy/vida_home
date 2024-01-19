<?php
include '../../configuraciones.php';

$tipo = $_REQUEST['tipo'];


$datos = obtener_listado($tipo);

$array = [];
$contador = 1;
$mostrar = 0;

while ($row = mysqli_fetch_assoc($datos)) {

    $titulo = $row['titulo'];
    $nombre = $row['nombre'];
    $url = $row['url'];
    $tipo_iso = intval($row['tipo_iso']);


    if ($contador != $tipo_iso) {
        $contador++;
    }

    $html = "";

    if ($contador == 1 && $mostrar == 0) {
        $html .= "<h3 class='text-decoration-underline'>ISO 27001</h3>";
        $mostrar++;
    }

    if ($contador == 2 && $mostrar == 1) {
        $html .= "<h3 class='text-decoration-underline mt-4'>ISO 14001</h3>";
        $mostrar++;
    }

    if ($contador == 3 && $mostrar == 2) {
        $html .= "<h3 class='text-decoration-underline mt-4'>ISO 9001</h3>";
        $mostrar++;
    }

    $html .= "<li>
                <i class='bi bi-chevron-right'></i>
                <a href='{$URL_ASSETS}{$url}{$nombre}' target='_blank'>" . $titulo . "</a>
            </li>";

    array_push($array, $html);
}


$response['datos'] = $array;

echo json_encode($response);




function obtener_listado($tipo)
{
    $conexion = connection(DB);
    $tabla = TABLA_ARCHIVOS_ISO;

    $sql = "SELECT * FROM {$tabla} WHERE activo = 1 ORDER BY id ASC";

    return mysqli_query($conexion, $sql);
}
