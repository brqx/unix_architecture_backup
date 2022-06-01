#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Febrero 2013"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="oracle"
CONCEPT_MOLDE_05="alias"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Script ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- oracle_parser
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - oracle_parser
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Parsea una cadena para que pueda ser tratada por oracle
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T run sql commands
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [usuario] [servidor] 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E oracle_parser CADENA  -- Prepara las ordenes de una cadena para lanzarse
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
##echo "conn_aa;:select_amigos_from_pompa;:pepones" | sed "s/;/;:/g" | tr ":" "\n"


oracle_parser()
{
IS_oracle_parser="Ejecuta comando sql pasado como cadena"
INFO_SCRIPT=${IS_oracle_parser}

INFO_SCRIPT_oracle_parser=${INFO_SCRIPT}

CADENA_BD="${@}"

SALIDA_oracle_parser=0

NOMBRE_SCRIPT_oracle_parser=oracle_parser
PARAMETROS_SCRIPT_oracle_parser="PARAMETROS_SQL [CONEXION]"

if [ "${CADENA_BD}" == "" ]; then
CADENA_BD="-?"
fi  


if [ "${CADENA_BD}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_oracle_parser} ${PARAMETROS_SCRIPT_oracle_parser}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar cadena
#-- [2] Procesar la cadena
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

echo "${CADENA_BD}" | sed "s/;/;:/g" | tr ":" "\n"  | grep "^[a-z]" | tr "_" " "

SALIDA_oracle_parser=0

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_oracle_parser}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_oracle_parser}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_oracle_parser}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

return ${SALIDA_oracle_parser}
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
