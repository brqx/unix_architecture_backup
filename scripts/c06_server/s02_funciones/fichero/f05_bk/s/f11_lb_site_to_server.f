#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.6"          #  Version del Script actual
FECHA_SCRIPT="Mayo 2012"
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
#-- lb_site_to_server_force
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
#E lb_site_to_server_force rct -- Hace un backup del site rct
#-------------------------------------------------------------------
#E lb_site_to_server_force za parques zb  -- Hace un live backup del site za:parques en zb
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-alias lb_site_to_server
#-mini alias lbs
lb_site_to_server_force()
{
IS_lb_site_to_server_force="Live Backup site en servidor destino."
INFO_SCRIPT=${IS_lb_site_to_server_force}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_lb_site_to_server_force=${INFO_SCRIPT}

CUENTA_ORIGEN=${1}
PROYECTO_ORIGEN=${2}

SALIDA_lbs_site_to_server_force=0

NOMBRE_SCRIPT_lb_site_to_server_force=lb_site_to_server_force
PARAMETROS_SCRIPT_lb_site_to_server_force="cuenta_origen [proyecto_origen] [cuenta_destino] [proyecto_destino]"

if [ "${CUENTA_ORIGEN}" == "" ]; then
## Activamos un usuario por defecto
CUENTA_ORIGEN=-?
fi  

if [ "${PROYECTO_ORIGEN}" == "" ]; then
## Activamos un proyecto por defecto
PROYECTO_ORIGEN=main
fi  

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${CUENTA_ORIGEN}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_lb_site_to_server_force} ${PARAMETROS_SCRIPT_lb_site_to_server_force}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------
#-Almacenamos la ruta previa al backup
RUTA_ACTUAL_BK=${PWD}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

#-Obtenemos informacion para hacer el LIVE backup
#-Si no existe la cuenta debe informarlo

get_live_backup_db_data ${CUENTA_ORIGEN}  ${PROYECTO_ORIGEN}
SALIDA_lb_site_to_server_force=${SALIDA_get_live_backup_db_data}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_get_live_backup_db_data}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Datos para Live Backup obtenidos correctamente
#----====----====----====----====----====----====----====----====---

echo "-- ${USUARIO_CONEXION} ${SERVER} ${PORT}  "
echo "File System Force: "
echo "-origen - ${RUTA_LIVE_FS_ORIGEN}		"
echo "-destino- ${RUTA_LIVE_FS_DESTINO}		"
echo "Data Base Force: "
echo "-origen - ${DB_LOCAL}		"
echo "-destino- ${DB_REMOTA}		"

#-- Parece que no hace la copia bien ya que copia la carpeta tb

#   /home/zd/www/brqxng/proyectos/colecciones/palillos/ 
#   /home/za/www/brqxng/proyectos/colecciones/caramelos/

##- necesitamos la ruta

#   /home/za/www/brqxng/proyectos/colecciones/caramelos/

RUTA_LIVE_FS_DESTINO_CORTA=$(dirname ${RUTA_LIVE_FS_DESTINO}  )


let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

czf_path_to_server ${USUARIO_CONEXION} ${SERVER} ${PORT} ${RUTA_LIVE_FS_ORIGEN} ${RUTA_LIVE_FS_DESTINO} 

SALIDA_lb_site_to_server_force=${SALIDA_czf_path_to_server}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_czf_path_to_server}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [2] Inicio Copia FS correcta
#--------========--------========--------========--------========---

#- Veamos como ajustamos la ruta

#   /home/zd/www/brqxng/proyectos/colecciones/palillos/ 
#   /home/za/www/brqxng/proyectos/colecciones/caramelos/

##- necesitamos la ruta

#   /home/za/www/brqxng/proyectos/colecciones/caramelos/

BASE_ORIGEN=$(basename ${RUTA_LIVE_FS_ORIGEN}  )

RUTA_LIVE_FS_DESTINO_CREADA=${RUTA_LIVE_FS_DESTINO}${BASE_ORIGEN}
RUTA_LIVE_FS_DESTINO_FINAL=${RUTA_LIVE_FS_DESTINO_CORTA}/copy_${BASE_ORIGEN}

## echo "Se ha debido crear      : ${RUTA_LIVE_FS_DESTINO_CREADA}"
## echo "Se debe mover a la ruta : ${RUTA_LIVE_FS_DESTINO_FINAL}"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

ssh_mvdir ${USUARIO_CONEXION} ${SERVER} ${PORT} ${RUTA_LIVE_FS_DESTINO_CREADA} ${RUTA_LIVE_FS_DESTINO_FINAL} &> /dev/null
SALIDA_lb_site_to_server_force=${SALIDA_ssh_mvdir}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_ssh_mvdir}" == "0" ] ; then
#----------==========----------==========----------==========-------
#----- [3] Inicio Gestion Move Puntual
#----------==========----------==========----------==========-------


#-Eliminamos : #   /home/za/www/brqxng/proyectos/colecciones/caramelos/
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

