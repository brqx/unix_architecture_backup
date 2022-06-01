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
#L-- spar
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- genr
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
#E spar syst nn   -- Entrara en la carpeta Tsystgg/Hnnuuu
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Este nombre no me gusta pero de momento se queda
spar()
{
IS_spar="Accede a la composicion de ruta indicada"
INFO_SCRIPT=${IS_spar}

EXPR_PASADA="$1"

if [ "${EXPR_PASADA}" == "" ] ;  then
EXPR_PASADA="-?"
fi


if [ "${EXPR_PASADA}" == "-?" ] ;  then

e_pmi spar "ruta compuesta"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------
#-Lo primero codificamos el parametro

RUTA_ACTUAL_spar=${PWD}

#- Accedemos al Archivo
genr "$@"

echo "Salida genr : ${SALIDA_genr} "
if [ "${SALIDA_genr}" -eq "0" ] ;then
echo "$(hostname)$PWD>"
#-checkspace
codir; for i in ${SALIDA_codir}; do dcode "$i" ;  du -h "${SALIDA_DCODE}" | tail -1; done
fi

OLDPWD=${RUTA_ACTUAL_spar}
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
