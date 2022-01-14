#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Enero 2012"
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
#-- ver_wsdl_endpoint
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
#E ver_wsdl_endpoint ARQ_GesSolPres_SMED		--		Ver el endpoint del wsdl
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


#-La idea es que te muestre el endpoint de un servicio indicado
#-Mini alias wsdl

ver_wsdl_endpoint()
{
IS_ver_wsdl_endpoint="Muestra el endpoint del servicio indicado"
INFO_SCRIPT=${IS_ver_wsdl_endpoint}

SERVICIO_PASADO=${1}

if [ "${SERVICIO_PASADO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ver_wsdl_endpoint "Servicio Pasado"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

##/opt/Websphere7/ArqServer/profiles/soaarqsa/config/cells/LES000900202NodeSOAArqSACell/applications/
##TA_GesSolPres_SMEDApp.ear/deployments/TA_GesSolPres_SMEDApp/TA_GesSolPres_SMEDWeb.war/WEB-INF/wsdl
##./ARQ_EmailReceiver_SMEDWeb.war/META-INF/wsdl/arqos/soa/email/receive/ARQ_EmailReceiver_SMED_wEmailReceiver.wsdl

## Servicio pasado sin App : TA_GesSolPres_SMED

RUTA_WAR=${WEBSPHERE_APPS}${SERVICIO_PASADO}App.ear/deployments/${SERVICIO_PASADO}App/${SERVICIO_PASADO}Web.war/
RUTA_PROCESO=${RUTA_WAR}WEB-INF/

RUTA_WSDL_01=${RUTA_WAR}META-INF/wsdl
RUTA_WSDL_02=${RUTA_WAR}WEB-INF/wsdl

#-Existe la ruta

if [ -d "${RUTA_WAR}" ]; then
#-- Inicio Chequeo de la ruta general --------------------------------------

if [ -d "${RUTA_WSDL_01}" ]; then
RUTA_WSDL=${RUTA_WSDL_01}
elif [ -d "${RUTA_WSDL_02}" ]; then
RUTA_WSDL=${RUTA_WSDL_02}
#- El tema es que si no pilla ni la primera ni la segunda va a coger el valor anterior por tanto debemos vaciarla
fi
#-Es una mediacion - servicio

if [ -d "${RUTA_WSDL}" ]; then
#-- Inicio Chequeo mediacion ------------------------------------------

#- Puede haber mas de un servicio
LINEA_SERVICIO=$(find ${RUTA_WSDL} -type f -exec grep "soap:address" {} \;  )

#-Debemos usar un archivo porque puede haber mas de un servicio definido
find ${RUTA_WSDL} -type f -exec grep "soap:address" {} \; > servicios_brqx_borrar.dat

linea_caracter "=="
echo "Wsdls para el servicio ${SERVICIO_PASADO} "
linea_caracter "=-"

#-Mostramos los servicios - Habra que presentarle una cabecera pero eso ya tomorrow
cat servicios_brqx_borrar.dat | cut -d '"' -f2 | grep "http" 

#-Aqui insertariamos los cambios

linea_caracter "=="

#-Eliminamos el fichero temporal
rm -f servicios_brqx_borrar.dat
else
#-Vamos a ver si es un proceso

if [ -d "${RUTA_PROCESO}" ]; then
#-Es un proceso
linea_caracter "=="
echo "El servicio ${SERVICIO_PASADO} es un proceso "
fi

#-- Fin Chequeo mediacion ------------------------------------------
fi

else
linea_caracter "=="
echo "Error el el servicio ${SERVICIO_PASADO}    "
linea_caracter "=-"

#-- Inicio Chequeo de la ruta general --------------------------------------
fi
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------

#-Vaciamos variables
RUTA_WSDL=

fi
}

#-------------------------------------------------------------------
#+ Sistema de trazado N4 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL	-	Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------

