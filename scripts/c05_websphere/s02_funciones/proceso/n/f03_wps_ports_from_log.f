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
#-Ej: wps_ports  --> Informa de los puertos de la instancia indicada
#
#- Lo obtenemos solo del SystemOut.log
# 
#-------------------------------------------------------------------

#-Esta informacion no es muy buena ya que lo obtenia solo del log entonces si no existe log
# pues no hay informacion
wps_ports_from_log()
{
INFO_SCRIPT="Lista los puertos de un perfil de WAS pasado"

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
## RUTA_PROCESS_ERRORLOG=${WPS_LOGS}

;;
esac

RUTA_WPS=${WPS_PF}${PERFIL_WPS}

#- Ajustamos las variables a los archivos
RUTA_PROCESS_ERRORLOG=${RUTA_WPS}/logs/server1/SystemOut.log

## echo "RUTA WPS : ${RUTA_PROCESS_ERRORLOG}"

#- Eliminamos las excepciones

#- Conector SOAP 

PUERTO_SOAP=`cat ${RUTA_PROCESS_ERRORLOG} |  grep "SOAP connector" | tail -1 | tr -s " " | cut -d " " -f15`
 

#- Conector RMI

PUERTO_RMI=`cat ${RUTA_PROCESS_ERRORLOG} |  grep "RMI Connector" | tail -1   | tr -s " " | cut -d " " -f15`

#- Canales TCP IP

#- WC Adminhost
CANAL_TCP_01=`cat ${RUTA_PROCESS_ERRORLOG} | grep "TCP Channel" | grep "listening" | grep "TCP_1" | \
 grep "is listening" |  tail -1 | tr -s " " | cut -d " " -f18 | cut -d "." -f1`

#- WC defaulthost
CANAL_TCP_02=`cat ${RUTA_PROCESS_ERRORLOG} | grep "TCP Channel" | grep "listening" | grep "TCP_2" | \
 grep "is listening" |  tail -1 | tr -s " " | cut -d " " -f18 | cut -d "." -f1`

#- WC Adminhost Secure
CANAL_TCP_03=`cat ${RUTA_PROCESS_ERRORLOG} | grep "TCP Channel" | grep "listening" | grep "TCP_3" | \
 grep "is listening" |  tail -1 | tr -s " " | cut -d " " -f18 | cut -d "." -f1`

#- WC defaulthost Secure
CANAL_TCP_04=`cat ${RUTA_PROCESS_ERRORLOG} | grep "TCP Channel" | grep "listening" | grep "TCP_4" | \
 grep "is listening" |  tail -1 | tr -s " " | cut -d " " -f18 | cut -d "." -f1`


## SIB_TCP_JFAP
## SIB_TCP_JFAP_SSL

clear
linea_caracter "-="
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo " PUERTOS EN SERVIDOR - ${SERVIDOR} - PERFIL : ${PERFIL_WPS}   "
echo "--------------------------------------------------------------"
echo " ARQUITECTURA BRQX  - 2010 - MAPFRE         "
linea_caracter "-="
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo " "
echo "--------------------------------------------------------------"
echo " Puertos TCP : ${SERVIDOR}::${WPS_HOME}  " 
echo "--------------------------------------------------------------"
echo " Puertos ADMIN : ${CANAL_TCP_01} (http)  -   ${CANAL_TCP_03} (https)    "
echo " Puertos BPC   : ${CANAL_TCP_02} (http)  -   ${CANAL_TCP_04} (https)    "
echo "--------------------------------------------------------------"
echo " Puertos Conexiones RMI / SOAP          " 
linea_caracter "-="
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo " Puerto RMI   : ${PUERTO_RMI}           "
echo " Puerto SOAP  : ${PUERTO_SOAP}            "
echo "--------------------------------------------------------------"

}


