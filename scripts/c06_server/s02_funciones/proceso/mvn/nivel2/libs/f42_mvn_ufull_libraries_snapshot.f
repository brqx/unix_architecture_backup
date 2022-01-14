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
#-- mvn_ufull_libraries_snapshot
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - mvn_gfull_libraries_snapshot
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
#E mvn_ufull_libraries_snapshot 11_2 -- Oteniene la version 11_2 de la libreria LIV1
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias mvufull
mvn_ufull_libraries_snapshot()
{
IS_mvn_ufull_libraries_snapshot="Actualiza todas las libreria desde servidor maven remoto"
INFO_SCRIPT=${IS_mvn_ufull_libraries_snapshot}

VERSION_UFULL=${1}
RUTA_DESTINO=${2}

SALIDA_mvn_ufull_libraries_snapshot=0

NOMBRE_SCRIPT_mvn_ufull_libraries_snapshot=mvn_ufull_libraries_snapshot
PARAMETROS_SCRIPT_mvn_ufull_libraries_snapshot="[VERSION] [RUTA]"



if [ "${VERSION_UFULL}" == "" ]; then
	VERSION_UFULL=${VERSION_ARQOS_MVN_LIBS_SNAPSHOT}
fi

if [ "${RUTA_DESTINO}" == "" ]; then
	RUTA_DESTINO=${LIBRERIAS_MAVEN}
fi

if [ "${VERSION_UFULL}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_mvn_ufull_libraries_snapshot} ${PARAMETROS_SCRIPT_mvn_ufull_libraries_snapshot}


else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Almacenamos la ruta actual para poder volver
RUTA_ACTUAL_UFULL=${PWD}

echo "entrando en : ${RUTA_DESTINO}"

cd ${RUTA_DESTINO}

mvn_gfull_libraries_snapshot  ${VERSION_UFULL}
SALIDA_mvn_ufull_libraries_snapshot=${SALIDA_mvn_gfull_libraries_snapshot}
echo "vuelta a ${RUTA_ACTUAL_UFULL} "
cd ${RUTA_ACTUAL_UFULL}


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
