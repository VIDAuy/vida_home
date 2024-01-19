<?php
include '../../../../configuraciones.php';


$tabla["data"] = [];


$datos = obtener_datos();

while ($row = mysqli_fetch_assoc($datos)) {
    $id = $row["id"];
    $titulo = $row["titulo"];
    $sub_titulo = $row["sub_titulo"];
    $logo = $row["logo"];
    $imagen = "<img src='{$URL_LOGOS}{$logo}' width='50px' height='auto' />";
    $link = $row["url"];
    $variantes = $row["variantes"];
    $nombre_variante = $row["nombre_variante"];

    if ($variantes == 1) {
        $variantes_mostrar = "<span class='badge text-bg-success'>Común</span>";
    } elseif ($variantes == 2) {
        $variantes_mostrar = "<span class='badge text-bg-danger'>Proximamente</span>";
    } elseif ($variantes == 3) {
        $variantes_mostrar = "<span class='badge text-bg-warning'>Sub Título</span>";
    } elseif ($variantes == 4) {
        $variantes_mostrar = "<span class='badge text-bg-primary'>Primera Versión</span>";
    }

    $sub_titulo_mostrar = $sub_titulo != "" ? $sub_titulo : "<span class='badge text-bg-danger'>Ninguno</span>";
    $link_mostrar = $link != "" ? "<a href='$link' target='_blank'>$link</a>" : "<span class='badge text-bg-danger'>Ninguno</span>";


    $tabla["data"][] = [
        "id" => $id,
        "titulo" => $titulo,
        "sub_titulo" => $sub_titulo_mostrar,
        "imagen" => $imagen,
        "link" => $link_mostrar,
        "variantes" => $variantes_mostrar,
        "acciones" => "<button class='btn btn-sm btn-info' onclick='editar_datos_marcador(true, `" . $id . "`, `" . $titulo . "`, `" . $sub_titulo . "`, `" . $link . "`, `" . $variantes . "`, `" . $nombre_variante . "`);'>✎</button>
        <button class='btn btn-sm btn-danger' onclick='confirmar_eliminar_marcador(`" . $id . "`);'>❌</button>",
    ];
}



echo json_encode($tabla);




function obtener_datos()
{
    $conexion = connection(DB);
    $tabla = TABLA_MARCADORES;
    $tabla1 = TABLA_TIPO_VARIANTE_MARCADORES;

    $sql = "SELECT
    m.id,
    m.logo,
    m.`url`,
    m.titulo,
    m.sub_titulo,
    m.variantes,
    tvm.nombre AS 'nombre_variante'
    FROM
    {$tabla} m
    INNER JOIN {$tabla1} tvm ON m.variantes = tvm.id
    WHERE m.activo = 1";

    return mysqli_query($conexion, $sql);
}
