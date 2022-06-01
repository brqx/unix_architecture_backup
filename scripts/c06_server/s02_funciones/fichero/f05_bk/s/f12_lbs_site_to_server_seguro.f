#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.6"          #  Version del Script actual
FECHA_SCRIPT="Abril 2012"
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
#-- lbs_site_to_server_seguro
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - czf_path_to_server_file - dbr_copy
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera un live backup de FS y DB del site indicado
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T live backup site ficheros ssh scp servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [usuario_servidor] [site] [usuario_servidor2] [site2] 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E lbs_site_to_server_seguro rct -- Hace un backup del site rct
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Live Backup Seguro - No elimina la informacion destino antes de copiar
lbs_site_to_server_seguro()
{
IS_lbs_site_to_server_seguro="Live Backup site en servidor destino si no existe en el mismo"
INFO_SCRIPT=${IS_lbs_site_to_server_seguro}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_lbs_site_to_server_seguro=${INFO_SCRIPT}

CUENTA_ORIGEN=${1}
PROYECTO_ORIGEN=${2}
CUENTA_DESTINO=${3}
PROYECTO_DESTINO=${4}

SALIDA_lbs_site_to_server_seguro=0

NOMBRE_SCRIPT_lbs_site_to_server_seguro=lbs_site_to_server_seguro
PARAMETROS_SCRIPT_lbs_site_to_server_seguro="cuenta_origen [proyecto_origen] [cuenta_destino] [proyecto_destino]"

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

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${CUENTA_ORIGEN}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_lbs_site_to_server_seguro} ${PARAMETROS_SCRIPT_lbs_site_to_server_seguro}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------
#-Almacenamos la ruta previa al backup
RUTA_ACTUAL_BK=${PWD}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

#-Obtenemos informacion para hacer el dead backup
get_live_backup_db_data ${CUENTA_ORIGEN}  ${PROYECTO_ORIGEN}

SALIDA_lbs_site_to_server_seguro=${SALIDA_get_live_backup_db_data}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_get_live_backup_db_data}" == "0" ] ; then
#----=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
#----- [1] Inicio Datos Recuperados
#----=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

echo "-- ${USUARIO_CONEXION} ${SERVER} ${PORT}  "
echo "File System Seguro: "
echo "-origen - ${RUTA_LIVE_FS_ORIGEN}		"
echo "-destino- ${RUTA_LIVE_FS_DESTINO}		"
echo "Data Base Seguro: "
echo "-origen - ${DB_LOCAL}		"
echo "-destino- ${DB_REMOTA}		"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
#-Falta ver que copia para ver si borra algo o no
##czf_path_to_server ${USUARIO_CONEXION} ${SERVER} ${PORT} ${RUTA_LIVE_FS_ORIGEN} ${RUTA_LIVE_FS_DESTINO} 

SALIDA_lbs_site_to_server_seguro=${SALIDA_czf_path_to_server}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_czf_path_to_server}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [2] Inicio Copia FS correcta
#----====----====----====----====----====----====----====----====---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

#-Copiariamos la BD - Respeta la que hay
##dbr_copy_seguro ${USUARIO_CONEXION} ${SERVER} ${PORT} ${DB_LOCAL} ${DB_REMOTA}

SALIDA_lbs_site_to_server_seguro=${SALIDA_dbr_copy_seguro}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_dbr_copy_seguro}" == "0" ] ; then
#------======------======------======------======------======------=
#----- [3] Inicio Copia DB correcta
#------======------======------======------======------======------=
MOTIVO_FUNCION="Copia Correcta"

else

MOTIVO_FUNCION="Error al copiar la BD"
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Base Datos : ${DB_LOCAL} ${DB_REMOTA}"

#------======------======------======------======------======------=
#----- [3] Fin Copia DB correcta
#------======------======------======------======------======------=
fi
else

MOTIVO_FUNCION="Error al copiar el Sistema"
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Base Datos : ${RUTA_LIVE_FS_ORIGEN} ${RUTA_LIVE_FS_DESTINO} "

#----====----====----====----====----====----====----====----====---
#----- [2] Fin Copia FS correcta
#----====----====----====----====----====----====----====----====---
fi
else

MOTIVO_FUNCION="Error al recopilar informacion para el backup"
PARAMETROS_MOTIVO_01="Parametros : ${CUENTA_ORIGEN}  ${PROYECTO_ORIGEN}"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin Datos Recuperados
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_lbs_site_to_server_seguro}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_lbs_site_to_server_seguro}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_lbs_site_to_server_seguro}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

#- Volvemos a la ruta guardada
return ${lbs_site_to_server_seguro}

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
