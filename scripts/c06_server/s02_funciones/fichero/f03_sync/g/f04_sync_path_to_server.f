#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2011"
STATUS_SCRIPT="testing"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05}"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- sync_path_to_server   ( ORIGEN  >> DESTINO )
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Sincroniza ficheros con otro servidor 
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T sincronismo ficheros servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [usuario] [servidor] [puerto]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E sync_path_to_server root core 22
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#Sincroniza la carpeta indicada
#- Mini alias syp
sync_path_to_server()
{
#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------

USUARIO_CONEXION=${1}
FICHERO=${2}
SERVER=${3}
PORT=${4}

if [ "${USUARIO_CONEXION}" == "" ]; then
## Activamos un usuario por defecto
USUARIO_CONEXION=ibm
fi  

if [ "${SERVER}" == "" ] ; then
#- Servidor por defecto
SERVER=core
fi

if [ "${PORT}" == "" ] ; then
#- Servidor por defecto
PORT=22
##PORT=65533
fi

if [ "${FOLDER}" == "" ] ; then
#- Ruta por defecto
FOLDER=$PWD
fi



#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${USUARIO_CONEXION}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt sync_file_to_server "[usuario] [servidor] [puerto] [path] "

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

FOLDER_DEST=$(dirname ${FOLDER} )

echo "======================================="
echo "Sincronizando $(uname -n) >> ${SERVER} "
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo "Ruta : ${FOLDER}								"
echo "---------------------------------------"
rsync -avz -e "ssh -oPort=${PORT}" ${FOLDER} ${USUARIO_CONEXION}@${SERVER}:${FOLDER_DEST};  &> /dev/null

echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
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
