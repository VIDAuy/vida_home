<?php

function registrar_historial_logs()
{
    $conexion = connection(DB);
    $tabla = TABLA_HISTORIAL_LOGS;

    try {
        $sql = "INSERT INTO {$tabla} (referencia, fecha) VALUES ('CorteABM', NOW())";
        $consulta = mysqli_query($conexion, $sql);
        $id_insert_historial = mysqli_insert_id($conexion);
    } catch (Exception $e) {
        LogDB("Registrar_Error_BD", $sql, $e);
    }

    return $id_insert_historial;
}


function registrar_logs_correctos($consulta, $id_historial_logs)
{
    $conexion = connection(DB);
    $tabla1 = TABLA_LOGS_CORRECTOS;

    try {
        $query_recomillada = reemplazar_comillas_simples($consulta);

        $sql = "INSERT INTO {$tabla1} (consulta, id_historial_logs) VALUES ('{$query_recomillada}', '{$id_historial_logs}')";

        $ejecutar_sql = mysqli_query($conexion, $sql);
    } catch (Exception $e) {
        LogDB("Registrar_Correcto_BD", $sql, $e);
    }
}


function registrar_logs_errores($referencia, $consulta, $error, $id_historial_logs)
{
    $conexion = connection(DB);
    $tabla1 = TABLA_LOGS_ERRORES;

    try {
        $query_recomillada = reemplazar_comillas_simples($consulta);
        $error_recomillado = reemplazar_comillas_simples($error);

        $sql = "INSERT INTO {$tabla1} (referencia, consulta, error, id_historial_logs) VALUES ('{$referencia}', '{$query_recomillada}', '{$error_recomillado}', '{$id_historial_logs}')";

        $ejecutar_sql = mysqli_query($conexion, $sql);
    } catch (Exception $e) {
        LogDB("Registrar_Error_BD", $sql, $e);
    }
}


function reemplazar_comillas_simples($valor)
{
    return str_replace("'", '"', $valor);
}


function verificar_usuario($id = null, $usuario = null, $password = null, $tipo = null, $hash = null, $verificar_sesion = false)
{
    $conexion = connection(DB);
    $tabla1 = TABLA_USUARIOS;
    $tabla2 = TABLA_DEPARTAMENTOS;
    $tabla3 = TABLA_AREAS;

    if ($id === null && $tipo === null && $hash === null && $verificar_sesion === false) {
        $sql = "SELECT
        u.id,
        u.nombre,
        u.apellido,
        d.nombre AS 'departamento',
        u.usuario,
        a.id AS 'id_area',
        a.nombre AS 'area',
        u.tipo,
        u.`hash`
        FROM
        {$tabla1} u
        INNER JOIN {$tabla2} d ON d.id = u.departamento
        INNER JOIN {$tabla3} a ON a.id = u.area
        WHERE
        BINARY u.usuario = '{$usuario}' AND
        BINARY u.`password` = '{$password}' AND 
        u.activo = 1";
    } else {
        $sql = "SELECT
        u.id,
        u.nombre,
        u.apellido,
        d.nombre AS 'departamento',
        u.usuario,
        a.id AS 'id_area',
        a.nombre AS 'area',
        u.tipo,
        u.`hash`
        FROM
        {$tabla1} u
        INNER JOIN {$tabla2} d ON d.id = u.departamento
        INNER JOIN {$tabla3} a ON a.id = u.area
        WHERE
        u.id = '{$id}' AND
        BINARY usuario = '{$usuario}' AND
        u.tipo = '{$tipo}' AND
        u.`hash` = '{$hash}' AND
        u.activo = 1";
    }
    $consulta = mysqli_query($conexion, $sql);
    $datos = mysqli_fetch_assoc($consulta);

    $datos_id = $datos['id'];
    $datos_nombre = $datos['nombre'];
    $datos_apellido = $datos['apellido'];
    $datos_departamento = $datos['departamento'];
    $datos_usuario = $datos['usuario'];
    $datos_id_area = $datos['id_area'];
    $datos_area = $datos['area'];
    $datos_tipo = $datos['tipo'];
    $datos_hash = $datos['hash'];

    $array = [
        "id" => $datos_id,
        "nombre" => $datos_nombre,
        "apellido" => $datos_apellido,
        "departamento" => $datos_departamento,
        "usuario" => $datos_usuario,
        "id_area" => $datos_id_area,
        "area" => $datos_area,
        "tipo" => $datos_tipo,
        "hash" => $datos_hash,
    ];


    $activo = $datos_usuario;
    $respuesta = $activo === null ? false : $array;

    return $respuesta;
}


