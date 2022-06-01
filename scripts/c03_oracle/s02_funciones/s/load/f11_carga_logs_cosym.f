#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Junio 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="oracle"
CONCEPT_MOLDE_05="alias"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Script ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- sql_loader
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - ssh_rmdir 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Cambia permisos en una ruta en servidor remoto
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T cambia permisos ruta ssh servidor remoto
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [usuario] [servidor] [puerto] RUTA_DESTINO
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E sql_remote_loader ibm core 22 ruta  -- Cambia los permisos en la ruta remota
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

carga_logs_mapfre()
{
IS_carga_logs_mapfre="Procesa logs de monitorizacion de un servidor local"
INFO_SCRIPT=${IS_carga_logs_mapfre}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_carga_logs_mapfre=${INFO_SCRIPT}

FILTRO_LOGS=${1}
CONEXION_BD=${2}
SCRIPT_BD=${3}
CONTROL_BD=${4}
RUTA_DESTINO=${5}

NOMBRE_CONTROL=Carga_LOG_Servicios_ARQoS.ctl


SALIDA_carga_logs_mapfre=0

NOMBRE_SCRIPT_carga_logs_mapfre=carga_logs_mapfre
PARAMETROS_SCRIPT_carga_logs_mapfre="FILTRO [CONEXION] [SCRIPT_BD] [RUTA_LOGS]"

if [ "${FILTRO_LOGS}" == "" ]; then
FILTRO_LOGS="MONSE_*.log"
fi  

if [ "${CONEXION_BD}" == "" ]; then
CONEXION_BD="cosym/cosym"
fi  

if [ "${SCRIPT_BD}" == "" ]; then
SCRIPT_BD=Call_Proceso_ETL_Carga.sql
fi

if [ "${CONTROL_BD}" == "" ]; then
CONTROL_BD=Carga_LOG_Servicios_ARQoS.ctl
fi


if [ "${RUTA_CARGA_LOCAL}" == "" ]; then
RUTA_DESTINO="/tmp/LOGS_ARQOS/monitoring/"
fi  


if [ "${RUTA_DESTINO}" == "" ]; then
	RUTA_DESTINO="-?"
fi  

if [ "${FILTRO_LOGS}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_carga_logs_mapfre} ${PARAMETROS_SCRIPT_carga_logs_mapfre}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar entorno
#-- [2] Procesar los ficheros temporalmente y eliminarlos
#-- [3] Cargar todos los fichero preprocesados en BD
#--------========--------========--------========--------========---

#--------========--------========--------========--------========---
# running Oracle 8 (or above) on a Unix platform:
#-------------------------------------------------------------------
#-- 0 = Successful
#-- 1 = Unrecoverable failure
#-- 2 = At least one row rejected
#-- 3 = O/S Errors
#--------========--------========--------========--------========---

which sqlplus > /dev/null
sqlplus_ok=$?

which sqlldr > /dev/null
sqlldr_ok=$?

#-Preproceso de parametros

#-Debe existir el procesador SQL

if [ "${sqlplus_ok}" == "0" -a "${sqlldr_ok}" -eq "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio ordenes sql disponibles
#----====----====----====----====----====----====----====----====---

if [ -f ${SCRIPT_BD} -a -f ${CONTROL_BD}  ] ; then
#------======------======------======------======------======------=
#------- [2] Inicio chequeo Script BBDD
#------======------======------======------======------======------=

#-Debe existir sqlplus y sqlldr en el path

echo "-------------------- Inicio Procesamiento de los logs --------------------"

for file in $(find ${RUTA_DESTINO} -type f -name ${FILTRO_LOGS}) ; do
#------++++++------++++++------++++++------++++++------++++++------+
#--------- [3] Inicio iteracion entre los archivos - no importa que falle
#------++++++------++++++------++++++------++++++------++++++------+

if [ -f ${file} ]; then
#--------========--------========--------========--------========---
#------------ [4] Inicio proceso de uno de los logs
#--------========--------========--------========--------========---
echo "------ Comienzo Proceso fichero ${file}"
sqlldr userid=${CONEXION_BD} CONTROL=${NOMBRE_CONTROL} DATA=${file} LOG=${file}.LOG BAD=${file}.BAD skip=0 DIRECT=TRUE
salida_sqlldr=$?

SALIDA_carga_logs_mapfre=${salida_sqlldr}

#- Tanto si es 0 como si es 2 lo damos por valido
if [ ${salida_sqlldr} -eq 0 -o ${salida_sqlldr} -eq 2 ]; then
#---------=========---------=========---------=========---------====
#-------------- [5] Inicio proceso resultado carga log
#---------=========---------=========---------=========---------====
	MOTIVO_FUNCION="Proceso correcto"
	PARAMETROS_MOTIVO_01="Conexion: ${CONEXION_BD} "
	PARAMETROS_MOTIVO_02="Fichero : ${file}        "
 	echo "Borramos : rm ${file}"
else
	MOTIVO_FUNCION="Proceso erroneo - Fallo al cargar el archivo"
	PARAMETROS_MOTIVO_01="Conexion: ${CONEXION_BD} "
	PARAMETROS_MOTIVO_02="Fichero : ${file}        "
	echo "----- Error de sqlldr al cargar File ${file}, log en ${file}.log -"
#---------=========---------=========---------=========---------====
#-------------- [5] Fin proceso resultado carga log
#---------=========---------=========---------=========---------====
fi
else
	MOTIVO_FUNCION="Proceso erroneo - Fichero no existe o no hay permisos"
	PARAMETROS_MOTIVO_01="Conexion: ${CONEXION_BD} "
	PARAMETROS_MOTIVO_02="Fichero : ${file}        "
	echo "------ Files ${file} does not exists"
#--------========--------========--------========--------========---
#------------ [4] Fin proceso de uno de los logs
#--------========--------========--------========--------========---
fi
#------++++++------++++++------++++++------++++++------++++++------+
#--------- [3] Fin iteracion entre los archivos - no importa que falle
#------++++++------++++++------++++++------++++++------++++++------+
done

echo "-------------------- Fin Procesamiento de los logs --------------------"

#- La validacion de registros la hacemos sólo si todo ha ido bien

sqlplus ${CONEXION_BD} @${SCRIPT_BD}
salida_sqlplus=$?

SALIDA_carga_logs_mapfre=${salida_sqlplus}

if [ ${salida_sqlplus} -eq 0  ] ; then
#---------=========---------=========---------=========---------====
#--------- [3] Inicio proceso resultado sqlplus
#---------=========---------=========---------=========---------====
	MOTIVO_FUNCION="Proceso correcto"
	PARAMETROS_MOTIVO_01="Conexion          : ${CONEXION_BD} "
	PARAMETROS_MOTIVO_02="Script Consulta BD: ${SCRIPT_BD}   "
	PARAMETROS_MOTIVO_03="Script Control BD : ${CONTROL_BD}   "
	PARAMETROS_MOTIVO_04="Fichero log       : ${file}         "

else
	MOTIVO_FUNCION="Proceso erroneo - Fallo al cargar los datos"
	PARAMETROS_MOTIVO_01="Conexion          : ${CONEXION_BD} "
	PARAMETROS_MOTIVO_02="Script Consulta BD: ${SCRIPT_BD}   "
	PARAMETROS_MOTIVO_03="Script Control BD : ${CONTROL_BD}   "
	PARAMETROS_MOTIVO_04="Fichero log       : ${file}         "
#---------=========---------=========---------=========---------====
#--------- [3] Fin proceso resultado sqlplus
#---------=========---------=========---------=========---------====
fi
else
	MOTIVO_FUNCION="Proceso erroneo - Fallo al localizar Script de BD"
	PARAMETROS_MOTIVO_01="Conexion          : ${CONEXION_BD} "
	PARAMETROS_MOTIVO_02="Script Consulta BD: ${SCRIPT_BD}   "
	PARAMETROS_MOTIVO_03="Script Control BD : ${CONTROL_BD}   "

	SALIDA_carga_logs_mapfre=4

#------======------======------======------======------======------=
#------- [2] Fin chequeo Script BBDD
#------======------======------======------======------======------=
fi
else
	MOTIVO_FUNCION="Proceso erroneo - Entorno Oracle no cargado. No se localiza sqlplus"
	PARAMETROS_MOTIVO_01="Conexion          : ${CONEXION_BD} "
	PARAMETROS_MOTIVO_02="Script Consulta BD: ${SCRIPT_BD}   "
	PARAMETROS_MOTIVO_03="Script Control BD : ${CONTROL_BD}   "

	SALIDA_carga_logs_mapfre=5

#----====----====----====----====----====----====----====----====---
#----- [1] Fin ordenes sql disponibles
#----====----====----====----====----====----====----====----====---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_carga_logs_mapfre}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_carga_logs_mapfre}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_carga_logs_mapfre}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_carga_logs_mapfre}
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
