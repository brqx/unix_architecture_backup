#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Octubre 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="acceso"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#L-- cdd_
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- gendfolder
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Accede a una ruta filtrando el inicio o conteniendo el parametro
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T acceso cd listado filtro
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [palabra_de_la_ruta]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E cdd syst   -- Entrara en la carpeta system
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## - Filtra por el comienzo del parametro
#-- Falla con carpetas con parametros - vamos a cambiarlo

cdd_ ()
{
IS_cdd_="Accede a una ruta filtrada con el comienzo del parametro"
INFO_SCRIPT=${IS_cdd_}

EXPR_PASADA="$1"

if [ "${EXPR_PASADA}" == "" ] ;  then
EXPR_PASADA="-?"
fi


if [ "${EXPR_PASADA}" == "-?" ] ;  then

e_pmi cdd_ "parametro"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------
#-Lo primero codificamos el parametro

RUTA_ACTUAL_GEND=${PWD}

gendfolder "$@"

if [ "${SALIDA_gend}" -eq "0" ] ;then
ll 
fi

OLDPWD=${RUTA_ACTUAL_GEND}

# Ajuste de formato del prompt
# brqz

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
