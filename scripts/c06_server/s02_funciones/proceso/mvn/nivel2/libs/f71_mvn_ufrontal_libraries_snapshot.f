#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.3"          #  Version del Script actual
FECHA_SCRIPT="Enero 2013"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- mvn_ufrontal_libraries_snapshot
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - mvn_gfrontal_libraries_snapshot
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Actualiza libreria version snapshot del servidor de maven nexus
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T obtener librerias mvn servidor maven nexus
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [version]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E mvn_ufrontal_libraries_snapshot 11_2 -- Oteniene la version 11_2 de las librerias 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#-Descarga la libreria y la deja en la ruta actual

mvn_ufrontal_libraries_snapshot()
{
IS_mvn_ufrontal_libraries_snapshot="Descarga todas las librerias para la version indicada"
INFO_SCRIPT=${IS_mvn_ufrontal_libraries_snapshot}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_mvn_ufrontal_libraries_snapshot=${INFO_SCRIPT}

VERSION_UFRONTAL=${1}
RUTA_DESTINO=${2}

SALIDA_mvn_ufrontal_libraries_snapshot=0

NOMBRE_SCRIPT_mvn_ufrontal_libraries_snapshot=mvn_ufrontal_libraries_snapshot
PARAMETROS_SCRIPT_mvn_ufrontal_libraries_snapshot="[VERSION] [RUTA]"

if [ "${VERSION_UFRONTAL}" == "" ]; then
	VERSION_UFRONTAL=${VERSION_ARQOS_MVN_LIBS_SNAPSHOT}
fi

if [ "${RUTA_DESTINO}" == "" ]; then
	RUTA_DESTINO=${LIBRERIAS_MAVEN}
fi


if [ "${VERSION_UFRONTAL}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_mvn_ufrontal_libraries_snapshot} ${PARAMETROS_SCRIPT_mvn_ufrontal_libraries_snapshot}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Almacenamos la ruta actual para poder volver
RUTA_ACTUAL_UFRONTAL=${PWD}

PARAMETROS_MOTIVO_01="Version         : ${VERSION_UFRONTAL}"
PARAMETROS_MOTIVO_02="Ruta descarga   : ${RUTA_DESTINO}"


if [ -d "${RUTA_DESTINO}" ] ; then
#----====----====----====----====----====----====----====----====---
#-- [1] Inicio Comprobacion ruta correcta
#----====----====----====----====----====----====----====----====---

## echo "entrando en : ${RUTA_DESTINO}"

cd ${RUTA_DESTINO}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
mvn_gfrontal_libraries_snapshot  ${VERSION_UFRONTAL}
SALIDA_mvn_ufrontal_libraries_snapshot=${SALIDA_mvn_gfrontal_libraries_snapshot}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_mvn_gfrontal_libraries_snapshot}" == "0" ] ; then
#------======------======------======------======------======------=
#-- [2] Inicio Descarga librerias
#------======------======------======------======------======------=
MOTIVO_FUNCION="Se han descargado librerias nuevas de forma correcta"

else

MOTIVO_FUNCION="No hay novedades. O ya existen o ha habido errore en la descarga."

#------======------======------======------======------======------=
#-- [2] Fin Descarga librerias
#------======------======------======------======------======------=
fi

## echo "vuelta a ${RUTA_ACTUAL_UFRONTAL} "
cd ${RUTA_ACTUAL_UFRONTAL}

else

MOTIVO_FUNCION="La ruta no es correcta"
SALIDA_mvn_ufrontal_libraries_snapshot=3

#----====----====----====----====----====----====----====----====---
#-- [1] Fin Comprobacion ruta correcta
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_mvn_ufrontal_libraries_snapshot}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_mvn_ufrontal_libraries_snapshot}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_mvn_ufrontal_libraries_snapshot}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_mvn_ufrontal_libraries_snapshot}
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
