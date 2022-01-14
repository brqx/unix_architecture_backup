#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Junio 2016"
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
#-- repr
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I reemplaza ficheros en base a parametros de forma recursiva
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T repr replace files recursive folder
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P FICHERO [CAMPO] [SEPARADOR]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E repr aa bb	-- repombra fichero_aa por fichero_bb
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

repr()
{
IS_repr="Reemplaza ficheros en la ruta actual y en las hijas"
INFO_SCRIPT=${IS_repr}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_rep=${INFO_SCRIPT}

CADENA=$1
CAMBIO=$2
FILTRO=$3

SALIDA_rep=0

NOMBRE_SCRIPT_repr=repr
PARAMETROS_SCRIPT_repr="FICHERO [CADENA] [CAMBIO]"
NOMBRE_PANTALLA_repr=PANTALLA_repr.dat

if [ "${CADENA}" == "" ]; then
CADENA="aa"
fi

if [ "${CAMBIO}" == "" ]; then
CAMBIO="bb"
fi


if [ "${CADENA}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_repr} ${PARAMETROS_SCRIPT_repr}

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

FILES_STRING=$(find .  -type f -name "*${FILTRO}*" )

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

