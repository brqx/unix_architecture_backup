#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.1"          #  Version del Script actual
FECHA_SCRIPT="Febrero 2012"
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
#-- telnet_access_no_proxy
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
#T test telnet control servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P web 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E telnet_access_no_proxy brqxng.com --> informa del acceso al site
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Mini Alias sanp
telnet_access_no_proxy()
{
IS_telnet_access_no_proxy="Comprueba que el site responda correctamente a una peticion http"
INFO_SCRIPT=${IS_telnet_access_no_proxy}

URL_CON_PUERTO=$1
PUERTO=$2

if [ "${PUERTO}" == "" ] ; then
#- Por defecto preparamos un puerto web
PUERTO=80
fi

if [ "${URL_CON_PUERTO}" == "-?" ] ;  then

e_pmt telnet_access_no_proxy "url"

else

#-Inicio de la funcion
# Tenemos dos comportamientos

#-- Exitoso : 
## ubuntu:/root>cat salida_telnet_brqx.dat 
## Connection closed by foreign host.
#-- Puerto no accesible : 
## ubuntu:/root>cat salida_telnet_brqx.dat 
## telnet: Unable to connect to remote host: Connection refused

#-Vamos a permitir los dos formatos

echo $URL_CON_PUERTO | grep ":" > /dev/null
SALIDA_ECHO=$?

if [ "$SALIDA_ECHO" == "0" ] ; then
URL=$(echo ${URL_CON_PUERTO} | cut -d ":" -f1 )
PUERTO=$(echo ${URL_CON_PUERTO} | cut -d ":" -f2 )
else
URL=${URL_CON_PUERTO}
fi

#- Eliminamos el fichero de telnet anterior 
##echo "Conexion : $URL $PUERTO"

echo " " | telnet $URL $PUERTO > ./salida_telnet_brqx.dat 2> /dev/null

cat ./salida_telnet_brqx.dat | grep "Connected" > /dev/null

SALIDA_TELNET=$?

#- Eliminamos el fichero de telnet anterior 

rm -f ./salida_telnet_brqx.dat

SALIDA_SITE_TELNET=${SALIDA_TELNET}
return ${SALIDA_SITE_TELNET}

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