#-Aqui hay que ver lo que hacemos si no existe - en principio nada
ssh_rmdir ${USUARIO_CONEXION} ${SERVER} ${PORT} ${RUTA_LIVE_FS_DESTINO} &> /dev/null
SALIDA_lb_site_to_server_force=${SALIDA_rmdir}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_ssh_mvdir}" == "0" ] ; then
#------------============------------============------------=======
#----- [4] Inicio Gestion Borrado
#------------============------------============------------=======

#-- El problema es que lo copia con la carpeta inclusive
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

ssh_mvdir ${USUARIO_CONEXION} ${SERVER} ${PORT} ${RUTA_LIVE_FS_DESTINO_FINAL} ${RUTA_LIVE_FS_DESTINO} &> /dev/null
SALIDA_lb_site_to_server_force=${SALIDA_ssh_mvdir}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_ssh_mvdir}" == "0" ] ; then
#--------------==============--------------==============-----------
#----- [5] Inicio Gestion Move Final
#--------------==============--------------==============-----------

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

#-Hay que cambiar los permisos tambien
ssh_chown ${USUARIO_CONEXION} ${SERVER} ${PORT} ${RUTA_LIVE_FS_DESTINO} ${CUENTA_DESTINO} &> /dev/null
SALIDA_lb_site_to_server_force=${SALIDA_ssh_chown}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_ssh_chown}" == "0" ] ; then
#----------------================----------------================---
#----- [6] Inicio Gestion Cambio Permisos
#----------------================----------------================---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

#-Copiariamos la BD - No Respeta la que hay
#--- FALTA REVISAR ESTA PARTE

dbr_copy_force ${USUARIO_CONEXION} ${SERVER} ${PORT} ${DB_LOCAL} ${DB_REMOTA}

SALIDA_lb_site_to_server_force=${SALIDA_dbr_copy_force}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_dbr_copy_force}" == "0" ] ; then
#------------------==================------------------=============
#----- [7] Inicio Gestion Copia DB
#------------------==================------------------=============
MOTIVO_FUNCION="Copia Correcta"

else

MOTIVO_FUNCION="Error al copiar la BD"
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Base Datos : ${DB_LOCAL} ${DB_REMOTA}"
#------------------==================------------------=============
#----- [7] Fin Gestion Copia BBDD 
#------------------==================------------------=============
fi
else
MOTIVO_FUNCION="Error al cambiar usuario en servidor"
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Ruta       : ${RUTA_LIVE_FS_DESTINO}"
PARAMETROS_MOTIVO_03="Usuario    : ${CUENTA_DESTINO}"
#----------------================----------------================---
#----- [6] Fin Gestion Cambio Permisos
#----------------================----------------================---
fi
else
MOTIVO_FUNCION="Error al mover la ruta destino"
PARAMETROS_MOTIVO_01="Parametros  : ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Ruta Origen : ${RUTA_LIVE_FS_DESTINO_FINAL}"
PARAMETROS_MOTIVO_03="Ruta Destino: ${RUTA_LIVE_FS_DESTINO}"

#--------------==============--------------==============-----------
#----- [5] Fin Gestion Move Final
#--------------==============--------------==============-----------
fi
else

MOTIVO_FUNCION="Error al eliminar la ruta destino"
PARAMETROS_MOTIVO_01="Parametros  : ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Ruta Destino: ${RUTA_LIVE_FS_DESTINO}"

#------------============------------============------------=======
#----- [4] Fin Gestion Borrado
#------------============------------============------------=======
fi
else
MOTIVO_FUNCION="Error al hacer el move puntual en ruta destino"
PARAMETROS_MOTIVO_01="Parametros  : ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Ruta Origen : ${RUTA_LIVE_FS_DESTINO_CREADA}"
PARAMETROS_MOTIVO_03="Ruta Destino: ${RUTA_LIVE_FS_DESTINO_FINAL}"

#----------==========----------==========----------==========-------
#----- [3] Fin Gestion Move Puntual
#----------==========----------==========----------==========-------
fi
else


MOTIVO_FUNCION="Error al copiar el Sistema"
PARAMETROS_MOTIVO_01="Parametros  : ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Ruta Origen : ${RUTA_LIVE_FS_ORIGEN}  "
PARAMETROS_MOTIVO_03="Ruta Destino: ${RUTA_LIVE_FS_DESTINO} "

#------======------======------======------======------======------=
#----- [2] Fin Copia FS correcta
#------======------======------======------======------======------=
fi
else

MOTIVO_FUNCION="Error al obtener los datos para la copia"
PARAMETROS_MOTIVO_01="Parametros : ${CUENTA_ORIGEN}  ${PROYECTO_ORIGEN}"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin Datos para Live Backup obtenidos correctamente
#----====----====----====----====----====----====----====----====---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_lb_site_to_server_force}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_lb_site_to_server_force}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_lb_site_to_server_force}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

#- Volvemos a la ruta guardada
cd ${RUTA_ACTUAL_BK}

return ${SALIDA_lbs_site_to_server_force}

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