function corregirTelefono($var)
{
    // CORRECCIÓN Y ASIGNACIÓN DE TELÉFONO
    if (strlen($var) === 0)
        return 'Sin datos';

    //EN CASO DE QUE EL TELÉFONO EMPIECE CON '0' Y UN ESPACIO LOS QUITA DE LA VARIABLE
    if (mb_substr($var, 0, 2) == '0 ') $var = mb_substr($var, 2, 20);

    //REEMPLAZA TODOS LOS ESPACIOS QUE TENGA LA VARIABLE
    $var = str_replace(' ', '', $var);

    if ($var[0] == 9) $var = 0 . $var;

    //EN CASO DE QUE EL NÚMERO EMPIECE CON 09 Y TENGA MÁS DE 8 CARACTÉRES SE LE ASIGNA ESE VALOR A LA VARIABLE CELULAR
    if (mb_substr($var, 0, 2) == '09' && strlen($var) > 8) $celularFuncion = mb_substr($var, 0, 9);

    ///EN CASO DE QUE EL NÚMERO EMPIECE CON 2 O 4 Y TENGA MÁS DE 7 CARACTÉRES SE LE ASIGNA ESE VALOR A LA VARIABLE TELEFONO
    if (($var[0] == 2 || $var[0] == 4) && strlen($var) > 7) $telefonoFuncion = mb_substr($var, 0, 8);

    //SI EL LARGO DE LA VARIABLE ES IGUAL A 17 (LA SUMA DE LOS 9 CARACTERES DE UN TELÉFONO MÁS LOS 8 DE UN CELULAR) DIVIDE EL STRING
    if (strlen($var) == 17) {
        //EN CASO DE QUE CONTENGA LA SINTÁXIS DE TELÉFONO SE LE ASIGNA LA mb_substrING A LA VARIABLE TELEFONO
        if (isset($var[9]) && ($var[9] == 2 || $var[9] == 4) && mb_substr($var, 7, 9) != '09') $telefonoFuncion = mb_substr($var, 9, 18);
        //EN CASO DE QUE CONTENGA LA SINTÁXIS DE CELULAR SE LE ASIGNA LA mb_substrING A LA VARIABLE CELULAR
        if (isset($var[8]) && mb_substr($var, 8, 2) == '09') $celularFuncion = mb_substr($var, 8, 18);
    }

    //EN CASO DE QUE LA VARIABLE CELULAR NO SE HAYA DEFINIDO LE ASIGNA UN STRING VACÍO PARA NO GENERAR CONFLICTOS EN LA QUERY

    if (!isset($celularFuncion)) $celularFuncion = null;
    if (!isset($telefonoFuncion)) $telefonoFuncion = null;

    if ($telefonoFuncion != null && $celularFuncion != null) {
        $telFuncion = $telefonoFuncion;
        $telFuncion .= ' ';
        $telFuncion .= $celularFuncion;
    } else if ($telefonoFuncion != null && $celularFuncion == '') $telFuncion = $telefonoFuncion;
    else if ($telefonoFuncion == '' && $celularFuncion != null) $telFuncion = $celularFuncion;
    else $telFuncion = '';

    unset($telefonoFuncion);
    unset($celularFuncion);

    return $telFuncion;
}
