#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Julio 2012"
STATUS_SCRIPT="all checked"
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
#-- auth_access_no_proxy
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
#E auth_access_no_proxy brqxng.com usu pas --> informa del acceso al site
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Mini Alias aanp
auth_access_no_proxy()
{
IS_auth_access_no_proxy="Comprueba que el site responda correctamente a una peticion http"
INFO_SCRIPT=${IS_auth_access_no_proxy}

URL=${1}
USUARIO_PASADO=${2}
CLAVE_PASADA=${3}

SALIDA_auth_access_no_proxy=0

NOMBRE_SCRIPT_auth_access_no_proxy=auth_access_no_proxy
PARAMETROS_SCRIPT_auth_access_no_proxy="ID_WAS"

if [ "${URL}" == "" ] ;  then
#URL="http://les000900200:9082/Taller_CCFSASolPres_HTTPRouter/taller/saludo/14"
URL="http://les000900202:9081/EMI_ConsultPol_SMEDWeb/hIConsultarPoliza/poliza/55/coberturas"
fi

if [ "${USUARIO_PASADO}" == "" ] ;  then
USUARIO_PASADO="adm-soa"
fi

if [ "${CLAVE_PASADA}" == "" ] ;  then
CLAVE_PASADO="adm-soa"
fi

if [ "${URL}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_auth_access_no_proxy} ${PARAMETROS_SCRIPT_auth_access_no_proxy}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Hacer peticion
#-- [2] Devulver resultado
#--------========--------========--------========--------========---

#-Dejamos dos reintentos
wget --no-proxy --user=${USUARIO_PASADO} --password=${CLAVE_PASADA} --timeout 2 -q -O pagina_brqx_borrar.html $URL
ESTADO_SITE=$?
rm -f ./pagina_brqx_borrar.html
SALIDA_auth_access_no_proxy=${ESTADO_SITE}
#-Habria que crear una funcion para uniformar la salida

#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_auth_access_no_proxy}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_auth_access_no_proxy}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_auth_access_no_proxy}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_auth_access_no_proxy}

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
