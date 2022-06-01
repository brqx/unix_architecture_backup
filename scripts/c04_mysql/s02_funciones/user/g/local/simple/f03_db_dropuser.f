#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.1"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2011"
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
#-- db_user_drop
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Crea un usuario para la base de datos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generacion usuario bbdd mysql
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P USUARIO [CLAVE]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E db_user_drop brqx_za  --> Genera usuario brqx_za
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## mini alias dbudrop
## - Se encarga de eliminar la asociacion del usuario
db_user_drop()
{
IS_db_user_drop="Elimina el usuario de la Base de datos Mysql"
INFO_SCRIPT=${IS_db_user_drop}

USUARIO=$1

if [ "${USUARIO}" == "" ] ; then
USUARIO="-?"
fi

if [ "${USUARIO}" == "-?" ] ;  then

e_pmt db_user_drop "usuario"

else

echo "Eliminando usuario ${USUARIO} con DROP"

mysql -u root -e "DROP USER ${USUARIO}@localhost;flush privileges;" 2> /dev/null

SALIDA_MYSQL=$?

if [ "${SALIDA_MYSQL}" == "1"  ]  ; then
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
