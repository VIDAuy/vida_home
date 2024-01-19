<?php
include '../../../../configuraciones.php';


$tabla["data"] = [];


$datos = obtener_datos();

while ($row = mysqli_fetch_assoc($datos)) {
    $id_usuario = $row["id_usuario"];
    $cedula = $row["cedula"];
    $nombre_usuario = $row["nombre_usuario"];
    $apellido_usuario = $row["apellido"];
    $id_marcadores_asignados = $row["id_marcadores_asignados"];
    $id_marcador = $row["id_marcador"];
    $titulo_marcador = $row["titulo_marcador"];
    $sub_titulo_marcador = $row["sub_titulo_marcador"];

    $todo_titulo = $sub_titulo_marcador == "" ? $titulo_marcador : $titulo_marcador . " ➡ " . $sub_titulo_marcador;


    $tabla["data"][] = [
        "id" => $id_marcadores_asignados,
        "cedula" => $cedula,
        "nombre" => $nombre_usuario,
        "apellido" => $apellido_usuario,
        "marcador" => $todo_titulo,
        "acciones" => "<button class='btn btn-sm btn-danger' onclick='confirmar_eliminar_marcador_persona(`" . $id_marcadores_asignados . "`, `" . $nombre_usuario . "`, `" . $apellido_usuario . "`, `" . $titulo_marcador . "`);'>❌</button>",
    ];
}



echo json_encode($tabla);




function obtener_datos()
{
    $conexion = connection(DB);
    $tabla = TABLA_USUARIOS;
    $tabla1 = TABLA_MARCADORES_X_PERSONA;
    $tabla2 = TABLA_MARCADORES;

    $sql = "SELECT
	u.id AS 'id_usuario',
    u.usuario AS 'cedula',
	u.nombre AS 'nombre_usuario',
    u.apellido,
	mp.id AS 'id_marcadores_asignados',
	mp.id_marcador,
	m.titulo AS 'titulo_marcador',
    m.sub_titulo AS 'sub_titulo_marcador'
    FROM
	{$tabla} u
	INNER JOIN {$tabla1} mp ON u.id = mp.id_usuario
	INNER JOIN {$tabla2} m ON m.id = mp.id_marcador";

    return mysqli_query($conexion, $sql);
}
