#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2010
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2010"
#-==================================================================
#+ Funciones:
#-------------------------------------------------------------------
#-Ej: wps_pid --> Obtiene los PID de los procesos WAS
#
#- Lo obtenemos tanto del startServer.log como del SystemOut.log
# 
#-------------------------------------------------------------------

wps_pid()
{
INFO_SCRIPT="Obtenemos el PID del WAS con un perfil indicado (Basado en los logs)"


# Le pasamos como parametro el numero de perfil - segun arquitectura

PERFIL_PASADO=$1 ;

case ${PERFIL_PASADO} in
'1' )
PERFIL_WPS=${PERFIL_01}
;;
'2' )
PERFIL_WPS=${PERFIL_02}
;;
'3' )
PERFIL_WPS=${PERFIL_03}
;;
'4' )
PERFIL_WPS=${PERFIL_04}
;;
* )
#- Configuracion del perfil por defecto
PERFIL_WPS=${PERFIL_01}

#Rutas por defecto
RUTA_PROCESS_ERRORLOG=${WPS_LOGS}
RUTA_PROCESS_STARTLOG=${WPS_STARTLOGS}

;;
esac

RUTA_WPS=${WPS_PF}${PERFIL_WPS}

#- Ajustamos las variables a los archivos
RUTA_PROCESS_ERRORLOG=${RUTA_WPS}/logs/server1/SystemOut.log
RUTA_PROCESS_STARTLOG=${RUTA_WPS}/logs/server1/startServer.log

#- Gestionamos que no existan los ficheros o rutas
ls -la ${RUTA_PROCESS_ERRORLOG} > /dev/null 2> /dev/null

if [ "$?" -eq "0" ] ; then
#- Si existen los ficheros
## En scripts, al poner un separador de barra hay que escaparlo, por tanto serian 4 barras

LINEA_PROCESS_ERRORLOG=`cat ${RUTA_PROCESS_ERRORLOG} | grep "process id" | tail -1`
LINEA_PROCESS_STARTLOG=`cat ${RUTA_PROCESS_STARTLOG} | grep "process id" | tail -1`

PID_PROCESS_ERRORLOG=`echo ${LINEA_PROCESS_ERRORLOG} | cut -d "\\\\" -f3- | cut -d " " -f5`
PID_PROCESS_STARTLOG=`echo ${LINEA_PROCESS_STARTLOG} | cut -d ";" -f2-  | cut -d " " -f5`

#- En el SystemOut no tenemos la hora
FECHA_PROCESS_STARTLOG=`echo ${LINEA_PROCESS_STARTLOG}  | cut -d "[" -f2 | cut -d " " -f1,2`

# Vamos a verificar que el proceso estárrancado

LINEA_PS_PID=`ps -eaf | grep ${PID_PROCESS_ERRORLOG} | grep -v "grep"`

#- Si existe el proceso lo indicamos

if [ "$?" -eq "0" ] ; then 
HORA_LINEA_PS=`echo ${LINEA_PS_PID} | tr -s " " | cut -d " " -f7 `
PROCESO_EXISTE="Servidor iniciado : ${HORA_LINEA_PS}"
else
#- En este caso el proceso no esta arrancado
PROCESO_EXISTE="Servidor no iniciado"

fi


else
#- No existen los ficheros
PID_PROCESS_ERRORLOG="No existe el fichero ${RUTA_PROCESS_ERRORLOG}"
PID_PROCESS_STARTLOG="No existe el fichero ${RUTA_PROCESS_STARTLOG}"

#- En el SystemOut no tenemos la hora
FECHA_PROCESS_STARTLOG="NO HAY FECHA"

fi


echo "-----------------------------------------------"
echo "Perfil : ${PERFIL_WPS} - ${RUTA_WPS}           " 
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo "Inicio del servidor  : ${FECHA_PROCESS_STARTLOG}"
echo "Estado del servidor  : ${PROCESO_EXISTE}       "
echo "PID from startServer : ${PID_PROCESS_STARTLOG} "
echo "PID from SystemOut   : ${PID_PROCESS_ERRORLOG} "
echo "-----------------------------------------------"

}


