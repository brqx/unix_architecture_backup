#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 7.0"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2011"
STATUS_SCRIPT="pending"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_MOLDE_04="funciones"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_ARQUETIPO_04="user"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_CARACTER_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- db_user_changepass
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Cambia la clave de un usuario en la base de datos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T cambio clave usuario bbdd mysql
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P USUARIO [CLAVE]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E db_user_changepass brqx_za 123  --> Cambia la clave al usuario brqx_za
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## alias dbpass
## - Cambia la clave del usuario
db_user_changepass()
{
IS_db_user_changepass="Cambia la clave del usuario en la Base de datos Mysql"
INFO_SCRIPT=${IS_db_user_changepass}

USUARIO=$1
CLAVE=$2

if [ "${USUARIO}" == "" ] ; then
USUARIO="-?"
fi

if [ "${CLAVE}" == "" ] ; then
CLAVE="ricardo"
fi

if [ "${USUARIO}" == "-?" ] ;  then

e_pmt db_user_changepass "usuario [clave]"

else

echo "Cambiando la clave del usuario ${USUARIO}"

mysql -u root -e "SET PASSWORD FOR ${USUARIO}@localhost = PASSWORD('${CLAVE}'); flush privileges;" 2> /dev/null

SALIDA_MYSQL=$?

if [ "$SALIDA_MYSQL" == "1"  ]  ; then
echo "Usuario ${USUARIO} no existe"
fi

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
