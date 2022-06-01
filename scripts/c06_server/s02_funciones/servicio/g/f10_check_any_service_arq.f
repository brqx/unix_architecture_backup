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
#-- check_any_service
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
#P [TIPO_SERVICIO]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E check_any_service s1 	-- Indica que el servicio s1 se ha iniciado bien
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

check_any_service()
{
IS_check_any_service="Comprueba que el servicio exista y este instalado en el sistema"
INFO_SCRIPT=${IS_check_any_service}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_check_any_service=${INFO_SCRIPT}

#-Comando es un espacio por defecto
TIPO_SERVICIO=${1}

SALIDA_check_any_service=0

#-Se trata de un texto de informacion a devolver al llamante
INFOSALIDA_check_any_service=""

NOMBRE_SCRIPT_check_any_service=check_any_service
PARAMETROS_SCRIPT_check_any_service="SERVICIO"

if [ "${TIPO_SERVICIO}" == "" ]; then
TIPO_SERVICIO=was
fi


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${SERVICIO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_check_any_service} ${PARAMETROS_SCRIPT_check_any_service}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar que el servicio esta en el lista de servicios del servidor
#-- [2] Comprobar que el servicio esta instalado en el servidor
#-- [3] Comprobar que se ha iniciado e informar
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

case ${TIPO_SERVICIO} in
'was' )
#acciones was
;;
'apache' )
#acciones apache
;;
'oracle' )
#acciones oracle
;;
esac


#-Lineas que definen los servicios existentes
NUM_LINEAS_EN_FICHERO=$(codcat ${FICHERO_SERVICIOS} | grep -v "^#" | grep ${SERVICIO} | wc -l )
SALIDA_check_any_service=${NUM_LINEAS}


check_servicio_arq ${TIPO_SERVICIO}
#--- Hay que cambiarlo por un checkservice
service ${SERVICIO} status &> /dev/null
SERVICIO_INSTALADO=$?

#-Lineas que definen los servicios ejecutandose
NUM_LINEAS_EN_EJECUCCION=$(ps -eaf | grep "${SERVICIO}" | grep -v "grep" |  wc -l )

PARAMETROS_MOTIVO_01="Servicio    : ${SERVICIO}"

if [ "${NUM_LINEAS_EN_FICHERO}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio Chequeo Servicios existentes
#----====----====----====----====----====----====----====----====---

MOTIVO_FUNCION="Servicio no operativo en el servidor o inexistente en la lista de servicios activos"
SALIDA_check_any_service=3

else

#-Si devuelve 1 es que no esta instalado

if [ "${SERVICIO_INSTALADO}" == "1" ] ; then
#--------========--------========--------========--------========---
#----- [2] Inicio Chequeo Servicios instalados
#--------========--------========--------========--------========---
MOTIVO_FUNCION="Servicio no instalado en el sistema"
SALIDA_check_any_service=1

else


if [ "${NUM_LINEAS_EN_EJECUCCION}" == "0" ] ; then
#------======------======------======------======------======------=
#----- [3] Inicio Chequeo Servicios arrancados
#------======------======------======------======------======------=

MOTIVO_FUNCION="Servicio operativo en servidor no arrancado"
SALIDA_check_any_service=2


else

MOTIVO_FUNCION="Servicio se encuentra arrancado"
SALIDA_check_any_service=0

#------======------======------======------======------======------=
#----- [3] Fin Chequeo Servicios arrancados
#------======------======------======------======------======------=
fi

#------======------======------======------======------======------=
#----- [2] Fin Chequeo Servicios instalados
#------======------======------======------======------======------=
fi

#----====----====----====----====----====----====----====----====---
#----- [1] Fin Chequeo Servicios existentes
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_check_any_service}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_check_any_service}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_check_any_service}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual

INFOSALIDA_check_any_service=${MOTIVO_FUNCION}
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_check_any_service}
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

