#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.2"          #  Version del Script actual
FECHA_SCRIPT="Enero 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- mvn_upd_libraries_release
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - ch
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Actualiza las librerias/artefactos basandose en servidor de Maven
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T actualizar obtener librerias mvn servidor maven
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [version]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E mvn_upd_libraries_release 11_2 -- Oteniene la version 11_2 de la libreria LIV1
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias mvufull
mvn_upd_libraries_release()
{
IS_mvn_upd_libraries_release="Actualiza todas las libreria desde servidor maven remoto"
INFO_SCRIPT=${IS_mvn_upd_libraries_release}

VERSION_UFULL=${1}
RUTA_DESTINO=${2}


if [ "${VERSION_UFULL}" == "" ]; then
	VERSION_UFULL=${VERSION_ARQOS_MVN_LIBS_RELEASE}
fi

if [ "${RUTA_DESTINO}" == "" ]; then
	RUTA_DESTINO=${LIBRERIAS_MAVEN}
fi

if [ "${VERSION_UFULL}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt mvn_upd_libraries_release "[version] [ruta]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Almacenamos la ruta actual para poder volver
RUTA_ACTUAL_UFULL=${PWD}

cd ${RUTA_DESTINO}

mvn_gfull_libraries_release  ${VERSION_UFULL}

cd ${RUTA_ACTUAL_UFULL}

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
