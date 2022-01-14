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
#-- db_copy_to_server
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- db_export - dbr_backup - dbr_restore - czf_path_to_server
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
#P USUARIO SERVIDOR PUERTO BB_LOCAL [BD_REMOTA] [RUTA_IMPORT] [RUTA_EXPORT]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E db_copy_to_server U S 22 za_d50prok zu_d50prok  --> Copia bbdd za_d50prok en zu_d50prok
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


# Posiblealias dbrc
## - Copia la base de datos en otra base de datos
db_copy_to_server()
{
IS_db_copy_to_server="Copia la base de datos indicada en el servidor solicitado"
INFO_SCRIPT=${IS_db_copy_to_server}

INFO_SCRIPT_db_copy_to_server=${INFO_SCRIPT}

USUARIO_CONEXION=${1}
SERVER=${2}
PUERTO_SERVER=${3}

BASE_DATOS_LOCAL=${4}
BASE_DATOS_REMOTA=${5}
RUTA_EXPORT_LOCAL=${6}
RUTA_IMPORT_REMOTA=${7}

SALIDA_db_copy_to_server=0

NOMBRE_SCRIPT_db_copy_to_server=db_copy_to_server
PARAMETROS_SCRIPT_db_copy_to_server="USER SERVER PORT BD_LOCAL BD_REMOTA [RUTA_EXPORT]"

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

e_pmt ${NOMBRE_SCRIPT_db_copy_to_server} ${PARAMETROS_SCRIPT_db_copy_to_server}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar bbdd
#-- [2] Exportar BBBDD
#-- [3] Crear BBBDD nueva
#-- [4] Importar BBBDD
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
db_exist ${BASE_DATOS_LOCAL}
SALIDA_db_copy_to_server=${SALIDA_db_exist}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

PARAMETROS_MOTIVO_01="Parametros         : ${USUARIO_CONEXION} ${SERVER} ${PUERTO_SERVER} ${BASE_DATOS_REMOTA}"
PARAMETROS_MOTIVO_02="Rutas Local  (exp) : ${RUTA_EXPORT_COMPLETA} "
PARAMETROS_MOTIVO_03="Rutas Remota (imp) : ${RUTA_IMPORT_REMOTA}"

if [ "${SALIDA_db_exist}" == "0"  ]  ; then
#------======------======------======------======------======------=
#----- [1] Inicio check BBDD en sistema
#------======------======------======------======------======------=

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
#- Exportamos y generamos el fichero
db_export ${BASE_DATOS_LOCAL} ${BASE_DATOS_REMOTA} ${RUTA_EXPORT} 
SALIDA_db_copy_to_server=${SALIDA_db_export}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_db_export}" == "0" ] ; then
#-La exportacion ha sido correcta
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#----- [2] - Inicio export bbdd
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

FICHERO_EXPORT=${BASE_DATOS_REMOTA}.sql

#-Igual hay que renombrar el fichero

RUTA_EXPORT_COMPLETA=${RUTA_EXPORT_LOCAL}${FICHERO_EXPORT}

RUTA_IMPORT_REMOTA_COMPLETA=${RUTA_IMPORT_REMOTA}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
#- Creamos la BBDD ( no debe existir - igual se crea al restaurarla )
dbr_create ${USUARIO_CONEXION} ${SERVER} ${PUERTO_SERVER} ${BASE_DATOS_REMOTA}
SALIDA_db_copy_to_server=${SALIDA_dbr_create}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_dbr_create}" == "0" ] ; then
#- BD creada correctamente
#----====----====----====----====----====----====----====----====---
#----- [3] - Inicio create bbdd
#----====----====----====----====----====----====----====----====---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
#-- Este ya funciona
czf_path_to_server ${USUARIO_SERVER} ${SERVER} ${PUERTO_SERVER} ${RUTA_EXPORT_COMPLETA} ${RUTA_IMPORT_REMOTA}
SALIDA_db_copy_to_server=${SALIDA_czf_path_to_server}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_czf_path_to_server}" == "0" ] ; then
#- BD copiada correctamente
#------======------======------======------======------======------=
#----- [4] - Inicio restaurar bbdd
#------======------======------======------======------======------=

#- Importamos
dbr_restore ${USUARIO_SERVER} ${SERVER} ${PUERTO_SERVER} ${BASE_DATOS_REMOTA} 
SALIDA_db_copy_to_server=${SALIDA_dbr_restore}

if [ "${SALIDA_dbr_restore}" == "0" ] ; then
#-Se ha restaurado correctamente en el servidor remoto
#------======------======------======------======------======------=
#----- [5] - Inicio borrar fichero sql
#------======------======------======------======------======------=

rm -f ${RUTA_EXPORT}/${BASE_DATOS_REMOTA}.sql
rm -f ${RUTA_EXPORT}/${BASE_DATOS_REMOTA}.sql.md5
ERROR_rm=$?
SALIDA_db_copy_to_server=${ERROR_rm}

if [ "${ERROR_rm}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [6] - Inicio borrado correcto
#--------========--------========--------========--------========---

MOTIVO_FUNCION="BD copiada correctamente"
else
MOTIVO_FUNCION="Hay problemas al borrar exportacion de la BD"

#--------========--------========--------========--------========---
#----- [6] - Fin borrado correcto
#--------========--------========--------========--------========---
fi
else
MOTIVO_FUNCION="Hay problemas al restaurar la BD"

#------======------======------======------======------======------=
#----- [5] - Fin cuerpo - borrar fichero sql
#------======------======------======------======------======------=
fi
else

MOTIVO_FUNCION="Hay problemas al copiar la BD"

#------======------======------======------======------======------=
#----- [4] - Fin cuerpo - restaurar bbdd
#------======------======------======------======------======------=
fi
else

MOTIVO_FUNCION="Hay problemas al crear la BD"

#------======------======------======------======------======------=
#----- [3] - Fin cuerpo - restaurar bbdd
#------======------======------======------======------======------=
fi
else

MOTIVO_FUNCION="Hay problemas al exportar la BD"

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#----- [2] - Fin cuerpo - crear bbdd
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi
else

MOTIVO_FUNCION="La BBDD a copiar no existe en el sistema origen"

#------======------======------======------======------======------=
#----- [1] Inicio check BBDD en sistema
#------======------======------======------======------======------=
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_db_copy_to_server}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_db_copy_to_server}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_db_copy_to_server}

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
return ${SALIDA_db_copy_to_server}

fi
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
}

