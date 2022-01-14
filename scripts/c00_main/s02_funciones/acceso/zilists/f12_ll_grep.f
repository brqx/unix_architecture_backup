#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Diciembre 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="acceso"
CONCEPT_VARIANTE_04="zilists"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- ll
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Nueva funcion de listado con filtro incorporado
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T list grep filter ll
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [FILTRO]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E lg  a3  -- Lista y filtra la salida por a3
#-------------------------------------------------------------------
#E ll  a3  -- Lista y filtra la salida por a3
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- No puedo crear la funcion pues ya existe
lg()
{
IS_lg="Hace un listado filtrando"
INFO_SCRIPT=${IS_lg}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_lg=${INFO_SCRIPT}

FILTRO_PASADO=$1

SALIDA_lg=0

NOMBRE_SCRIPT_lg=lg
PARAMETROS_SCRIPT_lg="[FILTRO]"


if [ "${FILTRO_PASADO}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_lg} ${PARAMETROS_SCRIPT_lg}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--Desactivamos la informacion para esta funcion
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

if [ "${FILTRO_PASADO}" == ""  ]  ; then
#--------========--------========--------========--------========---
#----- [1] Inicio check filtro
#--------========--------========--------========--------========---
ls -la 
SALIDA_lg=$?

else

ls -la | grep ${FILTRO_PASADO}
SALIDA_lg=$?

#--------========--------========--------========--------========---
#----- [1] Fin check filtro
#--------========--------========--------========--------========---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_lg}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_lg}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_lg}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

#--Desactivamos la informacion para esta funcion
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

return ${SALIDA_lg}
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------

fi

}

#-------------------------------------------------------------------
#+ Sistema de trazado N4 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL	-	Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================
