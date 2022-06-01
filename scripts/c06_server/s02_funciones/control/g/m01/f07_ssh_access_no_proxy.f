#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.1"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
LEVEL_NIVEL_05=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="control"
CONCEPT_LEVEL_05="Script $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- site_access_no_proxy
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Comprueba que el site responde
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T test control servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P web 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E site_access brqxng.com --> informa del acceso al site
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Mini Alias sanp
site_access_no_proxy()
{
IS_site_access_no_proxy="Comprueba que el site responda correctamente a una peticion http"
INFO_SCRIPT=${IS_site_access_no_proxy}

URL=$1

if [ "${URL}" == "-?" ] ;  then

e_pmt site_access_no_proxy "url"

else

wget --no-proxy -q -O pagina_brqx_borrar.html $URL
ESTADO_SITE=$?
rm -f ./pagina_brqx_borrar.html
SALIDA_SITE_ACCESS=${ESTADO_SITE}
return ${SALIDA_SITE_ACCESS}

fi
}

#-------------------------------------------------------------------

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
