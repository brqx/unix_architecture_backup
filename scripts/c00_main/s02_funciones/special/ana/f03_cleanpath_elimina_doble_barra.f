#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Abril 2012"
STATUS_SCRIPT="checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="special"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#L-- cleanpath
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Elimina la doble barra de un path pasado
#-------------------------------------------------------------------
#+ Sistema de meta tags: 
#-------------------------------------------------------------------
#T limpieza eliminacion doble barra ruta
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [palabra_de_la_ruta]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E cleanpath /a//b/c   -- Elimina la doble barra /a/b/c
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## - Elimina la doble barra de un path pasado

cleanpath()
{
IS_cleanpath="Elimina la doble barra de un path pasado"
INFO_SCRIPT=${IS_cleanpath}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_cleanpath=${INFO_SCRIPT}

PATH_PASADO=$1

SALIDA_cleanpath=0

NOMBRE_SCRIPT_cleanpath=cleanpath
PARAMETROS_SCRIPT_cleanpath="PATH_PASADO"


if [ "${PATH_PASADO}" == "" ]; then
PATH_PASADO="-?"
fi


if [ "${PATH_PASADO}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_cleanpath} ${PARAMETROS_SCRIPT_cleanpath} 

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

# Permitimos 

LISTAPAR=(${@})

SALIDA_cleanpath=$( echo ${LISTAPAR}  | sed "s/\/\//\//g" )

MOTIVO_FUNCION="Ruta limpiada :"
PARAMETROS_MOTIVO_01="Ruta : ${SALIDA_cleanpath}"


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_cleanpath}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_cleanpath}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_cleanpath}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

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
