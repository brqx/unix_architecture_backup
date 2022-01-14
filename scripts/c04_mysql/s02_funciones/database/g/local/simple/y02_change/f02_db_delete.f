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
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- db_delete
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- db_exist
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Elimina una base de datos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T eliminacion borrado bbdd mysql
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P BBDD 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E db_delete za_d50prok  --> Elimina bbdd za_d50prok
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## alias dbdeld db_erase db_remove
## - Elimina la BBDD
db_delete()
{
IS_db_delete="Elimina la base de datos indicada"
INFO_SCRIPT=${IS_db_delete}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_db_delete=${INFO_SCRIPT}

BASE_DATOS_LOCAL=$1

SALIDA_db_delete=0

NOMBRE_SCRIPT_db_delete=db_delete
PARAMETROS_SCRIPT_db_delete="BBDD"

if [ "${BASE_DATOS}" == "" ] ; then
BASE_DATOS="-?"
fi

if [ "${BASE_DATOS}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_db_delete} ${PARAMETROS_SCRIPT_db_delete}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar si existe bbdd
#-- [2] Borrar BBDD
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
db_exist ${BASE_DATOS_LOCAL}
SALIDA_db_delete=${SALIDA_db_exist}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_db_exist}" == "0"  ]  ; then
#------======------======------======------======------======------=
#----- [1] Inicio check BBDD en sistema
#------======------======------======------======------======------=

mysql -u root -e "drop database ${BASE_DATOS_LOCAL}; flush privileges;"

SALIDA_MYSQL=$?

SALIDA_db_delete=${SALIDA_MYSQL}

if [ "${SALIDA_MYSQL}" == "0"  ]  ; then
#--------========--------========--------========--------========---
#----- [2] Inicio export BBDD en sistema
#--------========--------========--------========--------========---

MOTIVO_FUNCION="BBDD borrada correctamente"
else
MOTIVO_FUNCION="Hubo error al borrar BBDD"

#--------========--------========--------========--------========---
#----- [2] Fin export BBDD en sistema
#--------========--------========--------========--------========---
fi
else

MOTIVO_FUNCION="BBDD no existe en el sistema"
#------======------======------======------======------======------=
#----- [1] Inicio check BBDD en sistema
#------======------======------======------======------======------=
fi



if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_db_delete}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_db_delete}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_db_delete}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_db_delete}
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
