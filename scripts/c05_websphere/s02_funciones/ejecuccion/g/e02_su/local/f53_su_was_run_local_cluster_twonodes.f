#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="2.5" #  Version del Script actual
FECHA_SCRIPT="Diciembre 2013"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="websphere"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="proceso"
CONCEPT_VARIANTE_04="admin"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- wrun_su_local_cluster_twonodes
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- get_current_timestamp - was_load_parameters
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lanza el wsadmin del websphere indicado
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T was websphere cluster start inicio server
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P ID_WAS
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wrun_su_local_cluster_twonodes soa7a 	-- Lanza el script indicado para el servidor soa7a
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

wrun_su_local_cluster_twonodes()
{
IS_wrun_su_local_cluster_twonodes="Inicia un cluster remoto con un solo nodo"
INFO_SCRIPT=${IS_wrun_su_local_cluster_twonodes}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_wrun_su_local_cluster_twonodes=${INFO_SCRIPT}

ID_WAS=${1}
shift

SALIDA_wrun_su_local_cluster_twonodes=0

NOMBRE_SCRIPT_wrun_su_local_cluster_twonodes=wrun_su_local_cluster_twonodes
PARAMETROS_SCRIPT_wrun_su_local_cluster_twonodes="ID_WAS"

if [ "${ID_WAS}" == "" ]; then
	ID_WAS="-?"
fi  


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${ID_WAS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_wrun_su_local_cluster_twonodes} ${PARAMETROS_SCRIPT_wrun_su_local_cluster_twonodes}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Cargar Datos
#-- [2] Arrancar Manager
#-- [3] Arrancar Nodo
#-- [4] Arrancar Servidor
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_01_wrun_su_local_cluster_twonodes=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
was_load_parameters ${ID_WAS}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

posiciona "00_Start:Carga de parametros-${ID_WAS}"

SALIDA_wrun_su_local_cluster_twonodes=${SALIDA_was_load_parameters}

if [ "${SALIDA_was_load_parameters}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Carga de datos contra el WAS indicado
#--------========--------========--------========--------========---

posiciona "01_Start:Manager-Iniciandose-${ID_WAS}"

. ${LINEA_COMANDO_MANAGER}				&> /dev/null
SALIDA_start_was_manager=${SALIDA_was}

posiciona "02_Start:Manager-Arrancado-${ID_WAS}"

SALIDA_wrun_su_local_cluster_twonodes=${SALIDA_start_was_manager}

if [ "${SALIDA_start_was_manager}" == "0" ] ; then
#--------========--------========--------========--------========---
#------- [2] Inicio Manager del WAS
#--------========--------========--------========--------========---

posiciona "03_Start:Nodo1-Iniciandose-${ID_WAS}"

. ${LINEA_COMANDO_NODO_01}				&> /dev/null
SALIDA_start_was_nodo=${SALIDA_was}

posiciona "04_Start:Nodo2-Iniciandose-${ID_WAS}"

. ${LINEA_COMANDO_NODO_02}
SALIDA_start_was_nodo=${SALIDA_was}

posiciona "05_Start:Nodos-Arrancados-${ID_WAS}"

SALIDA_wrun_su_local_cluster_twonodes=${SALIDA_start_was_nodo}

if [ "${SALIDA_start_was_nodo}" == "0" ] ; then
#--------========--------========--------========--------========---
#--------- [3] Inicio Nodo del WAS
#--------========--------========--------========--------========---

posiciona "06_Start:Servidor-Iniciandose-${ID_WAS}"

. ${LINEA_COMANDO_SERVIDOR_01}			&> /dev/null
SALIDA_start_was_server=${SALIDA_was}

posiciona "07_Start:Servidor-Iniciandose-${ID_WAS}"

. ${LINEA_COMANDO_SERVIDOR_02}
SALIDA_start_was_server=${SALIDA_was}

posiciona "08_Start:Servidor-Arrancado-${ID_WAS}"

SALIDA_wrun_su_local_cluster_twonodes=${SALIDA_start_was_server}

if [ "${SALIDA_start_was_server}" == "0" ] ; then
#--------========--------========--------========--------========---
#----------- [4] Inicio Servidor del SWAS
#--------========--------========--------========--------========---


let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_02_wrun_su_local_cluster_twonodes=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Preparar la salida de la funcion

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
stamp2date ${TIMESTAMP_01_wrun_su_local_cluster_twonodes}
HORA_INICIAL_wrun_su_local_cluster_twonodes=${RETORNO_stamp2date}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
diffstamps ${TIMESTAMP_02_wrun_su_local_cluster_twonodes} ${TIMESTAMP_01_wrun_su_local_cluster_twonodes}
TIEMPO_TARDADO_01_wrun_su_local_cluster_twonodes=${RETORNO_diffstamps}
TIEMPO_TARDADO_02_wrun_su_local_cluster_twonodes=$(echo ${RETORNO_difffechas} | cut -d " " -f2 )
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

MOTIVO_FUNCION="Inicio Cluster. Ejecuccion correcta."
PARAMETROS_MOTIVO_01="Hora Comienzo : ${HORA_INICIAL_wrun_su_local_cluster_twonodes}"
PARAMETROS_MOTIVO_02="Tiempo tardado: ${TIEMPO_TARDADO_02_wrun_su_local_cluster_twonodes} - ${TIEMPO_TARDADO_01_wrun_su_local_cluster_twonodes} segundos"

else
MOTIVO_FUNCION="Error al ejecutar el comando"
PARAMETROS_MOTIVO_01="Conexion: ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Comando : ${LINEA_COMANDO_SERVIDOR_01}"

#--------========--------========--------========--------========---
#----------- [4] Fin Servidor del WAS
#--------========--------========--------========--------========---
fi
else
MOTIVO_FUNCION="Error al ejecutar el comando"
PARAMETROS_MOTIVO_01="Conexion: ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Comando : ${LINEA_COMANDO_NODO_01}"

#--------========--------========--------========--------========---
#--------- [3] Fin Nodo del WAS
#--------========--------========--------========--------========---
fi
else
MOTIVO_FUNCION="Error al ejecutar el comando.Puede que el manager este arrancado"
PARAMETROS_MOTIVO_01="Conexion: ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Comando : ${LINEA_COMANDO_MANAGER}"

#--------========--------========--------========--------========---
#------- [2] Fin Manager del WAS
#--------========--------========--------========--------========---
fi
else
MOTIVO_FUNCION="Error al acceder a los datos"
PARAMETROS_MOTIVO_01="Identificador: ${ID_WAS}"

#--------========--------========--------========--------========---
#----- [1] Fin Carga de datos contra el WAS indicado
#--------========--------========--------========--------========---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_wrun_su_local_cluster_twonodes}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_wrun_su_local_cluster_twonodes}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_wrun_su_local_cluster_twonodes}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_wrun_su_local_cluster_twonodes}
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi
}


#-------------------------------------------------------------------
#+ Sistema de trazado N5 - parametrizado
#-------------------------------------------------------------------
if [ "${N5}" != "" ] ; then
echo "${LEVEL_NIVEL_05}/${LEVEL_NIVEL}--${CONCEPT_LEVEL_05}"
fi
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================

