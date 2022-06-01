#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Octubre 2012"
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
#L-- spaw
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- gena
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Accede a la carpeta padre de una ruta indicada
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T acceso cd listado filtro
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P ruta_exacta
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E spaw syst_nn   -- Entrara en la carpeta syst_nn
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Este nombre no me gusta pero de momento se queda
spaw()
{
IS_spaw="Accede a la carpeta indicada"
INFO_SCRIPT=${IS_spaw}

EXPR_PASADA="$1"

if [ "${EXPR_PASADA}" == "" ] ;  then
EXPR_PASADA="-?"
fi


if [ "${EXPR_PASADA}" == "-?" ] ;  then

e_pmi spaw "carpeta"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------
#-Lo primero codificamos el parametro

RUTA_ACTUAL_spaw=${PWD}

#- Accedemos al Archivo
gena "$@"

if [ "${SALIDA_genc}" -eq "0" ] ;then
echo "$(hostname)$PWD>"
#-checkspace
codir; for i in ${SALIDA_codir}; do dcode "$i" ;  du -h "${SALIDA_DCODE}" | tail -1; done
fi

OLDPWD=${RUTA_ACTUAL_spaw}
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
