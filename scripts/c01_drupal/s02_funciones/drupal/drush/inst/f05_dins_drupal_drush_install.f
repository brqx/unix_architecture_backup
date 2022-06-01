#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.0" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- dins
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_getdomainline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Instala un profile o distribucion en la ruta actual con los valores relacionados a la ruta
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T install profile distribution drupal
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P [PROFILE_NAME]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E dins seo_starter_kit -- Instala el perfil indicado con drush
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
LEVEL_NIVEL=04
CONCEPT_MOLDE="funcion"
CONCEPT_ARQUETIPO="drush"
CONCEPT_LEVEL="Script $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} ${CONCEPT_CARACTER}"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 

dins()
{

PROFILE_NAME="standard"

VER="0.1.0"

dins_OUT=0
dins_ERR=""
dins_MSG=""

dins_FUN="dins"
dins_NFO="Instala un profile o distribucion en la ruta actual con los valores relacionados a la ruta [$VER]"
dins_FMT="dins LINE"
dins_EXA="dins LINE"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${dins_NFO}" "${dins_FMT}" "${dins_EXA}"
#--------------------------------------------------------------------------------
else

#-Obtener la informacion del site en razon a la ruta actual

ws_getpathline
dins_OUT=$(expr  ${dins_OUT} + ${ws_getpathline_OUT})
dins_ERR="${dins_ERR}${ws_getpathline_ERR}"

if [ "${ws_getpathline_OUT}" == "0" ] ; then
#--STA_IF_[01] - [IF ws_getdomainline_CORRECT] ----------------------------------

CMD="drush site-install  ${PROFILE_NAME} "									
CMD="${CMD}--db-url=mysql://${DBUSERNAME}:${DBPASSWORD}@localhost/${DATABASE} "
CMD="${CMD}--account-mail='r16@mailz.com' " 
CMD="${CMD}--account-name=brqx "												
CMD="${CMD}--account-pass=ricardo123 " 
CMD="${CMD}--site-mail='r16@mailz.com "
CMD="${CMD}--site-name=\"${SITENAME}\"	

CMD="drush status"				# CMD to test

#-Dos opciones para lanzar
# eval ${CMD}
${CMD}

else

dins_EER="#-E30:Wrong Parameters ##"
dins_COD=30

dins_OUT=$(expr  ${dins_OUT} + ${dins_COD})
dins_ERR="${dins_ERR}${dins_EER}"


fi


if [ "${dins_OUT}" != "0" ] ; then
dins="+${dins_FUN}::##${dins_ERR}"
footer_error "${dins_ERR}"
fi


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
