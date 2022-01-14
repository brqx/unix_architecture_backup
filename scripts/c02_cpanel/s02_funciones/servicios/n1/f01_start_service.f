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
#-- start_service
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
#E start_service s1 	-- Inicia el servicio indicado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

start_service()
{
IS_start_service="Inicia un servicio "
INFO_SCRIPT=${IS_start_service}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_start_service=${INFO_SCRIPT}

#-Comando es un espacio por defecto
SERVICIO=${1}
COMANDO="${2} ${3}"

SALIDA_start_service=0

#-Se trata de un texto de informacion a devolver al llamante
INFOSALIDA_start_service=""

NOMBRE_SCRIPT_start_service=start_service
PARAMETROS_SCRIPT_start_service="[-?]"

if [ "${FICHERO_SERVICIOS}" == "" ]; then
FICHERO_SERVICIOS=${RS_SERV}zservicios_servidor_cpanel.dat
fi


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${SERVICIO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_start_service} ${PARAMETROS_SCRIPT_start_service}

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

#-Ahora hay que ver si existe dicho servicio
#-- Vamos a crear una funcion para ello

##echo "Antes de comprobar - ${SERVICIO} - SW_LLAMADA_DESDE_NIVEL_SUPERIOR"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
check_service ${SERVICIO}
SALIDA_start_service=${SALIDA_check_service}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

##echo "Tras comprobar - ${SERVICIO} - SW_LLAMADA_DESDE_NIVEL_SUPERIOR - ${SALIDA_check_service}"

if [ "${SALIDA_check_service}" != "0" -a "${SALIDA_check_service}" != "1" -a "${SALIDA_check_service}" != "3"  ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio preparacion arranque servicio
#----====----====----====----====----====----====----====----====---

if [ "${COMANDO}" == " " ]; then
LINEA_FICHERO=$(codcat ${FICHERO_SERVICIOS} | grep -v "^#" | grep ${SERVICIO} | cut -d ":" -f4 )
dcode "${LINEA_FICHERO}"
COMANDO="${SALIDA_DCODE}"
fi

${COMANDO}
NUM_LINEAS=$(ps -eaf | grep "${SERVICIO}" | grep -v "grep" |  wc -l )

cont_parada=0
while [ $NUM_LINEAS -eq 0 ] ; do
sleep 5
let cont_parada++
echo "Interno:Arrancando servicio ${SERVICIO} : $cont_parada $NUM_LINEAS "
NUM_LINEAS=$(ps -eaf | grep "${SERVICIO}" | grep -v "grep" | wc -l )
done

SALIDA_start_service=${NUM_LINEAS}

PARAMETROS_MOTIVO_01="Servicio    : ${SERVICIO}"
PARAMETROS_MOTIVO_02="Comando     : ${COMANDO}"

if [ "${SALIDA_start_service}" != "0" ] ; then
#------======------======------======------======------======------=
#----- [2] Inicio chequeo logs BBDD
#------======------======------======------======------======------=

MOTIVO_FUNCION="Servicio arrancado correctamente"

else

MOTIVO_FUNCION="Error al iniciar el servicio"

#------======------======------======------======------======------=
#----- [2] Fin chequeo logs BBDD
#------======------======------======------======------======------=
fi
else

MOTIVO_FUNCION=${INFOSALIDA_check_service}

#MOTIVO_FUNCION="El servicio ya esta arrancado o no exite"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin preparacion arranque servicio
#----====----====----====----====----====----====----====----====---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_start_service}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_start_service}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_start_service}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
INFOSALIDA_start_service=${MOTIVO_FUNCION}
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_start_service}
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

