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
#-- stop_service_arq
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
#E stop_service_arq s1 	-- Inicia el servicio indicado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

stop_service_arq()
{
IS_stop_service_arq="Para un servicio de la arquitectura instalado en el servidor"
INFO_SCRIPT=${IS_stop_service_arq}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_stop_service_arq=${INFO_SCRIPT}

#-Comando es un espacio por defecto
SERVICIO_STOP=${1}
PROCESO_STOP=${2}
COMANDO_STOP="${3} ${4}"

SALIDA_stop_service_arq=0

#-Se trata de un texto de informacion a devolver al llamante
INFOSALIDA_stop_service_arq=""

NOMBRE_SCRIPT_stop_service_arq=stop_service_arq
PARAMETROS_SCRIPT_stop_service_arq="[-?]"

if [ "${SERVICIO_STOP}" == "" ] ;  then
SERVICIO_STOP="-?"
fi

if [ "${PROCESO_STOP}" == "" ] ;  then
SERVICIO_STOP="-?"
fi

if [ "${COMANDO_STOP}" == "" ] ;  then
SERVICIO_STOP="-?"
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${SERVICIO_STOP}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_stop_service_arq} ${PARAMETROS_SCRIPT_stop_service_arq}

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

##echo "stop_service ${COMANDO_STOP} "

${COMANDO_STOP}
NUM_LINEAS=$(ps -eaf | grep "${PROCESO_STOP}" | grep -v "grep" |  wc -l )

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
codprocess ${PROCESO_STOP}
codigo_proceso=${RETORNO_codprocess}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

min_PROCESS=${MIN_PROCESS[${codigo_proceso}]}


if [ "${SALIDA_codprocess}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio chequeo codigo proceso
#----====----====----====----====----====----====----====----====---

##echo "Numero de procesos : ${PROCESO_STOP} ${MIN_PROCESS} "
cont_parada=0
while [ "${NUM_LINEAS}" != "${min_PROCESS}" ] ; do
sleep 10
posiciona "{SERVICIO_STOP}:${PROCESO_STOP}-Parando servicio: ${NUM_LINEAS} - ${MIN_PROCESS}"
let cont_parada++
##echo "Interno:Parando servicio ${SERVICIO} : $cont_parada $NUM_LINEAS "
NUM_LINEAS=$(ps -eaf | grep "${PROCESO_STOP}" | grep -v "grep" | wc -l )
done


PARAMETROS_MOTIVO_01="Servicio    : ${SERVICIO_STOP}"
PARAMETROS_MOTIVO_02="Proceso     : ${PROCESO_STOP}"
PARAMETROS_MOTIVO_03="Comando     : ${COMANDO_STOP}"

if [ "${NUM_LINEAS}" == "${min_PROCESS}" ] ; then
#------======------======------======------======------======------=
#----- [2] Inicio chequeo servicio
#------======------======------======------======------======------=

MOTIVO_FUNCION="Servicio parado correctamente"
SALIDA_stop_service_arq=0

else

MOTIVO_FUNCION="Error al parar el servicio"
SALIDA_stop_service_arq=1

#------======------======------======------======------======------=
#----- [2] Fin chequeo servicio
#------======------======------======------======------======------=
fi
else

MOTIVO_FUNCION="Codigo de proceso incorrecto. No soportado por la arquitectura"
SALIDA_stop_service_arq=2

#----====----====----====----====----====----====----====----====---
#----- [1] Fin chequeo codigo proceso
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_stop_service_arq}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_stop_service_arq}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_stop_service_arq}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
INFOSALIDA_stop_service_arq=${MOTIVO_FUNCION}
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_stop_service_arq}
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

