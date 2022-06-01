#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2015
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Noviembre 2015"
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
#-- cv
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I convierte ficheros ISO-9015 a UTF-8
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T cv cvame files
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P FICHERO [CAMPO] [SEPARADOR]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E cv fichero	-- convierte fichero a UTF-8
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


cv()
{
IS_cv="Convierte a UTF8 desde ISO-8859"
INFO_SCRIPT=${IS_cv}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_cv=${INFO_SCRIPT}

FICHERO=$1


SALIDA_cv=0

NOMBRE_SCRIPT_cv=cv
PARAMETROS_SCRIPT_cv="FICHERO [CADENA] [CAMBIO]"
NOMBRE_PANTALLA_cv=PANTALLA_cv.dat



if [ "${FICHERO}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_cv} ${PARAMETROS_SCRIPT_cv}

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

#-Separador - campo

iconv -f ISO-8859-14 ${FICHERO} -t UTF-8 -o ${FICHERO}

SALIDA_stat=$?
SALIDA_cv=${SALIDA_stat}


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_cv}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_cv}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_cv}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_cv}
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

