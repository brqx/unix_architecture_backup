#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.4"          #  Version del Script actual
FECHA_SCRIPT="Junio 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- mvn_make_url_for_nexus
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Prepara una url para nexus
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T preparar url artefacto mvn servidor maven
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E mvn_make_url_for_nexus gid aid ver -- Prepara una url para nexus
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

##GroupId: com.mapfre.dgtp.cosym.dispatcher
##ArtifactId: MAPFRE_REST_DISPATCHER_FEAR
##Version: 0.0.1-SNAPSHOT

#- Posible alias nexget
mvn_make_url_for_nexus()
{
IS_mvn_make_url_for_nexus="Preparar una url para nexus"
INFO_SCRIPT=${IS_mvn_make_url_for_nexus}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_mvn_make_url_for_nexus=${INFO_SCRIPT}

#-La ruta lo debe incluir todo hasta el fichero
GROUP_ID="${1}"
ARTIFACT_ID="${2}"
VERSION_ID="${3}"
TIPO_ID="${4}"

SALIDA_mvn_make_url_for_nexus=0

NOMBRE_SCRIPT_mvn_make_url_for_nexus=mvn_make_url_for_nexus
PARAMETROS_SCRIPT_mvn_make_url_for_nexus="GROUP_ID ARTIFACT_ID VERSION [TIPO]"

if [ "${TIPO_ID}" == "" ]; then
TIPO_ID="s"
RUTA_NEXUS=${RUTA_NEXUS_SNAPSHOTS}
fi

if [ "${TIPO_ID}" == "r" ]; then
RUTA_NEXUS=${RUTA_NEXUS_RELEASES}
fi


if [ "${GROUP_ID}" == "" ]; then

e_pmt ${NOMBRE_SCRIPT_mvn_make_url_for_nexus} ${PARAMETROS_SCRIPT_mvn_make_url_for_nexus}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

GROUP_ID_TRANSFORMADO=$(echo ${GROUP_ID} | tr "." "/" )

RUTA_NEXUS_FINAL=${RUTA_NEXUS}${GROUP_ID_TRANSFORMADO}/${ARTIFACT_ID}/${VERSION_ID}/

MOTIVO_FUNCION="Composicion de rutas de nexus"
PARAMETROS_MOTIVO_01="Group    ID: ${GROUP_ID}"
PARAMETROS_MOTIVO_02="Artifact ID: ${ARTIFACT_ID}"
PARAMETROS_MOTIVO_03="Version    : ${VERSION_ID}"
PARAMETROS_MOTIVO_04="URL : ${RUTA_NEXUS_FINAL}"


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_wcosym_parallel_restart}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_wcosym_parallel_restart}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_wcosym_parallel_restart}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi



return ${SALIDA_mvn_get_from_nexus}
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
