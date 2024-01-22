<?php

if (session_status() !== PHP_SESSION_ACTIVE)    session_start();

date_default_timezone_set('America/Montevideo');

define("PATH_APP", __DIR__);

const PRODUCCION = true; // para definir si es test o producción la APP

$URL_LOGOS = "http://192.168.1.13/vida_home/assets/img/logos/";
$URL_ASSETS = "http://192.168.1.13/vida_home/assets/";

error_reporting(PRODUCCION ? 0 : E_ALL);

//HEADERS
header('Cache-Control: no-cache, must-revalidate');
header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
header('Content-Type: application/json; charset=ISO-8859-1');
header('Content-Type: text/html; charset=ISO-8859-1');
header('Access-Control-Allow-Methods: GET, POST');
header('Access-Control-Allow-Origin: *');


const PATH_FUNCIONEs = "modelos/";
const PATH_LIB = "lib/";

//DB Conexiones
include_once PATH_APP . "/db.php";

//Lib
include_once PATH_LIB . "monolog/monolog.php";
include_once PATH_LIB . "validate.php";
//include_once PATH_LIB . "PHPExcel-1.8/Classes/PHPExcel.php";

//LOGS
//const LOGS_DIR = PATH_APP . "/logs";

//Utils /Functions
include_once "funciones.php";
include_once "utils.php";


// DB
// DB PRODUCCION
const DB_PROD = array("host" => "192.168.1.13", "user" => "root", "password" => "sist.2k8", "db" => "vida_home");



//DEV O DB TEST
const DB_TEST = array("host" => "192.168.1.13", "user" => "root", "password" => "sist.2k8", "db" => "vida_home");


//BD PROD O TEST
const DB = PRODUCCION ? DB_PROD : DB_TEST;




//TABLAS BD

const TABLA_ARCHIVOS_ISO             = "archivos_iso";
const TABLA_AREAS                    = "areas";
const TABLA_DEPARTAMENTOS            = "departamentos";
const TABLA_EMAILS                   = "emails";
const TABLA_EMAILS_FILIALES          = "emails_filiales";
const TABLA_FILIALES                 = "filiales";
const TABLA_INTERNOS_FILIALES        = "internos_filiales";
const TABLA_INTERNOS_USUARIOS        = "internos_usuarios";
const TABLA_HISTORIAL_LOGS           = "historial_logs";
const TABLA_LOGS_CORRECTOS           = "logs_correctos";
const TABLA_LOGS_ERRORES             = "logs_errores";
const TABLA_TIPO_USUARIO             = "tipo_usuario";
const TABLA_USUARIOS                 = "usuarios";
const TABLA_MARCADORES               = "marcadores";
const TABLA_MARCADORES_X_AREA        = "marcadores_x_area";
const TABLA_MARCADORES_X_PERSONA     = "marcadores_x_persona";
const TABLA_TIPO_VARIANTE_MARCADORES = "tipo_variante_marcadores";




//HASH o TOKEN
include_once "token.php";

//MENESAJES 
const ERROR_LOGIN            = "Error de usuario o contraseña";
const ERROR_SESSION_USUARIO  = "Error al verificar tu sesión , cierra la sesión y vuelve a ingresar";
const ERROR_GENERAL          = "Ha ocurrido un error, comuníquese con el administrador";

const EXITO_AL_REGISTRAR     = "Se ha guardado el registro con éxito";
const EXITO_AL_MODIFICAR     = "Se modifico el registro con éxito";
const EXITO_AL_ELIMINAR      = "Se ha eliminado el registro con éxito";

const ERROR_AL_REGISTRAR     = "Ocurrieron errores al intentar guardar el registro";
const ERROR_AL_MODIFICAR     = "Ocurrieron errores al intentar modificar el registro";
const ERROR_AL_ELIMINAR      = "Ocurrieron errores al intentar eliminar el registro";

const ERROR_AL_REGISTRAR_USUARIO = "Ocurrieron errores al intentar registrar el usuario";
const ERROR_AL_REGISTRAR_EMAIL   = "Ocurrieron errores al intentar registrar el email";
const ERROR_AL_REGISTRAR_INTERNO = "Ocurrieron errores al intentar registrar el interno";

const ERROR_AL_MODIFICAR_USUARIO = "Ocurrieron errores al intentar modificar el usuario";
const ERROR_AL_MODIFICAR_EMAIL   = "Ocurrieron errores al intentar modificar el email";
const ERROR_AL_MODIFICAR_INTERNO = "Ocurrieron errores al intentar modificar el interno";

const ERROR_AL_ELIMINAR_USUARIO = "Ocurrieron errores al intentar eliminar el usuario";
const ERROR_AL_ELIMINAR_EMAIL   = "Ocurrieron errores al intentar eliminar el email";
const ERROR_AL_ELIMINAR_INTERNO = "Ocurrieron errores al intentar eliminar el interno";

const SIN_REGISTROS          = "No se han encontrado registros";
const ERROR_CREAR_TABLA      = "Error al crear la tabla";
const ERROR_VACIAR_TABLA     = "Error al vaciar la tabla";
const ERROR_INTERNO_INVALIDO = "Debe ingresar un interno válido. <br> ¡Solo se admiten caracteres numéricos!";


//ERRORES
const ERROR_CONSULTA_GENERAL     = "Error en la consulta general";
const ERROR_LINK_INVALIDO        = "Debe ingresar un link válido. <br> Ejemplo: https://www.google.com.uy/";
