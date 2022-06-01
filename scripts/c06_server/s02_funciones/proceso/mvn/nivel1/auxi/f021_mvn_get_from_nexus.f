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
#-- mvn_get_from_nexus
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Obtiene un artefacto desde Nexus
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T obtener artefacto mvn servidor maven
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [RUTA_NEXUS]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E mvn_get_from_nexus url_nexus -- Oteniene la version 11_2 de la libreria LIV1
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Posible alias nexget
mvn_get_from_nexus()
{
IS_mvn_get_from_nexus="Obtiene libreria version release"
INFO_SCRIPT=${IS_mvn_get_from_nexus}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_mvn_get_from_nexus=${INFO_SCRIPT}

#-La ruta lo debe incluir todo hasta el fichero
URL_NEXUS_COMPLETA="${1}"

SALIDA_mvn_get_from_nexus=0

NOMBRE_SCRIPT_mvn_get_from_nexus=mvn_get_from_nexus
PARAMETROS_SCRIPT_mvn_get_from_nexus="RUTA_COMPLETA_NEXUS"

if [ "${URL_NEXUS_COMPLETA}" == "" ]; then

e_pmt ${NOMBRE_SCRIPT_mvn_get_from_nexus} ${PARAMETROS_SCRIPT_mvn_get_from_nexus}


else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

wget ${URL_NEXUS_COMPLETA} 2> /dev/null
RESULTADO_DESCARGA=$?

SALIDA_mvn_get_from_nexus=${RESULTADO_DESCARGA}

if [ "${RESULTADO_DESCARGA}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio Descarga de nexus
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Descarga de Nexus correcta."
PARAMETROS_MOTIVO_01="URL : ${URL_NEXUS_COMPLETA}"

else

MOTIVO_FUNCION="Descarga de Nexus incorrecta."
PARAMETROS_MOTIVO_01="URL : ${URL_NEXUS_COMPLETA}"

#--------========--------========--------========--------========---
#----- [1] Fin Descarga de nexus
#--------========--------========--------========--------========---
fi

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
