#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.2"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="alias"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Script ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- ssh_mvdir
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Mueve una ruta en servidor remoto
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T mueve mover ruta ssh servidor remoto
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [usuario] [servidor] [puerto] RUTA_ORIGEN RUTA_DESTINO
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E ssh_mvdir ibm core 22 -- Genera enlace simbolico en destino
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

ssh_mvdir()
{
IS_ssh_mvdir="Mueve una ruta en servidor remoto"
INFO_SCRIPT=${IS_ssh_mvdir}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_ssh_mvdir=${INFO_SCRIPT}

USUARIO_CONEXION=${1}
SERVER=${2}
PORT=${3}
RUTA_ORIGEN=${4}
RUTA_DESTINO=${5}

SALIDA_ssh_mvdir=0

NOMBRE_SCRIPT_ssh_mvdir=ssh_mvdir
PARAMETROS_SCRIPT_ssh_mvdir="[usuario] [servidor] [puerto] [ruta_origen] [ruta_dest]"


if [ "${USUARIO_CONEXION}" == "" ]; then
	USUARIO_CONEXION=ibm
fi  

if [ "${SERVER}" == "" ]; then
	SERVER=frontal
fi  


if [ "${PORT}" == "" ]; then
	PORT=22
fi  

if [ "${RUTA_ORIGEN}" == "" ]; then
	USUARIO_CONEXION="-?"
fi  

if [ "${RUTA_DESTINO}" == "" ]; then
	USUARIO_CONEXION="-?"
fi  


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${USUARIO_CONEXION}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_ssh_mvdir} ${PARAMETROS_SCRIPT_ssh_mvdir}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

##echo "Moviendo ruta remota ${RUTA_ORIGEN} TO ${RUTA_DESTINO} "

ssh -oPort=${PORT} ${USUARIO_CONEXION}@${SERVER} "echo \" mv ${RUTA_ORIGEN} ${RUTA_DESTINO} \"   && mv ${RUTA_ORIGEN} ${RUTA_DESTINO} " &> /dev/null
ERROR_ssh=$?

SALIDA_ssh_mvdir=${ERROR_ssh}

if [ "${ERROR_ssh}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio Cambio de permisos
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Movimiento Correcto"
else
MOTIVO_FUNCION="Error al mover la carpeta"

#--------========--------========--------========--------========---
#----- [1] Fin Cambio de permisos
#--------========--------========--------========--------========---
fi

#-Parametros comunes
PARAMETROS_MOTIVO_01="Parametros  : ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Ruta Origen : ${RUTA_ORIGEN} "
PARAMETROS_MOTIVO_03="Ruta Destino: ${RUTA_DESTINO}"

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_ssh_mvdir}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_ssh_mvdir}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_ssh_mvdir}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_ssh_mvdir}
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
