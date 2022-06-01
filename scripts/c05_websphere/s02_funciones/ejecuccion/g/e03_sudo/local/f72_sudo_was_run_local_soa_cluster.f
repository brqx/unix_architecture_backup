#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Enero 2013"
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
#-- wrunsudo_local_soa_cluster
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- ssh_sudorun
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
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wrunsudo_local_cluster soa7a 	-- Lanza el script indicado para el servidor soa7a
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

wrunsudo_local_soa_cluster()
{
IS_wrunsudo_local_soa_cluster="Inicia un cluster SOA remoto con un solo nodo"
INFO_SCRIPT=${IS_wrunsudo_local_soa_cluster}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_wrunsudo_local_soa_cluster=${INFO_SCRIPT}

ID_WAS=${1}
shift

SALIDA_wrunsudo_local_soa_cluster=0

NOMBRE_SCRIPT_wrunsudo_local_soa_cluster=wrunsudo_local_soa_cluster
PARAMETROS_SCRIPT_wrunsudo_local_soa_cluster="ID_WAS"


if [ "${ID_WAS}" == "" ]; then
	ID_WAS="-?"
fi  


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${ID_WAS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_wrunsudo_local_soa_cluster} ${PARAMETROS_SCRIPT_wrunsudo_local_soa_cluster}

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
#-- [4] Arrancar Servidores
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
was_load_parameters_soa_cluster ${ID_WAS}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

posiciona "00_Start:Carga de parametros-${ID_WAS}"

SALIDA_wrunsudo_local_soa_cluster=${SALIDA_was_load_parameters_soa_cluster}


if [ "${SALIDA_was_load_parameters_soa_cluster}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Carga de datos contra el WAS indicado
#--------========--------========--------========--------========---

posiciona "01_Start:Manager-Iniciandose-${ID_WAS}"

sudo ${LINEA_COMANDO_MANAGER}				&> /dev/null
SALIDA_start_was_manager=$?

posiciona "02_Start:Manager-Arrancado-${ID_WAS}"

SALIDA_wrunsudo_local_soa_cluster=${SALIDA_start_was_manager}

if [ "${SALIDA_start_was_manager}" == "0" ] ; then
#--------========--------========--------========--------========---
#------- [2] Inicio Manager del WAS
#--------========--------========--------========--------========---

posiciona "03_Start:Nodo-Iniciandose-${ID_WAS}"

sudo ${LINEA_COMANDO_NODO_01}				&> /dev/null
SALIDA_start_was_nodo=$?

posiciona "04_Start:Nodo-Arrancado-${ID_WAS}"

SALIDA_wrunsudo_local_soa_cluster=${SALIDA_start_was_nodo}

if [ "${SALIDA_start_was_nodo}" == "0" ] ; then
#--------========--------========--------========--------========---
#--------- [3] Inicio Nodo del WAS
#--------========--------========--------========--------========---

posiciona "05_Start:Servidores-Iniciandose-${ID_WAS}"

sudo ${LINEA_COMANDO_SERVIDOR_01}			&> /dev/null
SALIDA_start_was_server=$?

posiciona "06_Start:Servidor1-Arrancado-${ID_WAS}"

sudo ${LINEA_COMANDO_SERVIDOR_02}			&> /dev/null
SALIDA_start_was_server=$?

posiciona "07_Start:Servidor2-Arrancado-${ID_WAS}"

sudo ${LINEA_COMANDO_SERVIDOR_03}			&> /dev/null
SALIDA_start_was_server=$?

posiciona "08_Start:Servidor3-Arrancado-${ID_WAS}"

SALIDA_wrunsudo_local_soa_cluster=${SALIDA_start_was_server}

if [ "${SALIDA_start_was_server}" == "0" ] ; then
#--------========--------========--------========--------========---
#----------- [4] Inicio Servidor del SWAS
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_02_wrun_su_local_soa_cluster=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Preparar la salida de la funcion

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
stamp2date ${TIMESTAMP_01_wrun_su_local_soa_cluster}
HORA_INICIAL_wrun_su_local_soa_cluster=${RETORNO_stamp2date}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
diffstamps ${TIMESTAMP_02_wrun_su_local_soa_cluster} ${TIMESTAMP_01_wrun_su_local_soa_cluster}
TIEMPO_TARDADO_01_wrun_su_local_soa_cluster=${RETORNO_diffstamps}
TIEMPO_TARDADO_02_wrun_su_local_soa_cluster=$(echo ${RETORNO_difffechas} | cut -d " " -f2 )
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

MOTIVO_FUNCION="Inicio Cluster. Ejecuccion correcta."
PARAMETROS_MOTIVO_01="Hora Comienzo : ${HORA_INICIAL_wrun_su_local_soa_cluster}"
PARAMETROS_MOTIVO_02="Tiempo tardado: ${TIEMPO_TARDADO_02_wrun_su_local_soa_cluster} - ${TIEMPO_TARDADO_01_wrun_su_local_soa_cluster} segundos"

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

INFO_SCRIPT=${INFO_SCRIPT_wrunsudo_local_soa_cluster}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_wrunsudo_local_soa_cluster}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_wrunsudo_local_soa_cluster}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_wrunsudo_local_soa_cluster}
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

