#!/bin/bash 
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
LEVEL_NIVEL_05=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="control"
CONCEPT_LEVEL_05="Script $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- process_control
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Control de los procesos del sistema
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T test control servidor procesos
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P url
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E process_control brqxng.com --> informa de los procesos que estan corriendo
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

process_control()
{

#Script to control phising in servers
NUM_PROCESS=$(ps -eaf | wc -l )

NUM_EXIM_PROCESS=$(ps -eaf | grep exim | wc -l )

NUM_PHP_PROCESS=$(ps -eaf | grep php | wc -l )

NUM_JAVA_PROCESS=$(ps -eaf | grep java | wc -l )

NUM_APACHE_PROCESS=$(ps -eaf | grep httpd | wc -l )

NUM_MYSQL_PROCESS=$(ps -eaf | grep mysql | wc -l )

NUM_VARNISH_PROCESS=$(ps -eaf | grep varnish | wc -l )

CADENA_NUM="TOT=${NUM_PROCESS}:EXIM=${NUM_EXIM_PROCESS}:PHP=${NUM_PHP_PROCESS}:WEB=${NUM_APACHE_PROCESS}"
# Comenzamos el control

#- Limete de control de procesos por servidor PROCESS_SERVER_MAX=400

PROCESS_SERVER_MAX=400

EXIM_SERVER_MAX=2

APACHE_SERVER_MAX=50

PHP_SERVER_MAX=50

JAVA_SERVER_MAX=5

MYSQL_SERVER_MAX=3

#- Preparamos variable de control de estado
DANGER=0

if [ ${NUM_PROCESS} -gt ${PROCESS_SERVER_MAX} ] ;  then
DANGER=1
TXT_DANGER="${TXT_DANGER}: Superado el limite de procesos por servidor "
fi

if [ ${NUM_EXIM_PROCESS} -gt ${EXIM_SERVER_MAX} ] ;  then
DANGER=1
TXT_DANGER="${TXT_DANGER}:Limite de Exim fuera de control "
fi

if [ ${NUM_APACHE_PROCESS} -gt ${APACHE_SERVER_MAX} ] ;  then
DANGER=1
TXT_DANGER="${TXT_DANGER}: Demasiadas instancias Apache"
fi

if [ ${NUM_JAVA_PROCESS} -gt ${JAVA_SERVER_MAX} ] ;  then
DANGER=1
TXT_DANGER="${TXT_DANGER}: Demasiadas instancias Apache"
fi

if [ ${NUM_MYSQL_PROCESS} -gt ${MYSQL_SERVER_MAX} ] ;  then
DANGER=1
TXT_DANGER="${TXT_DANGER}: Demasiadas instancias Apache"
fi

# Testing process

if [ "${DANGER}" == "0" ] ; then
echo "Servidor estable."
echo "${CADENA_NUM}"
else
echo "ALERT - Too many processes FBRQX on:  $(date) $(who)"
echo "ALERT - Too many processes FBRQX : ${CADENA_NUM} ${TXT_DANGER}   " | mail \
-s "Alert FBRQX: Too many processes ${NUM_PROCESS}" \
alerts@unixy.es

}

#-------------------------------------------------------------------

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
