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
#-- start_service_arq
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- codcat
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Inicia un servicio
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T start inicio servicio
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P SERVICIO
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E start_service_arq s1 	-- Inicia el servicio indicado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

start_service_arq()
{
IS_start_service_arq="Inicia un servicio "
INFO_SCRIPT=${IS_start_service_arq}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_start_service_arq=${INFO_SCRIPT}

#-Comando es un espacio por defecto
SERVICIO_START=${1}
PROCESO_START=${2}
COMANDO_START="${3} ${4}"

SALIDA_start_service_arq=0

#-Se trata de un texto de informacion a devolver al llamante
INFOSALIDA_start_service_arq=""

NOMBRE_SCRIPT_start_service_arq=start_service_arq
PARAMETROS_SCRIPT_start_service_arq="[-?]"

if [ "${SERVICIO_START}" == "" ] ;  then
SERVICIO_START="-?"
fi

if [ "${PROCESO_START}" == "" ] ;  then
SERVICIO_START="-?"
fi

if [ "${COMANDO_START}" == "" ] ;  then
SERVICIO_START="-?"
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${SERVICIO_START}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_start_service_arq} ${PARAMETROS_SCRIPT_start_service_arq}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Lanzar comando de arranque
#-- [2] Comprobar que se ha iniciado e informar
#--------========--------========--------========--------========---


##echo "iniciando ${COMANDO} "
${COMANDO_START}
NUM_LINEAS=$(ps -eaf | grep "${PROCESO_START}" | grep -v "grep" |  wc -l )

cont_parada=0
while [ "${NUM_LINEAS}" == "0" ] ; do
sleep 30
let cont_parada++
##echo "start:Arrancando servicio ${SERVICIO} : $cont_parada $NUM_LINEAS "
NUM_LINEAS=$(ps -eaf | grep "${PROCESO_START}" | grep -v "grep" | wc -l )
done


PARAMETROS_MOTIVO_01="Servicio    : ${SERVICIO_START}"
PARAMETROS_MOTIVO_02="Proceso     : ${PROCESO_START}"
PARAMETROS_MOTIVO_03="Comando     : ${COMANDO_START}"


if [ "${NUM_LINEAS}" != "0" ] ; then
#------======------======------======------======------======------=
#----- [1] Inicio chequeo servicio
#------======------======------======------======------======------=

MOTIVO_FUNCION="Servicio arrancado correctamente"
SALIDA_start_service_arq=1

else

MOTIVO_FUNCION="Error al iniciar el servicio"
SALIDA_start_service_arq=0


#------======------======------======------======------======------=
#----- [2] Fin chequeo servicio
#------======------======------======------======------======------=
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_start_service_arq}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_start_service_arq}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_start_service_arq}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
INFOSALIDA_start_service_arq=${MOTIVO_FUNCION}
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_start_service_arq}
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

