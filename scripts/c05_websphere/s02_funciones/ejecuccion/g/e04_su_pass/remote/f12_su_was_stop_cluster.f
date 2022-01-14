#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Mayo 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="websphere"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="proceso"
CONCEPT_VARIANTE_04="admin"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- wstop_su_remote_cluster
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- ssh_sudorun
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lanza el wsadmin del websphere indicado
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T was websphere cluster start inicio server
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P ID_SERVER
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wstop_su_remote_cluster soa7a 	-- Lanza el script indicado para el servidor soa7a
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

wstop_su_remote_cluster()
{
IS_wstop_su_remote_cluster="Para un cluster remoto con un solo nodo"
INFO_SCRIPT=${IS_wstop_su_remote_cluster}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_wstop_su_remote_cluster=${INFO_SCRIPT}

ID_WAS=${1}

SALIDA_wstop_su_remote_cluster=0

NOMBRE_SCRIPT_wstop_su_remote_cluster=wstop_su_remote_cluster
PARAMETROS_SCRIPT_wstop_su_remote_cluster="ID_WAS"

if [ "${ID_WAS}" == "" ]; then
	ID_WAS="-?"
fi  

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${ID_WAS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_wstop_su_remote_cluster} ${PARAMETROS_SCRIPT_wstop_su_remote_cluster}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Cargar Datos
#-- [2] Parar Servidor
#-- [3] Parar Nodo
#-- [4] Parar Cluster
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
was_load_parameters_stop ${ID_WAS}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

posiciona "00_RunPmt:Cluster-${SERVER}"

SALIDA_wstop_su_remote_cluster=${SALIDA_was_load_parameters_stop}

if [ "${SALIDA_was_load_parameters_stop}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Carga de datos contra el WAS indicado
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
##echo "ssh_surun ${USUARIO_CONEXION} ${SERVER} ${PORT} ${LINEA_COMANDO_SERVIDOR_01}"
ssh_surun ${USUARIO_CONEXION} ${SERVER} ${PORT} "${LINEA_COMANDO_SERVIDOR_01}"
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
posiciona "01_Stop:Servidor-${SERVER}"

SALIDA_wstop_su_remote_cluster=${SALIDA_ssh_surun}

if [ "${SALIDA_ssh_surun}" == "0" ] ; then
#--------========--------========--------========--------========---
#------- [2] Inicio Manager del WAS
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
##echo "ssh_surun ${USUARIO_CONEXION} ${SERVER} ${PORT} ${LINEA_COMANDO_NODO_01}"
ssh_surun ${USUARIO_CONEXION} ${SERVER} ${PORT} "${LINEA_COMANDO_NODO_01}"
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

posiciona "02_Stop:Nodo-${SERVER}"

SALIDA_wstop_su_remote_cluster=${SALIDA_ssh_surun}

if [ "${SALIDA_ssh_surun}" == "0" ] ; then
#--------========--------========--------========--------========---
#--------- [3] Inicio Nodo del WAS
#--------========--------========--------========--------========---


let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
##echo "ssh_surun ${USUARIO_CONEXION} ${SERVER} ${PORT} ${LINEA_COMANDO_MANAGER}"
ssh_surun ${USUARIO_CONEXION} ${SERVER} ${PORT} "${LINEA_COMANDO_MANAGER}"
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

posiciona "03_Stop:Manager-${SERVER}"

SALIDA_wstop_su_remote_cluster=${SALIDA_ssh_surun}

if [ "${SALIDA_ssh_surun}" == "0" ] ; then
#--------========--------========--------========--------========---
#----------- [4] Inicio Servidor del WAS
#--------========--------========--------========--------========---


MOTIVO_FUNCION="Ejecuccion correcta. Servidor Cluster detenido."

else
MOTIVO_FUNCION="Error al ejecutar el comando"
PARAMETROS_MOTIVO_01="Conexion: ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Comando : ${LINEA_COMANDO_MANAGER}"

#--------========--------========--------========--------========---
#----------- [4] Fin Servidor del WAS
#--------========--------========--------========--------========---
fi
else
MOTIVO_FUNCION="Error al ejecutar el comando"
PARAMETROS_MOTIVO_01="Conexion: ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Comando : ${LINEA_COMANDO_NODO_01}"

#--------========--------========--------========--------========---
#--------- [3] Fin Nodo del WAS
#--------========--------========--------========--------========---
fi
else
MOTIVO_FUNCION="Error al ejecutar el comando"
PARAMETROS_MOTIVO_01="Conexion: ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Comando : ${LINEA_COMANDO_SERVER}"

#--------========--------========--------========--------========---
#------- [2] Fin Manager del WAS
#--------========--------========--------========--------========---
fi
else
MOTIVO_FUNCION="Error al acceder a los datos"
PARAMETROS_MOTIVO_01="Identificador: ${ID_WAS}"

#--------========--------========--------========--------========---
#----- [1] Fin Carga de datos contra el WAS indicado
#--------========--------========--------========--------========---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_wstop_su_remote_cluster}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_wstop_su_remote_cluster}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_wstop_su_remote_cluster}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_wstop_su_remote_cluster}
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

