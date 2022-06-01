#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.5"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2011"
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
#-- parseo_backup_files
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Parsea el fichero de configuracion obteniendo los datos del site
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T parseo configuracion servidores files ssh backup
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P cuenta [fichero_configuracion]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E parseo_backup_files cuenta fichero_config -- Obtiene datos para la cuenta
#-------------------------------------------------------------------
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias dmst_data
#- dame_site_data
parseo_backup_files()
{
IS_parseo_backup_files"Actualiza variables conexion en razon a la configuracion del site"
INFO_SCRIPT=${IS_parseo_backup_files}

CUENTA=${1}
FICHERO_CONFIGURACION_SITE=${2}

if [ "${CUENTA}" == "" ]; then
## Activamos un usuario por defecto
CUENTA="-?"
fi  

if [ "${FICHERO_CONFIGURACION_SITE}" == "" ]; then
FICHERO_CONFIGURACION_SITE=zproyectos.dat
fi  

if [ "${CUENTA}" == "-?" ]; then

e_pmt IS_parseo_backup_files "cuenta [fichero_configuracion]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Tenemos dos opciones :
#-- palillos
#-- zd/.../palillos

echo ${CUENTA} | grep "_" > /dev/null 2> /dev/null
TIPO_CUENTA=$?

if [ "${TIPO_CUENTA}" == "0" ]; then
## Es una cuenta compleja : zd_palillos

CUENTA_PRINCIPAL=$( echo ${CUENTA} | cut -d "_" -f1 )
SITE_PROYECTO=$( echo ${CUENTA} | cut -d "_" -f2 )

FICHERO_PROYECTO_CUENTA=/home/${CUENTA_PRINCIPAL}/www/${FICHERO_CONFIGURACION_SITE}

LINEA_PROYECTO=$( cat ${FICHERO_PROYECTO_CUENTA} | grep "^${SITE_PROYECTO}" )

ENFOQUE_PROYECTO=$( echo ${LINEA_PROYECTO} | cut -d ":" -f2 )
#-------------------------------------------------------------------

RUTA_ORIGEN=/home/${CUENTA_PRINCIPAL}/www/brqxng/proyectos/${ENFOQUE_PROYECTO}/${SITE_PROYECTO}/

else
#- Es una cuenta simple. Devolvemos la ruta origen
RUTA_ORIGEN=/home/${CUENTA}/www/

fi  

#- Devolvemos la ruta por defecto al log
RUTA_LOGS=${RUTA_ORIGEN}error_log

fi

##echo "Datos: ${CUENTA_PRINCIPAL} - ${ENFOQUE_PROYECTO}"
##echo "Ruta Origen : ${RUTA_ORIGEN}"

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
