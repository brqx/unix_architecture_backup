#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.4"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05}"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- get_nombre_servidor
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera un path para un site
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generacion ruta path cuenta site
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P cuenta [proyecto] [entorno]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E get_nombre_servidor abrqx.com -- Devuelve abrqx
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

get_nombre_servidor()
{
IS_get_nombre_servidor="Genera un path valido para los datos pasados"
INFO_SCRIPT=${IS_get_nombre_servidor}

#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2012
#-------------------------------------------------------------------

#-Los sites son el despliegue de un proyecto en una cuenta de un servidor

NOMBRE_SERVIDOR=${1}

if [ "${NOMBRE_SERVIDOR}" == "" ]; then
NOMBRE_SERVIDOR="-?"
fi  


if [ "${NOMBRE_SERVIDOR}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt get_nombre_servidor "nombre_servidor"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- La idea es que devuelva el nombre del servidor quitandole el punto si se requiere
#- Ejemplos : 

#  abrqx.com        - abrqx
#  server.cbrqx.com - cbrqx
#  urbuns           - urbuns

#- Entonces tenemos tres opciones

#-Preparamos el servidor

echo ${NOMBRE_SERVIDOR} | grep  "\." &> /dev/null
SALIDA_GREP=$?

PARTE_PRIMERA=$(echo ${NOMBRE_SERVIDOR} | cut -d "." -f1)
PARTE_SEGUNDA=$(echo ${NOMBRE_SERVIDOR} | cut -d "." -f2)
PARTE_TERCERA=$(echo ${NOMBRE_SERVIDOR} | cut -d "." -f3)

# echo "Parte Primera : ${PARTE_PRIMERA} "
# echo "Parte Segunda : ${PARTE_SEGUNDA} "
# echo "Parte Tercera : ${PARTE_TERCERA} "

if [ "${SALIDA_GREP}" == "0" ] ; then
#- Hay puntos en el site
# echo "caso con puntos"

if [ "${PARTE_TERCERA}" != "" ] ; then
#-se trata de este caso server.ab.com
NOMBRE_SERVIDOR=${PARTE_SEGUNDA}
else 
NOMBRE_SERVIDOR=${PARTE_PRIMERA}
fi
#-- Fin del caso con puntos

fi

SALIDA_get_nombre_servidor=${NOMBRE_SERVIDOR}

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
