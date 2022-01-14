#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.5" #  Version del Script actual
FECHA_SCRIPT="Febrero 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="websphere"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="proceso"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- get_librerias_app_was
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- linea_normal - linea_alterna - linea_caracter
#-------------------------------------------------------------------
#-- WEBSPHERE_APPS
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lista los perfiles en el entorno websphere indicado
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T listado perfiles websphere 
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P LINEA_CARPETA_Y_ARCHIVO
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E get_librerias_app_was ARQ_GesSolPres_SMED		--		Ver el endpoint del wsdl
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


#-La idea es que te muestre el endpoint de un servicio indicado
#-Mini alias verlibs

get_librerias_app_was()
{
IS_get_librerias_app_was="Devuelve las librerias asociadas a dicha aplicacion"
INFO_SCRIPT=${IS_get_librerias_app_was}

SERVICIO_PASADO=${1}

if [ "${SERVICIO_PASADO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt get_librerias_app_was "Servicio Pasado"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

##./config/cells/LES000900202NodeSOAArqSACell/applications/SBDA_GenNUUMA_SMEDApp.ear/
##deployments/SBDA_GenNUUMA_SMEDApp/deployment.xml

## Servicio pasado sin App : TA_GesSolPres_SMED

RUTA_APPS_DEPLOYMENT=${WEBSPHERE_APPS}${SERVICIO_PASADO}App.ear/deployments/${SERVICIO_PASADO}App/deployment.xml

#-Existe la ruta

if [ -f "${RUTA_APPS_DEPLOYMENT}" ] ; then
#-- Inicio Chequeo de la ruta general ------------------------------

LISTA_LIBRERIAS_APP=$(cat ${RUTA_APPS_DEPLOYMENT} | grep libraries | cut -d "=" -f3 | cut -d '"' -f2 | tr "\n" " " )

SALIDA_get_librerias_app_was=${LISTA_LIBRERIAS_APP}

else
linea_caracter "=="
echo "Error en el servicio ${SERVICIO_PASADO}    "
linea_caracter "=-"

SALIDA_get_librerias_app_was=
#-- Fin Chequeo de la ruta general ---------------------------------
fi
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------


fi
}

#-------------------------------------------------------------------
#+ Sistema de trazado N4 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL	-	Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------

