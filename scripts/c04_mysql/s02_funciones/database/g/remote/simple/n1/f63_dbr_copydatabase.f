#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.4"          #  Version del Script actual
FECHA_SCRIPT="Abril 2012"
STATUS_SCRIPT="pending"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_CARACTER_04="especifico"
CONCEPT_MOLDE_04="funciones"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_ARQUETIPO_04="database"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04}  ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- dbr_copy
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- db_export - dbr_backup - dbr_restore
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Copia una base de datos en otra
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T copia replicacion bbdd mysql
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P USUARIO SERVIDOR PUERTO BB_LOCAL BD_REMOTA [RUTA_IMPORT] [RUTA_EXPORT]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E dbr_copy U S 22 za_d50prok zu_d50prok  --> Copia bbdd za_d50prok en zu_d50prok
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


# Posiblealias dbrc
## - Copia la base de datos en otra base de datos
dbr_copy()
{
IS_dbr_copy="Copia la base de datos indicada"
INFO_SCRIPT=${IS_dbr_copy}

INFO_SCRIPT_dbr_copy=${INFO_SCRIPT}

USUARIO_CONEXION=${1}
SERVER=${2}
PUERTO_SERVER=${3}

BASE_DATOS_LOCAL=${4}
BASE_DATOS_REMOTA=${5}
RUTA_EXPORT_LOCAL=${6}
RUTA_IMPORT_REMOTA=${7}

SALIDA_dbr_copy=0

NOMBRE_SCRIPT_dbr_copy=dbr_copy
PARAMETROS_SCRIPT_dbr_copy="USER SERVER PORT BD_LOCAL BD_REMOTA [RUTA_EXPORT]"

if [ "${BASE_DATOS_LOCAL}" == "" ] ; then
USUARIO_CONEXION="-?"
fi

if [ "${BASE_DATOS_REMOTA}" == "" ] ; then
USUARIO_CONEXION="-?"
fi

if [ "${RUTA_EXPORT_LOCAL}" == "" ] ; then
#-Si no se indica ruta vamos a partir de unas rutas generales
RUTA_EXPORT_LOCAL=${DB_GLOBAL_EXPORT}
fi

if [ "${RUTA_IMPORT_REMOTA}" == "" ] ; then
RUTA_IMPORT_REMOTA=${DB_GLOBAL_IMPORT}
fi

if [ "${USUARIO_CONEXION}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_dbr_copy} ${PARAMETROS_SCRIPT_dbr_copy}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

PATH_ACTUAL=$PWD

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

#- Exportamos y generamos el fichero
db_export ${BASE_DATOS_LOCAL} ${BASE_DATOS_REMOTA} ${RUTA_EXPORT} 
SALIDA_dbr_copy=${SALIDA_db_export}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_db_export}" == "0" ] ; then
#-La exportacion ha sido correcta
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- [1] - Inicio cuerpo - crear bbdd
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

FICHERO_EXPORT=${BASE_DATOS_REMOTA}.sql

#-Igual hay que renombrar el fichero

RUTA_EXPORT_COMPLETA=${RUTA_EXPORT_LOCAL}${FICHERO_EXPORT}

RUTA_IMPORT_REMOTA_COMPLETA=${RUTA_IMPORT_REMOTA}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

#- Creamos la BBDD ( no debe existir - igual se crea al restaurarla )
dbr_create ${USUARIO_CONEXION} ${SERVER} ${PUERTO_SERVER} ${BASE_DATOS_REMOTA}
SALIDA_dbr_copy=${SALIDA_dbr_create}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_dbr_create}" == "0" ] ; then
#- BD creada correctamente
#----====----====----====----====----====----====----====----====---
#- [2] - Inicio cuerpo - copiar bbdd
#----====----====----====----====----====----====----====----====---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

#-- Este ya funciona
czf_path_to_server ${USUARIO_SERVER} ${SERVER} ${PUERTO_SERVER} ${RUTA_EXPORT_COMPLETA} ${RUTA_IMPORT_REMOTA}
SALIDA_dbr_copy=${SALIDA_czf_path_to_server}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_czf_path_to_server}" == "0" ] ; then
#- BD copiada correctamente
#------======------======------======------======------======------=
#- [3] - Inicio cuerpo - restaurar bbdd
#------======------======------======------======------======------=

#- Importamos
dbr_restore ${USUARIO_SERVER} ${SERVER} ${PUERTO_SERVER} ${BASE_DATOS_REMOTA} 
SALIDA_dbr_copy=${SALIDA_dbr_restore}

if [ "${SALIDA_dbr_restore}" == "0" ] ; then
#-Se ha restaurado correctamente en el servidor remoto
#------======------======------======------======------======------=
#- [4] - Inicio cuerpo - borrar fichero sql
#------======------======------======------======------======------=

rm -f ${RUTA_EXPORT}/${BASE_DATOS_REMOTA}.sql
rm -f ${RUTA_EXPORT}/${BASE_DATOS_REMOTA}.sql.md5
ERROR_rm=$?
SALIDA_dbr_copy=${ERROR_rm}

if [ "${ERROR_rm}" == "0" ] ; then
MOTIVO_FUNCION="BD copiada correctamente"
else
MOTIVO_FUNCION="Hay problemas al borrar exportacion de la BD"
PARAMETROS_MOTIVO_01="Parametros : ${RUTA_EXPORT}/${BASE_DATOS_REMOTA}.sql"

fi
#------======------======------======------======------======------=
#- [4] - Fin cuerpo - borrar fichero sql
#------======------======------======------======------======------=
fi
else

MOTIVO_FUNCION="Hay problemas al restaurar la BD"
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_SERVER} ${SERVER} ${PUERTO_SERVER} ${BASE_DATOS_REMOTA}"

#------======------======------======------======------======------=
#- [3] - Fin cuerpo - restaurar bbdd
#------======------======------======------======------======------=
fi
else

MOTIVO_FUNCION="Hay problemas al copiar la BD"
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_SERVER} ${SERVER} ${PUERTO_SERVER}"
PARAMETROS_MOTIVO_02="Rutas      : ${RUTA_EXPORT_COMPLETA} ${RUTA_IMPORT_REMOTA}"

#------======------======------======------======------======------=
#- [2] - Fin cuerpo - restaurar bbdd
#------======------======------======------======------======------=
fi
else

MOTIVO_FUNCION="Hay problemas al crear la BD"
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_CONEXION} ${SERVER} ${PUERTO_SERVER} ${BASE_DATOS_REMOTA}"

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- [1] - Fin cuerpo - crear bbdd
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_dbr_copy}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_dbr_copy}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_dbr_copy}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


#- Volvemos a la ruta guardada
cd ${PATH_ACTUAL}
return ${SALIDA_dbr_copy}

fi
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
}

