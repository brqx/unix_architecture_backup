#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Noviembre 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="fichero"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- rep
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- rep
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I repombra ficheros en base a parametros
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T rep repame files
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P FICHERO [CAMPO] [SEPARADOR]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E rep fichero_aa aa bb	-- repombra fichero_aa por fichero_bb
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Alias sf
rep()
{
IS_rep="Reemplaza ficheros en la ruta actual"
INFO_SCRIPT=${IS_rep}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_rep=${INFO_SCRIPT}

CADENA=$1
CAMBIO=$2
FILTRO=$3

SALIDA_rep=0

NOMBRE_SCRIPT_rep=rep
PARAMETROS_SCRIPT_rep="FICHERO [CADENA] [CAMBIO]"
NOMBRE_PANTALLA_rep=PANTALLA_rep.dat

if [ "${CADENA}" == "" ]; then
CADENA="aa"
fi

if [ "${CAMBIO}" == "" ]; then
CAMBIO="bb"
fi


if [ "${CADENA}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_rep} ${PARAMETROS_SCRIPT_rep}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar parametros
#-- [2] Ordenar fichero
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

if [ "${FILTRO}" == "" ] ; then
FILES_STRING=$( llf | tr "\n" " " )
else
FILES_STRING=$(find . -maxdepth 1 -mindepth 1  -type f -name "*${FILTRO}*" | cut -d "/" -f2 )
fi

for fichero in ${FILES_STRING} ; do 
##echo "Fichero : $fichero"
#echo "repf ${CADENA} ${CAMBIO} ${fichero}"
repf ${CADENA} ${CAMBIO} ${fichero}

done

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SW_SHOW}" == "1" -a  "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_rep}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_rep}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_rep}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_rep}
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

