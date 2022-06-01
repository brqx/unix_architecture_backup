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
#-- czf_path_to_server_file
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Transfiere archivos medieante compresion previa
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
#E czf_path_to_server_file ibm core 22 -- Transfiere la ruta acutal
#-------------------------------------------------------------------
#E czf_path_to_server_file S U 22 fich -- Transfiere el fich
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

czf_path_to_server_file()
{
IS_czf_path_to_server="Copia un fichero o carpeta comprimiendolo en servidor destino."
INFO_SCRIPT=${IS_czf_path_to_server_file}

#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2012
#-------------------------------------------------------------------

#-Aplicando logica debe ser origen destino

USUARIO_CONEXION=${1}
SERVER=${2}
PORT=${3}
RUTA_FICHERO_ORIGEN=${4}
RUTA_BACKUP_DESTINO=${5}
CADENA_NOMBRE_FICHERO=${6}


#-Almacenamos la ruta actual para poder volver

RUTA_ACTUAL_CPF=${PWD}

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

#-Este parametro indicara el sincronismo con lo que tenemos ademas el que depende del home
if [ "${RUTA_BACKUP_DESTINO}" == "" ]; then
RUTA_BACKUP_DESTINO=${DB_GLOBAL_IMPORT}
fi  

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${USUARIO_CONEXION}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt czf_path_to_server_file "[usuario] [servidor] [puerto] [origen] [destino]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

##- Vamos a analizar ficheros con comillas, debe indicarlo y no hacer nada
#- Admite rutas absolutas

#- Vamos a hacer el tratamiento del origen - puede ser fichero o ruta
#- dirname no te mira si existe

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

#-- Esta parte hay que revisarla pues igual se indica el nombre del archivo completo o una parte
echo ${CADENA_NOMBRE_FICHERO}  | grep "\." &> /dev/null
SALIDA_PARTE=$?

if [ ${SALIDA_PARTE}  == "0" ] ; then
#-Indica que el archivo tiene un punto por tanto es un fichero completo

TAR_FILE=${CADENA_NOMBRE_FICHERO}

else
get_nombre_fichero_export ${CADENA_NOMBRE_FICHERO}

TAR_FILE=${SALIDA_get_nombre_fichero_export}

fi


#-------------------------------------------------------------------
#- Fin Gestion de la fecha
#-------------------------------------------------------------------

#- Como destino vamos a preparar una ruta organizada

echo "Copiando desde    : $(uname -n)::${RUTA_ORIGEN}  "
echo "Colocando en ruta : ${SERVER}:${PORT}::${dst}"

# Hacemos el tar
# Debemos bajar un nivel

if [ -d ${RUTA_ORIGEN} ] ; then
#-- Comprobacion de ruta

cd ${RUTA_ORIGEN}

#-El tar necesita permisos - Si no los tiene no lo hace
## echo "Hacemos el tar ${PWD}: ./${src} ==  ./${TAR_FILE} "


tar zcpvf ./${TAR_FILE} ${src} &> /dev/null
SALIDA_TAR=$?

# Luego hacemos la copia

if [ "${SALIDA_TAR}" == "0" ] ; then

## Debemos crear la ruta - Ver si esta sintaxis es correcta para ubuntu
ssh -oPort=${PORT} ${USUARIO_CONEXION}@${SERVER} "mkdir -p ${dst}"

#- Podemos dejar scp o poner cf_path_to_server
scp -r -P ${PORT} ./${TAR_FILE}  ${USUARIO_CONEXION}@${SERVER}:${dst}

# Toca borrar el fichero de envio en origen

rm -f ./${TAR_FILE}
else

echo "Error al intentar genera el fichero TAR : ${RUTA_ORIGEN} / ${TAR_FILE}"

fi

## echo "Borramos origen : ${src}/xync_brqx_2011.tar.gz "


#-- Fin comprobacion de ruta
return 0
else
#- No existe la ruta origen
echo "No existe ${RUTA_ORIGEN} "
return 1
fi

#-Volvemos a la ruta actual

cd ${RUTA_ACTUAL_CPF}

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
