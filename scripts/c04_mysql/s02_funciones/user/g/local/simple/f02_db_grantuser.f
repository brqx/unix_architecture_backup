#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.2"          #  Version del Script actual
FECHA_SCRIPT="Octubre 2012"
STATUS_SCRIPT="pending"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_CARACTER_04="general"
CONCEPT_MOLDE_04="funciones"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_ARQUETIPO_04="user"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_CARACTER_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- db_user_grant
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Asigna permisos para un usuario para la base de datos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generacion permisos usuario bbdd mysql
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P USUARIO BASE_DATOS
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E db_user_grant brqx_za DB1  --> Asigna permisos para usuario en BD DB1
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## Mini alias dbugrant
db_user_grant()
{
IS_db_user_grant="Asigna permisos para un usuario en una Base de datos Mysql"
INFO_SCRIPT=${IS_db_user_grant}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_db_user_grant=${INFO_SCRIPT}

USUARIO=$1
DATABASE=$2

SALIDA_db_user_grant=0

NOMBRE_SCRIPT_db_user_grant=db_user_grant
PARAMETROS_SCRIPT_db_user_grant="USUARIO BBDD"

if [ "${USUARIO}" == "" ] ; then
USUARIO="-?"
fi

if [ "${DATABASE}" == "" ] ; then
USUARIO="-?"
fi

if [ "${USUARIO}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_db_user_grant} ${PARAMETROS_SCRIPT_db_user_grant}

else


mysql -u root -e "GRANT ALL PRIVILEGES  ON ${DATABASE}.* to '${USUARIO}'@'localhost';" &> /dev/null
SALIDA_mysql_grant=$?

PARAMETROS_MOTIVO_01="Usuario pasado : ${USUARIO} " 
PARAMETROS_MOTIVO_02="BBDD pasada    : ${DATABASE} " 

SALIDA_db_user_grant=${SALIDA_mysql_grant}

if [ "${SALIDA_mysql_grant}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio chequeo logs BBDD
#----====----====----====----====----====----====----====----====---
MOTIVO_FUNCION="Permisos aplicados correctamente"

else

MOTIVO_FUNCION="Error al aplicar permisos al usuario. Usuario ${USUARIO} o BD ${DATABASE} no existen."

#----====----====----====----====----====----====----====----====---
#----- [1] Fin chequeo logs BBDD
#----====----====----====----====----====----====----====----====---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_db_user_grant}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_db_user_grant}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_db_user_grant}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_db_user_grant}
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
