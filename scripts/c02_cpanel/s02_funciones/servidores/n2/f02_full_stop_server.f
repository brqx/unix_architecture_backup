#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Diciembre 2012"
STATUS_SCRIPT="development"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="cpanel"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="servidores"
CONCEPT_VARIANTE_04=""
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- full_stop_server
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Parada de un servidor de forma segura y con chequeos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T linux stop server sure seguro checking
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [-?]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E full_stop_server  	-- Inicio seguro completo del servidor
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

full_stop_server()
{
IS_full_stop_server="Para servicios del servidor de forma segura y comprobando"
INFO_SCRIPT=${IS_full_stop_server}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_full_stop_server=${INFO_SCRIPT}

ID_WAS=${1}

SALIDA_full_stop_server=0

NOMBRE_SCRIPT_full_stop_server=full_stop_server
PARAMETROS_SCRIPT_full_stop_server="[-?]"


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${ID_WAS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_full_stop_server} ${PARAMETROS_SCRIPT_full_stop_server}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Vaciar logs de BBDD
#-- [*] Exportar BBDD ( lo puede hacer la parada de mysql - piensa que es la ultima )
#-- [*] Aqui habria que preparar live and dead backups
#-- [2] Parar servicios
#-- [3] Comprobar parada correcta
#-- [4] Vaciar logs de SISTEMA
#-- [5] Enviar correo con informacion de estado
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
clean_db_logs
SALIDA_full_stop_server=${SALIDA_clean_db_logs}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--



let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
full_dead_backup_server
SALIDA_full_stop_server=${SALIDA_full_dead_backup_server}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Esta funcion puede depender de muchas cosas
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
full_live_backup_server
SALIDA_full_stop_server=${SALIDA_full_live_backup_server}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_clean_db_logs}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio chequeo logs BBDD
#----====----====----====----====----====----====----====----====---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
full_stop_services_server 
SALIDA_full_stop_server=${SALIDA_full_stop_services_server}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_full_stop_services_server}" == "0" ] ; then
#------======------======------======------======------======------=
#----- [2] Inicio arranque de los servicios
#------======------======------======------======------======------=

#-Chequea y envia correo correspondiente

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
check_server_status_stop
SALIDA_full_stop_server=${SALIDA_check_server_status_stop}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_check_server_status_stop}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [3] Inicio comprobacion servicios
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
clean_system_logs
SALIDA_full_stop_server=${SALIDA_clean_system_logs}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_clean_system_logs}" == "0" ] ; then
#----------==========----------==========----------==========-------
#----- [4] Inicio limpieza logs sitema
#----------==========----------==========----------==========-------

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
send_status_server_mail
SALIDA_full_stop_server=${SALIDA_send_status_server_mail}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_send_status_server_mail}" == "0" ] ; then
#------------============------------============------------=======
#----- [5] Inicio envio correo
#------------============------------============------------=======

MOTIVO_FUNCION="Inicio Correcto. Chequeo correcto. Envio correo."
PARAMETROS_MOTIVO_01="Servidor    : ${SERVER}"

else

MOTIVO_FUNCION="Error en el envio del correo."
#-Los parametros han debido ser identificados previamente en el chequeo del servidor

#------------============------------============------------=======
#----- [5] Fin envio correo
#------------============------------============------------=======
fi
else
MOTIVO_FUNCION="Error en limpieza logs del servidor."

#----------==========----------==========----------==========-------
#----- [4] Fin limpieza logs sitema
#----------==========----------==========----------==========-------
fi
else

MOTIVO_FUNCION="Fallos en la comprobacion de servicios."

#--------========--------========--------========--------========---
#----- [3] Fin comprobacion servicios
#--------========--------========--------========--------========---
fi
else

MOTIVO_FUNCION="Problemas en el arranque de los servicios."

#------======------======------======------======------======------=
#----- [2] Fin Arranque de los servicios
#------======------======------======------======------======------=
fi
else

MOTIVO_FUNCION="Error al vaciar la BBDD"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin chequeo logs BBDD
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_full_stop_server}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_full_stop_server}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_full_stop_server}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_full_stop_server}
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

