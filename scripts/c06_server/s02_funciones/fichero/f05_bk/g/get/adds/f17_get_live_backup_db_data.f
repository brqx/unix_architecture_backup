#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.4"          #  Version del Script actual
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
#-- get_live_backup_db_data
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Obtiene los parametros para hacer el backup del site
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T obtencion parametros get backup ficheros ssh scp servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [cuenta] [proyecto]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E get_live_backup_db_data zi  -- Devuelve los datos para la cuenta zi
#-------------------------------------------------------------------
#E get_live_backup_db_data zi parques -- Devuelve los datos para la cuenta zi:parques
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias glbdd
get_live_backup_db_data()
{
IS_get_live_backup_db_data="Obtiene los parametros de backup para la cuenta indicada"
INFO_SCRIPT=${IS_get_live_backup_db_data}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_get_live_backup_db_data=${INFO_SCRIPT}

#-Los sites son el despliegue de un proyecto en una cuenta de un servidor

CUENTA_ORIGEN=${1}
PROYECTO_ORIGEN=${2}

SALIDA_get_live_backup_db_data=0

NOMBRE_SCRIPT_get_live_backup_db_data=get_live_backup_db_data
PARAMETROS_SCRIPT_get_live_backup_db_data="[proyecto] [site]"

if [ "${CUENTA_ORIGEN}" == "" ] ; then
## Activamos un usuario por defecto
CUENTA_ORIGEN=-?
fi  

if [ "${PROYECTO_ORIGEN}" == "" ] ; then
## Activamos un proyecto por defecto
PROYECTO_ORIGEN=main
fi  

if [ "${CUENTA_ORIGEN}" == "-?" ] ; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_get_live_backup_db_data} ${PARAMETROS_SCRIPT_get_live_backup_db_data} 

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- y el fichero : 
# cuenta:proyecto:bbdd_local:bbdd_remota:servidor_backup
# main:palillos:p50palil:p50palil:abrqx
# za:palillos:d50palil:d50palil:bbrqx

#-Informacion cuentas servidor
FICHERO=${RS_SITE}zinfo_db_sites_live_backup.dat

#-Primero vamos a obtener el servidor de backup

if [ "${PROYECTO_ORIGEN}" == "main" ] ; then
#- Es un site principal
#- Pero la ruta debe existir en nuestro archivo

LINEA_DB=$( cat ${FICHERO} | grep "^main"  | grep ":${CUENTA_ORIGEN}" )
ERROR_grep=$?

else
#- Es un subdominio.Tendremos un fichero general para subdominios

LINEA_DB=$( cat $FICHERO | grep "^${CUENTA_ORIGEN}"  | grep ":${PROYECTO_ORIGEN}" )
ERROR_grep=$?

fi

SALIDA_get_live_backup_db_data=${ERROR_grep}

if [ "${ERROR_grep}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio Se ha encontrado el proyecto
#----====----====----====----====----====----====----====----====---

#-Obtenemos los parametros del site para hacer el backup
DB_LOCAL=$( echo ${LINEA_DB} | cut -d ":" -f3 )
DB_REMOTA=$( echo ${LINEA_DB} | cut -d ":" -f4 )
SERVER_REMOTO=$( echo ${LINEA_DB} | cut -d ":" -f5 )
CUENTA_DESTINO=$( echo ${LINEA_DB} | cut -d ":" -f6 )
PROYECTO_DESTINO=$( echo ${LINEA_DB} | cut -d ":" -f7 )

## echo "Origen : ${CUENTA_ORIGEN} - ${PROYECTO_ORIGEN}"
## echo "Destino: ${CUENTA_DESTINO} - ${PROYECTO_DESTINO}"

if [ "${CUENTA_DESTINO}" == "" ] ; then
CUENTA_DESTINO=${CUENTA_ORIGEN}
fi

if [ "${PROYECTO_DESTINO}" == "" ] ; then
PROYECTO_DESTINO=${PROYECTO_ORIGEN}
fi

#-Vamos a obtener la informacion de los servidores local y remoto

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

get_server_params ${SERVER_REMOTO}

get_nombre_servidor_local

SALIDA_get_live_backup_db_data=${SALIDA_get_server_params}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_get_server_params}" == "0" ] ; then
#------======------======------======------======------======------=
#----- [2] Inicio Parametros servidor correctos
#------======------======------======------======------======------=

#-Le insertamos db a la ruta del servidor
#-Tenemos efectos laterales con RUTA_FS_ORIGEN

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

#-Ahora accedemos a la ruta de backup del servidor
get_path_for_live_backup ${CUENTA_ORIGEN} ${PROYECTO_ORIGEN} 
SALIDA_get_live_backup_db_data=${SALIDA_get_path_for_live_backup}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_get_path_for_live_backup}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [3] Inicio Recuperacion ruta origen
#--------========--------========--------========--------========---

RUTA_LIVE_FS_ORIGEN=${LIVE_BACKUP_PATH}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

#-Ahora accedemos a la ruta de backup del servidor
#-Aqui igual no existe la ruta actual

## Esta no se puede usar pues no tiene por que existir la ruta en local
#  get_path_for_live_backup 
#- Debe obtener el path remoto - es live backup

get_path_site ${CUENTA_DESTINO} ${PROYECTO_DESTINO} 
SALIDA_get_live_backup_db_data=${SALIDA_get_path_site}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Definida tambien RUTA_FS_DESTINO /home/cuenta/www/fs
RUTA_LIVE_FS_DESTINO=${RUTA_get_path_site}

if [ "${SALIDA_get_path_for_live_backup}" == "0" ] ; then
#----------==========----------==========----------==========-------
#----- [4] Inicio Recuperacion ruta destino
#----------==========----------==========----------==========-------

#-Funcion correcta

MOTIVO_FUNCION="Ruta obtenida de forma correcta"
PARAMETROS_MOTIVO_01="Parametros : ${RUTA_LIVE_FS_DESTINO}"

else

MOTIVO_FUNCION="Error al obtener la ruta destino"
PARAMETROS_MOTIVO_01="Parametros : ${CUENTA_DESTINO} ${PROYECTO_DESTINO}"


#----------==========----------==========----------==========-------
#----- [4] Fin Recuperacion ruta destino
#----------==========----------==========----------==========-------
fi
else

MOTIVO_FUNCION="Error al obtener la ruta origen"
PARAMETROS_MOTIVO_01="Parametros : ${CUENTA_ORIGEN} ${PROYECTO_ORIGEN}"

#--------========--------========--------========--------========---
#----- [3] Inicio Recuperacion ruta origen
#--------========--------========--------========--------========---
fi
else

MOTIVO_FUNCION="Error al obtener los datos del servidor"
PARAMETROS_MOTIVO_01="Parametros : ${SERVER_REMOTO}"

#------======------======------======------======------======------=
#----- [2] Fin Parametros servidor correctos
#------======------======------======------======------======------=
fi
else

MOTIVO_FUNCION="Error al obtener los datos del proyecto"
PARAMETROS_MOTIVO_01="Parametros : ${CUENTA_ORIGEN}  ${PROYECTO_ORIGEN}"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin Se ha encontrado el proyecto
#----====----====----====----====----====----====----====----====---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_get_live_backup_db_data}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_get_live_backup_db_data}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_get_live_backup_db_data}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_get_live_backup_db_data}
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
