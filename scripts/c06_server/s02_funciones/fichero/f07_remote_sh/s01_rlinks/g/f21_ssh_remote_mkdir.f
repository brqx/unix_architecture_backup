#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.2"          #  Version del Script actual
FECHA_SCRIPT="Abril 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="alias"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Script ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- ssh_mkdir
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Crea una carpeta en un servidor remoto
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T crea carpeta ssh servidor remoto
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [usuario] [servidor] [puerto] [dest] ficheros 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E ssh_mkdir ibm core 22 ruta_carpeta -- Crea una carpeta en el servidor indicado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

ssh_mkdir()
{
IS_ssh_mkdir="Crea una carpeta en servidor remoto"
INFO_SCRIPT=${IS_ssh_mkdir}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_ssh_mkdir=${INFO_SCRIPT}

USUARIO_CONEXION=${1}
SERVER=${2}
PORT=${3}
RUTA_DESTINO=${4}

SALIDA_ssh_mkdir=0

NOMBRE_SCRIPT_ssh_mkdir=ssh_mkdir
PARAMETROS_SCRIPT_ssh_mkdir="[usuario] [servidor] [puerto] [ruta_dest]"


if [ "${USUARIO_CONEXION}" == "" ]; then
	USUARIO_CONEXION=ibm
fi  

if [ "${SERVER}" == "" ]; then
	SERVER=frontal
fi  

if [ "${PORT}" == "" ]; then
	PORT=22
fi  

if [ "${RUTA_DESTINO}" == "" ]; then
	USUARIO_CONEXION="-?"
fi  

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${USUARIO_CONEXION}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_ssh_mkdir} ${PARAMETROS_SCRIPT_ssh_mkdir}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Al crearse con -p se generara tanto si existe como si no
##echo "Creando ruta remota : ${RUTA_DESTINO} "

ssh -oPort=${PORT} ${USUARIO_CONEXION}@${SERVER} " echo \" mkdir ${RUTA_DESTINO} \"  && mkdir -p ${RUTA_DESTINO}" &> /dev/null
ERROR_ssh=$?

SALIDA_ssh_chown=${ERROR_ssh}

if [ "${ERROR_ssh}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio Generacion de nueva ruta
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Ruta creada correctamente"
else
MOTIVO_FUNCION="Error al crear la ruta"

#--------========--------========--------========--------========---
#----- [1] Fin Generacion de nueva ruta
#--------========--------========--------========--------========---
fi

#-Parametros comunes
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Ruta       : ${RUTA_DESTINO}"

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_ssh_mkdir}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_ssh_mkdir}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_ssh_mkdir}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_ssh_mkdir}
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
