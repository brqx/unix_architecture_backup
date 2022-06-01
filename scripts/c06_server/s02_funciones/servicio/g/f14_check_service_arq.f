#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.5" #  Version del Script actual
FECHA_SCRIPT="Noviembre 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="cpanel"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="servicios"
CONCEPT_VARIANTE_04=""
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- check_service_arq
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- codcat
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Comprueba que el servicio exista y que este instalado en el sistema
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T check service installed instalado listado
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P SERVICIO
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E check_service_arq s1 	-- Indica que el servicio s1 se ha iniciado bien
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

check_service_arq()
{
IS_check_service_arq="Comprueba que el servicio exista y este instalado en el sistema"
INFO_SCRIPT=${IS_check_service_arq}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_check_service_arq=${INFO_SCRIPT}

#-Comando es un espacio por defecto
PROCESO_PASADO=${1}

SALIDA_check_service_arq=0

#-Se trata de un texto de informacion a devolver al llamante
INFOSALIDA_check_service_arq=""

NOMBRE_SCRIPT_check_service_arq=check_service_arq
PARAMETROS_SCRIPT_check_service_arq="PROCESO"


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${PROCESO_PASADO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_check_service_arq} ${PARAMETROS_SCRIPT_check_service_arq}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar el estado del servicio e informar
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

#-Lineas que definen los servicios ejecutandose
NUM_LINEAS_EN_EJECUCCION=$(ps -eaf | grep "${PROCESO}" | grep -v "grep" |  wc -l )

#-Aqui hay que considerar los procesos por defecto MIN_PROCESS

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
codprocess ${PROCESO_PASADO}
codigo_proceso=${RETORNO_codprocess}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

min_PROCESS=${MIN_PROCESS[${codigo_proceso}]}

PARAMETROS_MOTIVO_01="Proceso           : ${PROCESO_PASADO}"
PARAMETROS_MOTIVO_01="Codigo Proceso    : ${codigo_proceso}"
PARAMETROS_MOTIVO_02="min_Process       : ${min_PROCESS}"
PARAMETROS_MOTIVO_03="Lineas Ejecuccion : ${NUM_LINEAS_EN_EJECUCCION}"


if [ "${NUM_LINEAS_EN_EJECUCCION}" == "${min_PROCESS}" ] ; then
#------======------======------======------======------======------=
#----- [1] Inicio Chequeo Servicios arrancados
#------======------======------======------======------======------=

MOTIVO_FUNCION="Servicio operativo en servidor no arrancado"
SALIDA_check_service_arq=1

else

MOTIVO_FUNCION="Servicio se encuentra arrancado"
SALIDA_check_service_arq=0

#------======------======------======------======------======------=
#----- [1] Fin Chequeo Servicios arrancados
#------======------======------======------======------======------=
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_check_service_arq}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_check_service_arq}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_check_service_arq}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual

INFOSALIDA_check_service_arq=${MOTIVO_FUNCION}
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_check_service_arq}
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

