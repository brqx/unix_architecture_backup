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
#-- cf_path_to_server
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - ch - ssh_mkdir
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
#E cf_to_server_path ibm core 22 /opt/files/ fich1 -- Copia fich1 en core::/opt/files/
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias cfp
cf_path_to_server()
{
IS_cf_path_to_server="Copia ficheros a un servidor via SSH indicando una ruta"
INFO_SCRIPT=${IS_cf_path_to_server}

USUARIO_CONEXION=${1}
SERVER=${2}
PORT=${3}
RUTA_FICHERO_ORIGEN=${4}
RUTA_BACKUP_DESTINO=${5}

RUTA_ACTUAL=${PWD}

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
	RUTA_DESTINO=${ARQ}
fi  

if [ "${RUTA_FICHERO_ORIGEN}" == "" ]; then
RUTA_FICHERO_ORIGEN=${RUTA_ACTUAL}
fi

#-Este parametro indicara el sincronismo con lo que tenemos ademas el que depende del home
if [ "${RUTA_BACKUP_DESTINO}" == "" ]; then
RUTA_BACKUP_DESTINO=${DB_GLOBAL_IMPORT}
fi  


if [ "${USUARIO_CONEXION}" == "-?" ]; then

e_pmt cf_path_to_server "[usuario host port dest] files"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Copiara a la misma ruta
#- Aqui vamos a obtener la ruta remota

RUTA_FICHERO=$( dirname ${RUTA_FICHERO_ORIGEN} ) ;
NOMBRE_ORIGEN=$( basename ${RUTA_FICHERO_ORIGEN} ) ;

if [ "${RUTA_FICHERO}" == "." ] ; then
#-La ruta es un solo miembro pero puede ser carpeta o archivo
RUTA_ORIGEN=${RUTA_ACTUAL}/
else
RUTA_ORIGEN=${RUTA_FICHERO}/
fi

#-Tratamiento de la entrada
echo "Ruta Origen  : ${RUTA_FICHERO_ORIGEN} "
echo "Ruta Destino : ${RUTA_BACKUP_DESTINO} "

#- La fuente no puede ser una ruta absoluta ya que el tar genera esa estructura
cleanpath ${NOMBRE_ORIGEN}
src=${SALIDA_cleanpath} ;

cleanpath ${RUTA_BACKUP_DESTINO}
dst=${SALIDA_cleanpath} ;

echo "Copiando desde    : $(uname -n)::${RUTA_ORIGEN}  "
echo "Colocando en ruta : ${SERVER}:${PORT}::${dst}"

if [ -d ${RUTA_ORIGEN} ] ; then
#-- Comprobacion de ruta

cd ${RUTA_ORIGEN}

#- Creamos la ruta destino - no debe crearla si ya existe

ssh_mkdir ${USUARIO_CONEXION} ${SERVER} ${PORT} ${dst}

#- Copiamos
scp -r -P ${PORT} ${src} ${USUARIO_CONEXION}@${SERVER}:${dst}

#-- Fin comprobacion de ruta
## return 0
else
#- No existe la ruta origen
echo "No existe ${RUTA_ORIGEN} "
## return 1
fi

cd ${RUTA_ACTUAL}

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
