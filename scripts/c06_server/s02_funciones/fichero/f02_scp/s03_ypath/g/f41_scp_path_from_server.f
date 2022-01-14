#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.2"          #  Version del Script actual
FECHA_SCRIPT="Octubre 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- cf_path_from_server
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - ch
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Copia ficheros a otro servidor de forma parametrizada
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T copia ficheros ssh servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [usuario] [servidor] [puerto] [dest] ficheros 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E cf_path_from_server ibm core 22 /opt/files/ fich1 -- Copia fich1 en core::/opt/files/
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias cfp
cf_path_from_server()
{
IS_cf_path_from_server="Copia ficheros a un servidor via SSH indicando una ruta"
INFO_SCRIPT=${IS_cf_path_from_server}

##USUARIO_CONEXION=root
##USUARIO_CONEXION=ibm
##USUARIO_CONEXION=ricabel

#- Por defecto no se indicara puerto y el usuario sera el mio : ibm

USUARIO_CONEXION=${1}
SERVER=${2}
PORT=${3}
RUTA_DESTINO=${4}
FICHEROS=${5}

RUTA_ORIGEN=${PWD}

if [ "${USUARIO_CONEXION}" == "" ]; then
## Activamos un servidor por defecto
	USUARIO_CONEXION=ibm
##	SERVER=ibrqx
fi  


if [ "${SERVER}" == "" ]; then
## Activamos un servidor por defecto
	SERVER=frontal
##	SERVER=ibrqx
fi  

#- No activamos puerto. Activar en casa

if [ "${PORT}" == "" ]; then
## Activamos un puerto por defecto
	PORT=22
fi  

if [ "${RUTA_DESTINO}" == "" ]; then
## Activamos un puerto por defecto
	RUTA_DESTINO=/opt/bibliotecas_arquitectura/
fi  


#- Debemos asegurarnos primero que hay algo que copiar

if [ "${FICHEROS}" != "" ]; then

#- Copiara a la misma ruta
#- Aqui vamos a obtener la ruta remota

echo "Copiando Desde : ${SERVER}::${RUTA_DESTINO} : $PORT "
echo "Hacia ruta     : ${RUTA_ORIGEN} "

# Suponemos que lo hacemos desde la ruta actual en el servidor origen

scp -r -P ${PORT} ${USUARIO_CONEXION}@${SERVER}:${RUTA_DESTINO}${FICHEROS} ${RUTA_ORIGEN}

#-------------------------------------------------------------------
#- Vaciamos variables pues no son de arquitectura
#-------------------------------------------------------------------
USUARIO_CONEXION=
FICHEROS=
SERVER=
PORT=
RUTA_DESTINO=

else

e_pmt cf_path_from_server "[usuario host port dest] files"

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
