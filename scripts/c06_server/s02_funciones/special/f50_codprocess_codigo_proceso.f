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
#-- codprocess
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
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
#E codprocess s1 	-- Inicia el servicio indicado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

codprocess()
{
IS_codprocess="Devuelve un codigo para cada proceso"
INFO_SCRIPT=${IS_codprocess}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_codprocess=${INFO_SCRIPT}

#-Comando es un espacio por defecto
NOMBRE_PROCESO=${1}

SALIDA_codprocess=0
RETORNO_codprocess=""

#-Se trata de un texto de informacion a devolver al llamante
INFOSALIDA_codprocess=""

NOMBRE_SCRIPT_codprocess=codprocess
PARAMETROS_SCRIPT_codprocess="[-?]"

if [ "${NOMBRE_PROCESO}" == "" ] ;  then
NOMBRE_PROCESO="-?"
fi


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${NOMBRE_PROCESO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_codprocess} ${PARAMETROS_SCRIPT_codprocess}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Interpretar proceso
#-- [2] Devolver codigo asociado
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Codigo correctamente interpretado"
PARAMETROS_MOTIVO_01="Proceso    : ${NOMBRE_PROCESO}"

case ${NOMBRE_PROCESO} in
'java' )
RETORNO_codprocess=0
;;
'oracle' )
RETORNO_codprocess=2
;;
'apache' )
RETORNO_codprocess=1
;;
*)
MOTIVO_FUNCION="proceso aun no interpretado por la arquitectura"
;;
esac

PARAMETROS_MOTIVO_02="Resultado    : ${RETORNO_codprocess}"


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_codprocess}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_codprocess}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_codprocess}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
INFOSALIDA_codprocess=${MOTIVO_FUNCION}
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${RETORNO_codprocess}
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

