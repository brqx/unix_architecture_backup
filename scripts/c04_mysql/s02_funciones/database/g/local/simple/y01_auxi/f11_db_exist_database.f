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
CONCEPT_CARACTER_04="general"
CONCEPT_MOLDE_04="funciones"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_ARQUETIPO_04="database"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04}  ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- db_exist
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Comprueba si existe la base de datos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T comprobacion existencia bbdd mysql
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P BBDD 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E db_exist za_d50prok  --> Comprueba si existe la BBDD za_d50prok
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

db_exist()
{
IS_db_exist="Comprueba si existe la base de datos indicada"
INFO_SCRIPT=${IS_db_exist}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_db_exist=${INFO_SCRIPT}

BASE_DATOS=$1

SALIDA_db_exist=0

NOMBRE_SCRIPT_db_exist=db_exist
PARAMETROS_SCRIPT_db_exist="BBDD"


if [ "${BASE_DATOS}" == "" ] ; then
BASE_DATOS="-?"
fi

if [ "${BASE_DATOS}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_db_exist} ${PARAMETROS_SCRIPT_db_exist}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar BBDD
#-- [2] Reportar resultado de existencia
#--------========--------========--------========--------========---

which mysql > /dev/null
SALIDA_mysql=$?
SALIDA_db_exist=${SALIDA_mysql}

if [ "${SALIDA_mysql}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio comprobacion mysql en sistema
#----====----====----====----====----====----====----====----====---

mysql -u root -e "use ${BASE_DATOS};" &> /dev/null
SALIDA_mysql=$?

PARAMETROS_MOTIVO_01="Base de datos : ${BASE_DATOS}"


if [ "${SALIDA_mysql}" == "0"  ]  ; then
#------======------======------======------======------======------=
#----- [2] Inicio chequeo existencia tabla en sistema
#------======------======------======------======------======------=

MOTIVO_FUNCION="La base de datos existe en el sistema"

else

MOTIVO_FUNCION="La base de datos no existe en el sistema"
SALIDA_db_exist=2

#------======------======------======------======------======------=
#----- [2] Fin chequeo existencia tabla en sistema
#------======------======------======------======------======------=
fi
else
MOTIVO_FUNCION="Error al acceder a mysql"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin comprobacion mysql en sistema
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_db_exist}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_db_exist}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_db_exist}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_db_exist}
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
