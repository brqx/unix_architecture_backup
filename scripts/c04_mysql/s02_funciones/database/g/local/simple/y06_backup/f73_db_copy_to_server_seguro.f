#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.3"          #  Version del Script actual
FECHA_SCRIPT="Abril 2012"
STATUS_SCRIPT="pending"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_MOLDE_04="funciones"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_ARQUETIPO_04="database"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04}  ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- dbr_copy_seguro
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- dbr_create - dbr_copy
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Copia una base de datos en otra remota solo si no existe
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T copia replicacion bbdd mysql segura
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P USUARIO SERVIDOR PUERTO BB_LOCAL BD_REMOTA [RUTA_IMPORT] [RUTA_EXPORT]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E dbr_copy_seguro za_d50prok zu_d50prok  --> Copia bbdd za_d50prok en zu_d50prok
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

# Posible alias alias dbcs
## - Copia la base de datos en otra base de datos de forma segura
dbr_copy_seguro()
{
IS_dbr_copy_seguro="Copia la base de datos indicada solo si no existe en destino"
INFO_SCRIPT=${IS_dbr_copy_seguro}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_dbr_copy_seguro=${INFO_SCRIPT}

USUARIO_CONEXION=${1}
SERVER=${2}
PUERTO_SERVER=${3}

BASE_DATOS_LOCAL=${4}
BASE_DATOS_REMOTA=${5}
RUTA_EXPORT_LOCAL=${6}
RUTA_IMPORT_REMOTA=${7}

SALIDA_dbr_copy_seguro=0

NOMBRE_SCRIPT_dbr_copy_seguro=dbr_copy_seguro
PARAMETROS_SCRIPT_dbr_copy_seguro="USER SERVER PORT BD_LOCAL BD_REMOTA [RUTA_EXPORT] [RUTA_IMPORT]"

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

e_pmt ${NOMBRE_SCRIPT_dbr} ${PARAMETROS_SCRIPT_dbr}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------
#- Si hay un fallo general no debe seguir STOP_EXEC_NOW
#-- Debe preguntar primero si existe e informarlo

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

#- Creamos la BBDD ( no debe existir - igual se crea al restaurarla )
dbr_create ${USUARIO_CONEXION} ${SERVER} ${PUERTO_SERVER} ${BASE_DATOS_REMOTA}
SALIDA_dbr_copy_seguro=${SALIDA_dbr_create}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_dbr_create}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#---- [1] Inicio copia BBDD
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

dbr_copy ${USUARIO_CONEXION} ${SERVER} ${PUERTO_SERVER} ${BASE_DATOS_LOCAL} ${BASE_DATOS_REMOTA} \
${RUTA_EXPORT_LOCAL} ${RUTA_IMPORT_REMOTA}

SALIDA_dbr_copy_seguro=${SALIDA_dbr_copy}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_dbr_copy}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [2] Inicio salida copia
#----====----====----====----====----====----====----====----====---

MOTIVO_FUNCION="Error al copiar la BD"
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_CONEXION} ${SERVER} ${PUERTO_SERVER}"
PARAMETROS_MOTIVO_02="BBDD       : ${BASE_DATOS_LOCAL} ${BASE_DATOS_REMOTA} ${RUTA_EXPORT_LOCAL} ${RUTA_IMPORT_REMOTA}"


#----====----====----====----====----====----====----====----====---
#----- [2] Fin salida copia
#----====----====----====----====----====----====----====----====---
fi

else
MOTIVO_FUNCION="Error al copiar la BD remota. Se ha evitado porque ya existia."
PARAMETROS_MOTIVO_01="Parametros    : ${USUARIO_CONEXION} ${SERVER} ${PUERTO_SERVER}"
PARAMETROS_MOTIVO_02="Base de Datos : ${BASE_DATOS_REMOTA}"


#----====----====----====----====----====----====----====----====---
#----- [1] Fin copia BBDD
#----====----====----====----====----====----====----====----====---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_dbr_copy_seguro}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_dbr_copy_seguro}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_dbr_copy_seguro}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

#- Volvemos a la ruta guardada
return ${SALIDA_dbr_copy_seguro}
fi
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
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

