#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.3"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2011"
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
#-- get_live_backup_data
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - get_server_info
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Obtiene los parametros para hacer un live backup del site
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T obtencion parametros get live backup ficheros ssh scp servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [cuenta_origen] [proyecto_origen] [cuenta_destino] [proyecto_destino]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E get_live_backup_data zi main zo -- Devuelve los datos para las cuentas zi y zo
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias lbk
get_live_backup_data()
{
IS_get_live_backup_data="Obtiene los parametros de live backup para la cuenta indicada"
INFO_SCRIPT=${IS_get_live_backup_data}
#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2012
#-------------------------------------------------------------------

#-Los sites son el despliegue de un proyecto en una cuenta de un servidor

CUENTA_ORIGEN=${1}
PROYECTO_ORIGEN=${2}
CUENTA_DESTINO=${3}
PROYECTO_DESTINO=${4}


if [ "${CUENTA_ORIGEN}" == "" ]; then
## Activamos un usuario por defecto
CUENTA_ORIGEN=-?
fi  

if [ "${PROYECTO_ORIGEN}" == "" ]; then
## Activamos un proyecto por defecto
PROYECTO_ORIGEN=main
fi  

if [ "${CUENTA_DESTINO}" == "" ]; then
## Activamos un usuario por defecto
CUENTA_DESTINO=${CUENTA_ORIGEN}
fi  

if [ "${PROYECTO_DESTINO}" == "" ]; then
## Activamos un proyecto por defecto
PROYECTO_DESTINO=${PROYECTO_ORIGEN}
fi  


if [ "${CUENTA_ORIGEN}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt get_live_backup_data "[proyecto] [site]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- y el fichero : zzcuentas_servidor.dat
# cuenta:proyecto:bbdd_local:bbdd_remota:servidor_backup
# main:palillos:p50palil:p50palil:abrqx
# za:palillos:d50palil:d50palil:bbrqx


#- Solo queda formar la ruta de origen : get_path_site
#- Para formar la ruta debemos saber si es uno o dos parametros

#-Informacion cuentas servidor (pendiente)
FICHERO=${RS_SITE}zinfo_sites_live_backup.dat

#-Primero vamos a obtener el servidor de backup

if [ "${PROYECTO_ORIGEN}" == "main" ] ; then
#- Es un site principal
#- Pero la ruta debe existir en nuestro archivo

LINEA_DB=$( cat ${FICHERO} | grep "^main"  | grep ":${CUENTA_ORIGEN}" )

else
#- Es un subdominio.Tendremos un fichero general para subdominios

LINEA_DB=$( cat $FICHERO | grep "^${CUENTA_ORIGEN}"  | grep ":${PROYECTO_ORIGEN}" )

fi

#-Accedemos a la informacion del site en el servidor
#-Como invocamos otra funcion hay que ajustar las variables para evitar efectos laterales
test_path_site ${CUENTA_ORIGEN}  ${PROYECTO_ORIGEN}

#-Obtenemos los parametros del site para hacer el backup
DB_LOCAL=$( echo ${LINEA_DB} | cut -d ":" -f3 )
PARTE_DB_REMOTA=$( echo ${LINEA_DB} | cut -d ":" -f4 | cut -d "_" -f2 )
SERVER=$( echo ${LINEA_DB} | cut -d ":" -f5 )

#-La BD remota igual hay que ajustarla

DB_REMOTA=${CUENTA_DESTINO}_${PARTE_DB_REMOTA}

#-Sacamos la informacion de conexion del servidor
get_server_info ${SERVER}

## echo "Server Info : ${SERVIDOR} : ${USUARIO_CONEXION} - ${PORT} - ${RUTA_BACKUP_DB_DESTINO_GLOBAL} "

##echo "Info : ${SERVIDOR} ${BD_ORIGEN} - ${BD_DESTINO} "

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
