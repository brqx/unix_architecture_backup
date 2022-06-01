#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Mayo 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="filtro"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- limpia_parametros
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Limpiar variables temporales para evitar efectos laterales
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T limpieza eliminacion valores parametros
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E limpia_parametros  -- Vacia las variables temporales usadas
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

limpia_parametros()
{
IS_limpia_parametros="Limpia las variables comunes usadas en los scripts"

INFO_SCRIPT=${IS_limpia_parametros}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_limpia_parametros=${INFO_SCRIPT}

INFO=$1

NOMBRE_SCRIPT_limpia_parametros=limpia_parametros

if [ "${INFO}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_limpia_parametros} 

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

INFO_SCRIPT=
NOMBRE_SCRIPT=
PARAMETROS_SCRIPT=
##PANTALLA_SCRIPT=

MOTIVO_FUNCION=
PARAMETROS_MOTIVO_01=
PARAMETROS_MOTIVO_02=
PARAMETROS_MOTIVO_03=
PARAMETROS_MOTIVO_04=
PARAMETROS_MOTIVO_05=
PARAMETROS_MOTIVO_06=
PARAMETROS_MOTIVO_07=
PARAMETROS_MOTIVO_08=
PARAMETROS_MOTIVO_09=
PARAMETROS_MOTIVO_10=
PARAMETROS_MOTIVO_11=
PARAMETROS_MOTIVO_12=
PARAMETROS_MOTIVO_13=
PARAMETROS_MOTIVO_14=
PARAMETROS_MOTIVO_15=
PARAMETROS_MOTIVO_16=
PARAMETROS_MOTIVO_17=
PARAMETROS_MOTIVO_18=
PARAMETROS_MOTIVO_19=
PARAMETROS_MOTIVO_20=
PARAMETROS_MOTIVO_21=
PARAMETROS_MOTIVO_22=
PARAMETROS_MOTIVO_23=
PARAMETROS_MOTIVO_24=
PARAMETROS_MOTIVO_25=
PARAMETROS_MOTIVO_26=


#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi
}


