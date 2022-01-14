#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2015
#-------------------------------------------------------------------
VERSION_SCRIPT="1.1" #  Version del Script actual
FECHA_SCRIPT="Mayo 2015"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="websphere"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="logs"
CONCEPT_VARIANTE_04=""
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- control_logs_was
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- f2
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Hace un reporte de problemas en un servidor Websphere
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T logs was control
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E fswas	-- Fast Check Was Common Errors and Subjects
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Fast Check Was - Revisa errores frecuentes en logs
fswas()
{
IS_fswas="Informa de los logs del was y los ordena por fecha"
INFO_SCRIPT=${IS_fswas}

#-Funcion que te muestre los cambios en los logs de un WAS

LINE_NUMBER_OR_FILE_NAME=${1}
FILE_NAME=${2}

#-Si el primer parametro tiene mas de 2 caracteres es un fichero

LEN_LINE_NUMBER=${#LINE_NUMBER_OR_FILE_NAME}

if [ ${LEN_LINE_NUMBER} -gt 2 ] ; then
#-es el nombre de un fichero
FILE_NAME=${LINE_NUMBER_OR_FILE_NAME}

else
#-es un indicador de ocurrencias
LINE_NUMBER=${LINE_NUMBER_OR_FILE_NAME}
fi


if [ "${LINE_NUMBER}" == "" ] ; then
#-Por defecto nos quedamos con 2 apariciones
LINE_NUMBER=2
fi

if [ "${FILE_NAME}" == "" ] ; then
#-Por defecto ponemos el SytemOut
FILE_NAME=SystemOut.log
fi

RUTA_ACTUAL=$PWD

APP_NAME=$(basename $( dirname $(find $PWD -name ${FILE_NAME} ) ) )

#-Errores frecuentes
#- CPU Starvation detected - La CPU se ha quedado frita

#Usara gwas
ERROR_WAS[0]="CPU Starvation detected"
ERROR_WAS[1]="milliseconds and may be hung"
ERROR_WAS[2]="java.lang.OutOfMemoryError"
ERROR_WAS[3]="java.net.SocketTimeoutException"
ERROR_WAS[4]="Connection not available while invoking method createOrWaitForConnection"
ERROR_WAS[5]="javax.servlet.jsp.JspException"
ERROR_WAS[6]="exception is java.net.ConnectException: Connection refused"
ERROR_WAS[7]="Session crossover detected"
ERROR_WAS[8]="com.ibm.websphere.ce.cm.StaleConnectionException"
ERROR_WAS[9]="java.io.IOException: Async IO operation failed"
ERROR_WAS[10]="Connection not available while invoking method createOrWaitForConnection"
ERROR_WAS[11]="FileUploadBase$IOFileUploadException"
ERROR_WAS[12]="javax.naming.NamingException"
ERROR_WAS[13]="java.security.cert.CertPathValidatorException: Certificate chaining error"
ERROR_WAS[14]="SSL HANDSHAKE FAILURE"
ERROR_WAS[15]="First component in name"
ERROR_WAS[16]="Could not resolve view with name"
ERROR_WAS[17]="An attempt is made to stop the I"
ERROR_WAS[18]="open for e-business"
ERROR_WAS[19]="at es.mma"

TEXT_WAS[0]="CPU Frita. Degradacion de performance [WAS]"
TEXT_WAS[1]="Hebras colgadas [WAS]"
TEXT_WAS[2]="Memoria a tope [WAS]"
TEXT_WAS[3]="Comunicacion rota  [WAS]"
TEXT_WAS[4]="Pool JCA? lleno  [WAS]"
TEXT_WAS[5]="Error de codigo en un JSP ?   [DESA]"
TEXT_WAS[6]="Se ha intentado una conexion pero el extremo no tiene el puerto [SE]"
TEXT_WAS[7]="Sesiones cruzadas [DESA]"
TEXT_WAS[8]="Errores de socket. Problemas con una cola ?  [WAS]"
TEXT_WAS[9]="Errores de sincronismo  [WAS]"
TEXT_WAS[10]="Errores de conectividad con CICS  [SE]"
TEXT_WAS[11]="Errores CM Content Manager [SE]"
TEXT_WAS[12]="Errores LDAP [SE]"
TEXT_WAS[13]="Error de certificado [WAS]"
TEXT_WAS[14]="Error de certificado. Hay que recuperarlo de peurto o instalarlo [WAS]"
TEXT_WAS[15]="Error en recurso JDBC - JCA [WAS]"
TEXT_WAS[16]="Error en compilacion JSP"
TEXT_WAS[17]="Intento de parada del servidor [WAS]"
TEXT_WAS[18]="Servidor iniciado [WAS]"
TEXT_WAS[19]="Clases mutua en excepciones [DESA]"

i=0
MAX_CHECKS=20

#-Hay que identificar el numero de errores y dos instantaneas de cada uno
#echo "gwas ${ERROR_WAS[0]} ${FILE_NAME}"

echo "======================================================="
echo "Fichero de Log  ${APP_NAME} : ${FILE_NAME}"
echo "======================================================="


while [ $i -lt ${MAX_CHECKS} ] ; do
#-Numero de apariciones
NUM_ERROR_WAS[$i]=$(gwas "${ERROR_WAS[$i]}" | wc -l )
#-Nos quedamos con dos instantaneas
LOG_ERROR_WAS[$i]=$(gwas "${ERROR_WAS[$i]}" | sort -u | tail -${LINE_NUMBER} )

if [ "${NUM_ERROR_WAS[$i]}" != "0" ] ; then

echo "${TEXT_WAS[$i]} : ${NUM_ERROR_WAS[$i]} ( Nos quedamos con ${LINE_NUMBER} apariciones ) "
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo "${LOG_ERROR_WAS[$i]}"
echo "-------------------------------------------------------"

fi

let i++
done

cd ${RUTA_ACTUAL}

}



