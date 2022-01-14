#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.4"          #  Version del Script actual
FECHA_SCRIPT="Mayo 2012"
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
#-- dbr_copy_force
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- db_backup - dbr_restore - dbr_copy
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
#E dbr_copy_force za_d50prok zu_d50prok  --> Copia bbdd za_d50prok en zu_d50prok aunque exissta
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Posible alias dbcf
dbr_copy_force()
{
IS_dbr_copy_force="Copia la base de datos indicada aunque exista la bd destino"
INFO_SCRIPT=${IS_dbr_copy_force}

INFO_SCRIPT_dbr_copy_force=${INFO_SCRIPT}

USUARIO_CONEXION=${1}
SERVER=${2}
PUERTO_SERVER=${3}

BASE_DATOS_LOCAL=${4}
BASE_DATOS_REMOTA=${5}
RUTA_EXPORT_LOCAL=${6}
RUTA_IMPORT_REMOTA=${7}

SALIDA_dbr_copy_force=0

NOMBRE_SCRIPT_dbr_copy_force=dbr_copy_force
PARAMETROS_SCRIPT_dbr_copy_force="USER SERVER PORT BD_LOCAL BD_REMOTA [RUTA_EXPORT] [RUTA_IMPORT]"

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

e_pmt ${NOMBRE_SCRIPT_dbr_copy_force} ${PARAMETROS_SCRIPT_dbr_copy_force}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------
#- Si hay un fallo general no debe seguir STOP_EXEC_NOW
#-- Debe preguntar primero si existe e informarlo

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

#- Intentamos crear la BD a ver si ya existe
dbr_create ${USUARIO_CONEXION} ${SERVER} ${PUERTO_SERVER} ${BASE_DATOS_REMOTA}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_dbr_create}" != "0" ] ; then
#-Si la BD existe la borramos

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

dbr_delete ${USUARIO_CONEXION} ${SERVER} ${PUERTO_SERVER} ${BASE_DATOS_REMOTA}
SALIDA_dbr_copy_force=${SALIDA_dbr_delete}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Si la BD no existe la ha debido crear bien

fi

if [ "${SALIDA_dbr_delete}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#---- [1] Inicio copia BBDD
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#-Si se ha podido borrar la copiamos

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

dbr_copy ${USUARIO_CONEXION} ${SERVER} ${PUERTO_SERVER} ${BASE_DATOS_LOCAL} ${BASE_DATOS_REMOTA} \
${RUTA_EXPORT_LOCAL} ${RUTA_IMPORT_REMOTA}

SALIDA_dbr_copy_force=${SALIDA_dbr_copy}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_dbr_copy}" == "0"  ]  ; then
#----====----====----====----====----====----====----====----====---
#----- [2] Inicio salida copia
#----====----====----====----====----====----====----====----====---
#-Copia correcta
MOTIVO_FUNCION="BD - force - copiada correctamente"
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_CONEXION} ${SERVER} ${PUERTO_SERVER} "
PARAMETROS_MOTIVO_02="BD Origen  : ${BASE_DATOS_LOCAL} "
PARAMETROS_MOTIVO_03="BD Destino : ${BASE_DATOS_REMOTA}"

else

MOTIVO_FUNCION="Hay problemas al copiar la BD"
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_SERVER} ${SERVER} ${PUERTO_SERVER}"
PARAMETROS_MOTIVO_02="Consulta   : ${BASE_DATOS_LOCAL} ${BASE_DATOS_REMOTA} ${RUTA_EXPORT_LOCAL} ${RUTA_IMPORT_REMOTA}"

#----====----====----====----====----====----====----====----====---
#---- [2] Fin salida copia
#----====----====----====----====----====----====----====----====---
fi
else

MOTIVO_FUNCION="Error al borrar la BD remota"
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_CONEXION} ${SERVER} ${PUERTO_SERVER}"
PARAMETROS_MOTIVO_02="BBDD       : ${BASE_DATOS_REMOTA}"

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#---- [1] Fin copia BBDD
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

#-No ha sido llamada - emntonces informamos en este nivel

INFO_SCRIPT=${INFO_SCRIPT_dbr_copy_force}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_dbr_copy_force}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_dbr_copy_force}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_dbr_copy_force}
fi
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
}

#-------------------------------------------------------------------
#+ Sistema de trazado N4 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL	-	Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================
