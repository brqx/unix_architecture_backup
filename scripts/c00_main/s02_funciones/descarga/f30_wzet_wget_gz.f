#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.1"          #  Version del Script actual
FECHA_SCRIPT="Julio 2013"
STATUS_SCRIPT="checking"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- wzet
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Descarga y decomprime el fichero y lo borra
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T descarga descomprime elimina
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P ruta_wget
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wzet oo.com/apache.tar.gz    -- Descarga - descomprime y elimina
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

wzet()
{
IS_wzet="Descarga y descompresion de ficheros"
INFO_SCRIPT=${IS_wzet}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_wzet=${INFO_SCRIPT}

URL_PASADA=${1}

SALIDA_wzet=0

NOMBRE_SCRIPT_wzet=wzet
PARAMETROS_SCRIPT_wzet="RUTA_WGET"

if [ "${URL_PASADA}" == "" ]; then
URL_PASADA="-?"
fi

if [ "${URL_PASADA}" == "-?" ]; then
## Sistema de auto documentacion de funciones
e_pmt ${NOMBRE_SCRIPT_wzet} ${PARAMETROS_SCRIPT_wzet}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------


#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Descargar archivo
#-- [2] Descomprimir archivo
#-- [3] Eliminar archivo
#--------========--------========--------========--------========---

#-Funcion Simple - No requiere control de funcionamiento

wget "${URL_PASADA}" 
SALIDA_wget=$?
SALIDA_wzet=${SALIDA_wget}


if [ "${SALIDA_wget}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#----- [1] Inicio comprobacion descarga
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

NOMBRE_FICHERO=$(basename ${URL_PASADA})

tar zxvf ${NOMBRE_FICHERO}
SALIDA_tar=$?
SALIDA_wzet=${SALIDA_tar}


if [ "${SALIDA_tar}" == "0" ] ; then
#---===---===---===---===---===---===---===---===---===---===---===-
#----- [2] Inicio comprobacion descompresion
#---===---===---===---===---===---===---===---===---===---===---===-

rm -f ${NOMBRE_FICHERO}
SALIDA_rm=$?
SALIDA_wzet=${SALIDA_rm}

if [ "${SALIDA_rm}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [3] Inicio comprobacion borrado
#----====----====----====----====----====----====----====----====---

MOTIVO_FUNCION="Descarga y descompresion correcta"
PARAMETROS_MOTIVO_01="Url Pasada     : ${URL_PASADA}"
PARAMETROS_MOTIVO_02="Fichero        : ${NOMBRE_FICHERO}"

else

MOTIVO_FUNCION="Error al borrar archivo"
PARAMETROS_MOTIVO_01="Url Pasada     : ${URL_PASADA}"
PARAMETROS_MOTIVO_02="Fichero        : ${NOMBRE_FICHERO}"


#----====----====----====----====----====----====----====----====---
#----- [3] Fin comprobacion borrado
#----====----====----====----====----====----====----====----====---
fi
else
MOTIVO_FUNCION="Error al descomprimir archivo"
PARAMETROS_MOTIVO_01="Url Pasada     : ${URL_PASADA}"
PARAMETROS_MOTIVO_02="Fichero        : ${NOMBRE_FICHERO}"


#---===---===---===---===---===---===---===---===---===---===---===-
#----- [2] Inicio comprobacion descompresion
#---===---===---===---===---===---===---===---===---===---===---===-
fi
else

MOTIVO_FUNCION="Error al descargar archivo"
PARAMETROS_MOTIVO_01="Url Pasada     : ${URL_PASADA}"


#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#----- [1] Inicio comprobacion descarga
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_wzet}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_wzet}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_wzet}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_wzet}
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

