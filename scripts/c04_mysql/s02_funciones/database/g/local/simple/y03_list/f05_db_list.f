#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.2"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2012"
STATUS_SCRIPT="tested"
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
#-- db_list
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lista las bases de datos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T listado bbdd mysql
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [FILTRO]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E db_list     --> Lista las Bases de datos
#-------------------------------------------------------------------
#E db_list pp  --> Lista las Bases de datos del proyecto pp
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## alias dblist
db_list()
{
IS_db_list="Lista las bases de datos"
INFO_SCRIPT=${IS_db_list}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_db_list=${INFO_SCRIPT}

FILTRO_BBDD=$1

SALIDA_db_list=0

NOMBRE_SCRIPT_db_list=db_list
PARAMETROS_SCRIPT_db_list="[FILTRO]"

NOMBRE_PANTALLA_db_list=PANTALLA_db_list.dat

if [ "${FILTRO_BBDD}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_db_list} ${PARAMETROS_SCRIPT_db_list}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar mysql
#-- [2] Realizar listado BBBDD
#--------========--------========--------========--------========---

mysql -u root -e "show databases;" | grep -v "Database" |grep -v "information_schema" | grep -v "mysql" | cut -d " " -f1 \
&> ${NOMBRE_PANTALLA_db_list}
SALIDA_MYSQL=$?
SALIDA_db_list=${SALIDA_MYSQL}

if [ "${SALIDA_MYSQL}" == "0"  ]  ; then
#------======------======------======------======------======------=
#----- [1] Inicio listado BBDD en sistema
#------======------======------======------======------======------=

PANTALLA_SCRIPT="${NOMBRE_PANTALLA_db_list}"

MOTIVO_FUNCION="Listado de BBDD correcto"
PARAMETROS_MOTIVO="Filtro : FILTRO_BBDD"

if [ "${FILTRO_BBDD}" != "" ] ;  then
#---------========---------========---------========---------=======
#----- [2] Inicio chequeo Filtro pasado
#---------========---------========---------========---------=======

cat ${NOMBRE_PANTALLA_db_list} | grep "${FILTRO_BBDD}"  > ${NOMBRE_PANTALLA_db_list}_filtered
mv -f ${NOMBRE_PANTALLA_db_list}_filtered ${NOMBRE_PANTALLA_db_list}

#---------========---------========---------========---------=======
#----- [2] Fin chequeo Filtro pasado
#---------========---------========---------========---------=======
fi
else

MOTIVO_FUNCION="Error accediendo al servidor de BD"

#------======------======------======------======------======------=
#----- [1] Fin listado BBDD en sistema
#------======------======------======------======------======------=
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_db_list}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_db_list}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_db_list}

e_pms 

#-De momento lo ponemos a este nivel
limpia_pantallas

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_db_list}
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
