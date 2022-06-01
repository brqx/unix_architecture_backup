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

sql_loader()
{
IS_sql_loader="Procesa logs de un servidor local"
INFO_SCRIPT=${IS_sql_loader}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_sql_loader=${INFO_SCRIPT}

RUTA_DESTINO=${1}
CONEXION_BD=${2}
RUTA_CARGA_LOCAL=${3}

SALIDA_sql_loader=0

NOMBRE_SCRIPT_sql_loader=sql_loader
PARAMETROS_SCRIPT_sql_loader="usuario servidor puerto dest"


if [ "${RUTA_CARGA_LOCAL}" == "" ]; then
RUTA_CARGA_LOCAL="/tmp/LOGS_ARQOS/monitoring/"
fi  


if [ "${RUTA_DESTINO}" == "" ]; then
	RUTA_DESTINO="-?"
fi  

if [ "${RUTA_DESTINO}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_sql_loader} ${PARAMETROS_SCRIPT_sql_loader}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Obtener los ficheros
#-- [2] Procesar los ficheros
#-- [3] Eliminar ficheros procesados
#--------========--------========--------========--------========---

LISTA_FICHEROS_NAS=${PWD}/lista_ficheros_nas.dat

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
find ${RUTA_DESTINO} -name *.log  > ${LISTA_FICHEROS_NAS}
SALIDA_find=$?
SALIDA_sql_loader=${SALIDA_ssh_find}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_find}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio procesamiento del lote de ficheros
#--------========--------========--------========--------========---

NUM_FICHEROS=$(cat ${LISTA_FICHEROS_NAS} | wc -l )

if [ "${NUM_FICHEROS}" != "0" ] ; then
#----------==========----------==========----------==========-------
#------- [2] Inicio hay ficheros
#----------==========----------==========----------==========-------

for file in $( cat ${LISTA_FICHEROS_NAS} ) ; do
#----------==========----------==========----------==========-------
#------- [2f] Inicio FOR hay ficheros
#----------==========----------==========----------==========-------

RUTA_FICHERO=${RUTA_DESTINO}/${file}

#-Procesamos el fichero
sqlldr userid=${CONEXION_BD} CONTROL=Carga_LOG_Servicios_ARQoS.ctl DATA=${file} LOG=${file}.LOG BAD=${file}.bad skip=0 DIRECT=TRUE
SALIDA_sqlldr=$?
SALIDA_sql_remote_loader=${SALIDA_sqlldr}

if [ "${SALIDA_sqlldr}" == "0" ] ; then
#------------============------------============------------=======
#---------- [3] Inicio procesamiento por parte de Oracle
#------------============------------============------------=======
MOTIVO_FUNCION="Procesamiento correcto.Carga Oracle correcta"

#-Borramos el fichero local - esta parte queda pendiente pues partimos que no va a fallar
rm ${RUTA_FICHERO}
SALIDA_rm=$?

if [ "${SALIDA_rm}" == "0" ] ; then
#-------------=============-------------=============-------------==
#----------- [4] Inicio registro proceso correcto
#-------------=============-------------=============-------------==
MOTIVO_FUNCION="Procesamiento correcto.Carga Oracle correcta y borrado ficheros correcto"

else

MOTIVO_FUNCION="Error al borrar el fichero local o remoto"
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Ruta       : ${RUTA_FICHERO}"

#-------------=============-------------=============-------------==
#----------- [4] Fin registro proceso correcto
#-------------=============-------------=============-------------==
fi
else

MOTIVO_FUNCION="Error al cargar los datos del fichero en oracle"
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Ruta       : ${RUTA_FICHERO}"
PARAMETROS_MOTIVO_03="Conexion BD: ${CONEXION_BD}"

#------------============------------============------------=======
#---------- [3] Fin procesamiento por parte de Oracle
#------------============------------============------------=======
fi
#----------==========----------==========----------==========-------
#------- [2f] Inicio FOR hay ficheros
#----------==========----------==========----------==========-------
done
#-Final iteracion de los ficheros

else

MOTIVO_FUNCION="No hay ficheros en el servior remoto"
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Ruta       : ${RUTA_FICHERO}"

#----------==========----------==========----------==========-------
#------- [2] Fin hay ficheros
#----------==========----------==========----------==========-------
fi
else

MOTIVO_FUNCION="Error al lanzar el find contra el servidor remoto"
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Ruta       : ${RUTA_FICHERO}"
#--------========--------========--------========--------========---
#----- [1] Fin procesamiento del lote de ficheros
#--------========--------========--------========--------========---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_sql_loader}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_sql_loader}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_sql_loader}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_sql_loader}
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
