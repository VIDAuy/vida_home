<?php
include '../../../../configuraciones.php';


$tabla["data"] = [];


$datos = obtener_datos();

while ($row = mysqli_fetch_assoc($datos)) {
    $id_area = $row["id_area"];
    $nombre_area = $row["nombre_area"];
    $id_marcadores_asignados = $row["id_marcadores_asignados"];
    $id_marcador = $row["id_marcador"];
    $titulo_marcador = $row["titulo_marcador"];


    $tabla["data"][] = [
        "id" => $id_marcadores_asignados,
        "area" => $nombre_area,
        "marcador" => $titulo_marcador,
        "acciones" => "<button class='btn btn-sm btn-danger' onclick='confirmar_eliminar_marcador_area(`" . $id_marcadores_asignados . "`, `" . $nombre_area . "`, `" . $titulo_marcador . "`);'>❌</button>",
    ];
}



echo json_encode($tabla);




function obtener_datos()
{
    $conexion = connection(DB);
    $tabla = TABLA_AREAS;
    $tabla1 = TABLA_MARCADORES_X_AREA;
    $tabla2 = TABLA_MARCADORES;

    $sql = "SELECT
	a.id AS 'id_area',
	a.nombre AS 'nombre_area',
	ma.id AS 'id_marcadores_asignados',
	ma.id_marcador,
	m.titulo AS 'titulo_marcador'
    FROM
	{$tabla} a
	INNER JOIN {$tabla1} ma ON a.id = ma.id_area
	INNER JOIN {$tabla2} m ON m.id = ma.id_marcador";

    return mysqli_query($conexion, $sql);
}
