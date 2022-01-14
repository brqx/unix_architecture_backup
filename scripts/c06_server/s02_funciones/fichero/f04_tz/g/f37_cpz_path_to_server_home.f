#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.5"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05}"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- czf_path_to_server_home
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera un backup (tar.gz) de la ruta indicada en el servidor 
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T backup tar gz ficheros ssh scp servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [usuario] [servidor] [puerto] [origen] [destino]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E czf_path_to_server_home ibm core 22 -- copia la ruta actual y la cuelga del home
#-------------------------------------------------------------------
#E czf_path_to_server_home
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias czf
czf_path_to_server_home()
{
IS_czf_path_to_server_home="Copia un fichero o carpeta comprimiendolo en servidor destino."
INFO_SCRIPT=${IS_czf_path_to_server_home}

#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2012
#-------------------------------------------------------------------

#-Aplicando logica debe ser origen destino

USUARIO_CONEXION=${1}
SERVER=${2}
PORT=${3}
RUTA_FICHERO_ORIGEN=${4}

if [ "${USUARIO_CONEXION}" == "" ]; then
## Activamos un usuario por defecto
USUARIO_CONEXION=ibm
fi  

if [ "${SERVER}" == "" ]; then
##	SERVER=ibrqx
SERVER=core6
fi  

if [ "${PORT}" == "" ]; then
## Activamos un puerto por defecto
##	PORT=65533
PORT=22
fi  

if [ "${RUTA_FICHERO_ORIGEN}" == "" ]; then
RUTA_FICHERO_ORIGEN=${RUTA_ACTUAL}
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${USUARIO_CONEXION}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt czf_path_to_server_home "[usuario] [servidor] [puerto] [destino] [ruta sin espacios]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- La idea es preparar los parametros y llamar a la funcion normal

#- Aqui vamos a obtener la ruta remota - hay que tener en cuenta si es un fichero o una ruta
#- Vamos a crear una funcion para gestionar la home

fullpath ${RUTA_FICHERO_ORIGEN}
EXITCODE_fullpath=$?
RUTA_COMPLETA_ORIGEN=${SALIDA_fullpath}

#-Aqui tenemos dos cosas la ruta completa y la parte entonces
#-- Ruta completa /home/a/b/c
#-- Parte b/c

partepath_izda ${RUTA_COMPLETA_ORIGEN} ${HOME}
#-Le pasamos la izda - obtenemos la dcha

## echo "Ruta completa : ${RUTA_COMPLETA_ORIGEN} "
## echo "Parte         : ${RUTA_FICHERO_ORIGEN}  "
## echo "Parte izda    : ${SALIDA_partepath_izda}"

#- lA variable es RETURN_VALOR_VARIABLE_REMOTA

get_ssh_var_raiz_home ${USUARIO_CONEXION} ${SERVER} ${PORT}

RUTA_COMPLETA_REMOTA=${RETURN_VALOR_VARIABLE_REMOTA}${SALIDA_partepath_izda}

#-Aqui deberia usar la parte de la ruta
### creapath ${RUTA_FICHERO_ORIGEN} ${RETURN_VALOR_VARIABLE_REMOTA}
### RUTA_COMPLETA_REMOTA=${SALIDA_creapath}

#- Que pasa si no esta la raiz

## echo "Ruta Origen : ${RUTA_COMPLETA_ORIGEN}"
## echo "Ruta Remota : ${RUTA_COMPLETA_REMOTA}"

czf_path_to_server ${USUARIO_CONEXION} ${SERVER} ${PORT} ${RUTA_FICHERO_ORIGEN} ${RUTA_COMPLETA_REMOTA}

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
