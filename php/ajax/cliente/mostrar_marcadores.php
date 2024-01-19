<?php
include '../../configuraciones.php';


$id_area = $_REQUEST['id_area'];
$id_usuario = $_REQUEST['id_usuario'];


$datos_area = obtener_datos_area($id_area);

$response = [];
while ($row = mysqli_fetch_assoc($datos_area)) {
    $id = $row['id'];
    $logo = $row['logo'];
    $url = $row['url'];
    $titulo = $row['titulo'];
    $sub_titulo = $row['sub_titulo'];
    $version = $row['version'];
    $pendiente = $row['pendiente'];
    $variantes = $row['variantes'];

    /** ITEM COMÚN - LOGO CON TÍTULO **/
    if ($variantes == 1) {
        $html = "<td>
                    <img src='{$URL_LOGOS}{$logo}' width='auto' onclick='window.open(`" . $url . "`);' />
                    <br>
                    <button class='boton' onclick='window.open(`" . $url . "`);'>" . $titulo . "</button>
                </td>";


        /** ITEM CON SPAN PRÓXIMAMENTE - LOGO CON TÍTULO Y SPAN **/
    } else if ($variantes == 2) {
        $html = "<td>
                    <img src='{$URL_LOGOS}{$logo}' width='auto' style='filter: grayscale(1);' />
                    <br>
                    <button class='boton' style='filter: grayscale(1);'>" . $titulo . "</button><br />
                    <span class='proximamenterojo'>Próximamente</span>
                </td>";


        /** ITEM CON SUB TÍTULO - LOGO CON TÍTULO Y SUB TÍTULO **/
    } else if ($variantes == 3) {
        $html = "<td>
                    <img src='{$URL_LOGOS}{$logo}' width='auto' onclick='window.open(`" . $url . "`);' />
                    <br>
                    <button class='boton' onclick='window.open(`" . $url . "`);'>" . $titulo . "</button>
                    <button class='boton' onclick='document.getElementById('procedimientosypoliticas').style.display='block'>" . $sub_titulo . "</button>
                </td>";


        /** ITEM CON SPAN PRIMERA VERSIÓN - LOGO CON TÍTULO Y SPAN **/
    } else if ($variantes == 4) {
        $html = "<td>
                    <img src='{$URL_LOGOS}{$logo}' width='auto' onclick='window.open(`" . $url . "`);' />
                    <br>
                    <button class='boton' onclick='window.open(`" . $url . "`);'>" . $titulo . "</button><br />
                    <span class='ventanaemergente'>Primera Versión</span>
                </td>";
    }
    array_push($response, $html);
}


$datos_usuario = obtener_datos_usuario($id_usuario);

while ($row = mysqli_fetch_assoc($datos_usuario)) {

    $id = $row['id'];
    $logo = $row['logo'];
    $url = $row['url'];
    $titulo = $row['titulo'];
    $sub_titulo = $row['sub_titulo'];
    $version = $row['version'];
    $pendiente = $row['pendiente'];
    $variantes = $row['variantes'];


    /** ITEM COMÚN - LOGO CON TÍTULO **/
    if ($variantes == 1) {
        $html = "<td>
                    <img src='{$URL_LOGOS}{$logo}' width='auto' onclick='window.open(`" . $url . "`);' />
                    <br>
                    <button class='boton' onclick='window.open(`" . $url . "`);'>" . $titulo . "</button>
                </td>";


        /** ITEM CON SPAN PRÓXIMAMENTE - LOGO CON TÍTULO Y SPAN **/
    } else if ($variantes == 2) {
        $html = "<td>
                    <img src='{$URL_LOGOS}{$logo}' width='auto' style='filter: grayscale(1);' />
                    <br>
                    <button class='boton' style='filter: grayscale(1);'>" . $titulo . "</button><br />
                    <span class='proximamenterojo'>Próximamente</span>
                </td>";


        /** ITEM CON SUB TÍTULO - LOGO CON TÍTULO Y SUB TÍTULO **/
    } else if ($variantes == 3) {
        $html = "<td>
                    <img src='{$URL_LOGOS}{$logo}' width='auto' onclick='window.open(`" . $url . "`);' />
                    <br>
                    <button class='boton' onclick='window.open(`" . $url . "`);'>" . $titulo . "</button>
                    <button class='boton' onclick='document.getElementById('procedimientosypoliticas').style.display='block'>" . $sub_titulo . "</button>
                </td>";


        /** ITEM CON SPAN PRIMERA VERSIÓN - LOGO CON TÍTULO Y SPAN **/
    } else if ($variantes == 4) {
        $html = "<td>
                    <img src='{$URL_LOGOS}{$logo}' width='auto' onclick='window.open(`" . $url . "`);' />
                    <br>
                    <button class='boton' onclick='window.open(`" . $url . "`);'>" . $titulo . "</button><br />
                    <span class='ventanaemergente'>Primera Versión</span>
                </td>";
    }


    array_push($response, $html);
}





echo json_encode($response);




function obtener_datos_area($id_area)
{
    $conexion = connection(DB);
    $tabla = TABLA_MARCADORES;
    $tabla1 = TABLA_MARCADORES_X_AREA;

    $sql = "SELECT
	* 
    FROM
	{$tabla} m
	INNER JOIN {$tabla1} ma ON m.id = ma.id_marcador 
    WHERE
	ma.id_area = '{$id_area}' AND
	m.activo = 1
    ORDER BY m.id ASC";

    return mysqli_query($conexion, $sql);
}

function obtener_datos_usuario($id_usuario)
{
    $conexion = connection(DB);
    $tabla = TABLA_MARCADORES;
    $tabla1 = TABLA_MARCADORES_X_PERSONA;

    $sql = "SELECT
	* 
    FROM
	{$tabla} m
	INNER JOIN {$tabla1} mp ON m.id = mp.id_marcador 
    WHERE
	mp.id_usuario = '{$id_usuario}' AND
	m.activo = 1
    ORDER BY m.id ASC";

    return mysqli_query($conexion, $sql);
}
