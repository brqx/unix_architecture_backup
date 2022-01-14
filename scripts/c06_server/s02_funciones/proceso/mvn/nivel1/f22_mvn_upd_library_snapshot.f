#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.2"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- mvn_ufull_library
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - ch
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Actualiza una libreria/artefacto del servidor de Maven
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T obtener libreria mvn servidor maven
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P libreria [version]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E mvn_upd_library LIV1 11_2 -- Oteniene la version 11_2 de la libreria LIV1
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias mvupd
mvn_upd_library()
{
IS_mvn_upd_library="Actualiza libreria desde servidor remoto"
INFO_SCRIPT=${IS_mvn_upd_library}

#- En principio no necesita usuario

#- Por defecto no se indicara puerto y el usuario sera el mio : ibm

#USUARIO_CONEXION=${1}
#CLAVE_CONEXION=${1}

LIBRERIA=${1}
VERSION=${2}
RUTA_DESTINO=${3}
RUTA_NEXUS=${4}

if [ "${LIBRERIA}" == "" ]; then
	LIBRERIA="-?"
fi  

if [ "${VERSION}" == "" ]; then
	VERSION=${VERSION_ARQOS_MVN_LIBS_SNAPSHOT}
fi

if [ "${RUTA_DESTINO}" == "" ]; then
	RUTA_DESTINO=${LIBRERIAS_MAVEN}
fi

if [ "${LIBRERIA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt mvn_upd_library "libreria [version] [ruta_destino] [ruta_nexus]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Almacenamos la ruta actual para poder volver
RUTA_ACTUAL=${PWD}

cd ${RUTA_DESTINO}

mvn_get_library_snapshot  ${LIBRERIA} ${VERSION} ${RUTA_NEXUS}

cd ${RUTA_ACTUAL}

fi

#- Vaciamos las variables
LIBRERIA=
VERSION=
RUTA_DESTINO=

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
