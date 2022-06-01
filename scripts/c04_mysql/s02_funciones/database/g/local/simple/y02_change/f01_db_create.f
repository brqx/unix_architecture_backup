#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.1"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2012"
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
#-- db_create
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- db_exist - db_delete
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Crea una base de datos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generacion bbdd mysql
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P BBDD [MODO]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E db_create za_d50prok     --> Genera bbdd za_d50prok solo si no existe
#-------------------------------------------------------------------
#E db_create za_d50prok rep --> Genera bbdd za_d50prok reemplazando
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## alias dbcrea
## - Genera la BBDD
db_create()
{
IS_db_create="Crea la base de datos indicada"
INFO_SCRIPT=${IS_db_create}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_db_create=${INFO_SCRIPT}

BASE_DATOS_PASADA=$1
MODO_SEGURO=$2
#-Modo podra ser replace o en blanco
#-Por defecto - si ya existe no la vuelve a crear

SALIDA_db_create=0

NOMBRE_SCRIPT_db_create=db_create
PARAMETROS_SCRIPT_db_create="BBDD [MODO]"


if [ "${BASE_DATOS_PASADA}" == "" ] ; then
BASE_DATOS_PASADA="-?"
fi

if [ "${MODO_SEGURO}" == "" ] ; then
MODO_SEGURO="1"
else
MODO_SEGURO="0"
fi

if [ "${BASE_DATOS_PASADA}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_db_create} ${PARAMETROS_SCRIPT_db_create}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar si existe bbdd
#-- [2] Comprobar modo
#-- [3] Crear BBDD en razon al modo indicado
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
db_exist ${BASE_DATOS_PASADA}
SALIDA_db_create=${SALIDA_db_exist}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_db_exist}" != "0"  ]  ; then
#------======------======------======------======------======------=
#----- [1] Inicio check BBDD en sistema
#------======------======------======------======------======------=

mysql -u root -e "create database ${BASE_DATOS_PASADA}; flush privileges;"
SALIDA_MYSQL=$?
SALIDA_db_create=${SALIDA_MYSQL}

if [ "${SALIDA_MYSQL}" == "0"  ]  ; then
#--------========--------========--------========--------========---
#----- [2] Inicio export BBDD en sistema
#--------========--------========--------========--------========---

MOTIVO_FUNCION="BBDD creada correctamente"

else
MOTIVO_FUNCION="Hubo error al crear BBDD"

#--------========--------========--------========--------========---
#----- [2] Fin export BBDD en sistema
#--------========--------========--------========--------========---
fi
else
#-Aqui tenemos la salida db_exist en caso de que exista
if [ "${MODO_SEGURO}" == "1"  ]  ; then
#--------========--------========--------========--------========---
#----- [2a] Inicio check MODO seguro
#--------========--------========--------========--------========---
#- Debemos volver a borrar y a crear la BBDD

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
db_delete ${BASE_DATOS_PASADA}
SALIDA_db_create=${SALIDA_db_delete}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_db_delete}" == ""  ]  ; then
#--------========--------========--------========--------========---
#----- [3a] Inicio borrado BBDD
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
db_create ${BASE_DATOS_PASADA}
SALIDA_db_create=${SALIDA_db_create}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_db_delete}" == ""  ]  ; then
#--------========--------========--------========--------========---
#----- [4a] Inicio re-creaccion BBDD
#--------========--------========--------========--------========---

MOTIVO_FUNCION="BBDD se ha creado de nuevo correctamente"

else

MOTIVO_FUNCION="BBDD se no se ha podido re-creado"

#--------========--------========--------========--------========---
#----- [4a] Inicio re-creaccion BBDD
#--------========--------========--------========--------========---
fi
else

MOTIVO_FUNCION="Error al intentar eliminar la BBDD que se quiere re-crear"

#--------========--------========--------========--------========---
#----- [3a] Inicio borrado BBDD
#--------========--------========--------========--------========---
fi
else

MOTIVO_FUNCION="BBDD no se ha creado porque ya existe y no se ha activado el modo adecuado"

#--------========--------========--------========--------========---
#----- [2a] Inicio check MODO seguro
#--------========--------========--------========--------========---
fi
#------======------======------======------======------======------=
#----- [1] Inicio check BBDD en sistema
#------======------======------======------======------======------=
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_db_create}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_db_create}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_db_create}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_db_create}
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi
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
