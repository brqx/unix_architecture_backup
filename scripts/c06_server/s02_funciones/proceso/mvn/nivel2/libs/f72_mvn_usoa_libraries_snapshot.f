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
#-- mvn_usoa_libraries_snapshot
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - mvn_gsoa_libraries_snapshot
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Obtiene libreria version snapshot del servidor de maven nexus
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
#E mvn_usoa_libraries_snapshot 11_2 -- Oteniene la version 11_2 de las librerias 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias mvgfull
mvn_usoa_libraries_snapshot()
{
IS_mvn_usoa_libraries_snapshot="Descarga todas las librerias para la version indicada"
INFO_SCRIPT=${IS_mvn_usoa_libraries_snapshot}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_mvn_usoa_libraries_snapshot=${INFO_SCRIPT}

VERSION_USOA=${1}
RUTA_DESTINO=${2}

SALIDA_mvn_usoa_libraries_snapshot=0
NOMBRE_PANTALLA_mvn_usoa_libraries_snapshot=PANTALLA_mvn_usoa_libraries_snapshot.dat

NOMBRE_SCRIPT_mvn_usoa_libraries_snapshot=mvn_usoa_libraries_snapshot
PARAMETROS_SCRIPT_mvn_usoa_libraries_snapshot="[VERSION]"


if [ "${VERSION_USOA}" == "" ]; then
	VERSION_USOA=${VERSION_ARQOS_MVN_LIBS_SNAPSHOT}
fi

if [ "${RUTA_DESTINO}" == "" ]; then
	RUTA_DESTINO=${LIBRERIAS_MAVEN}
fi

if [ "${VERSION_USOA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_mvn_usoa_libraries_snapshot} ${PARAMETROS_SCRIPT_mvn_usoa_libraries_snapshot}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Almacenamos la ruta actual para poder volver
RUTA_ACTUAL_UFRONTAL=${PWD}


if [ -d "${RUTA_DESTINO}" ] ; then
#----====----====----====----====----====----====----====----====---
#-- [1] Inicio Comprobacion ruta correcta
#----====----====----====----====----====----====----====----====---

##echo "entrando en : ${RUTA_DESTINO}"

cd ${RUTA_DESTINO}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
mvn_gsoa_libraries_snapshot  ${VERSION_USOA}
SALIDA_mvn_usoa_libraries_snapshot=${SALIDA_mvn_gsoa_libraries_snapshot}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

PARAMETROS_MOTIVO_01="Version         : ${VERSION_UFRONTAL}"
PARAMETROS_MOTIVO_02="Ruta descarga   : ${RUTA_DESTINO}"

if [ "${SALIDA_mvn_gsoa_libraries_snapshot}" == "0" ] ; then
#------======------======------======------======------======------=
#-- [2] Inicio Descarga librerias
#------======------======------======------======------======------=
MOTIVO_FUNCION="Se han descargado librerias nuevas de forma correcta"

else

MOTIVO_FUNCION="Error al descargar librerias"

#------======------======------======------======------======------=
#-- [2] Fin Descarga librerias
#------======------======------======------======------======------=
fi

## echo "vuelta a ${RUTA_ACTUAL_UFRONTAL} "
cd ${RUTA_ACTUAL_UFRONTAL}

else

MOTIVO_FUNCION="La ruta no es correcta"
SALIDA_mvn_usoa_libraries_snapshot=3

#----====----====----====----====----====----====----====----====---
#-- [1] Fin Comprobacion ruta correcta
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_mvn_usoa_libraries_snapshot}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_mvn_usoa_libraries_snapshot}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_mvn_usoa_libraries_snapshot}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_mvn_usoa_libraries_snapshot}
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
