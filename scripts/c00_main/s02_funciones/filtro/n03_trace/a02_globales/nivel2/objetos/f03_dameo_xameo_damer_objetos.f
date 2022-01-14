#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="5.1" #  Version del Script actual
FECHA_SCRIPT="Julio 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="filtro"
CONCEPT_ARQUETIPO_04="trace"
CONCEPT_VARIANTE_04="nivel1"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- dameo
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- f - S_RCT
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Devuelve los objetos definidos ( Variables - Alias - Funciones ... )
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T informacion funciones objetos filtro
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P FUNCION
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E SERVER:/RUTA/scripts>dameo ma sx
#E ./c06_server/s05_minialias/acceso/a01_ssh.ma:alias sx='sync_dir_to_abrqx'
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#--------------------------------------------------------------------
# FUNCION dameo
#--------------------------------------------------------------------

dameo()
{
IS_dameo="Devuelve los objetos definidos y sus rutas. Si no indicamos extension, las variables"
INFO_SCRIPT=${IS_dameo}

TIPO_ARCHIVO=$1 ;
FILTRO=$2

if [ "${TIPO_ARCHIVO}" == "" ] ;  then
TIPO_ARCHIVO=v
fi

RUTA_ACTUAL=$PWD

cd ${S_RCT}

f ${TIPO_ARCHIVO} | xargs grep "=" | grep -v "==" | grep -v "\-\-" | grep -v "CONCEPT" | grep -v "NIVEL" | grep -v "FECHA" | grep -v "VERSION" | grep "${FILTRO}"

COD_RET=$?

if [ ${COD_RET} -gt 0 ] ; then
e_pmp dameo "[tipo_objeto [filtro] ]" "No hay resultados para la tupla ${TIPO_ARCHIVO} ${FILTRO}"
fi

cd ${RUTA_ACTUAL}

}

#--------------------------------------------------------------------
# FUNCION xameo
#--------------------------------------------------------------------

xameo()
{
IS_xameo="Devuelve los objetos definidos. Si no indicamos extension, las variables"
INFO_SCRIPT=${IS_xameo}


TIPO_ARCHIVO=$1 ;
FILTRO=$2

if [ "${TIPO_ARCHIVO}" == "" ] ;  then
TIPO_ARCHIVO=v
fi

RUTA_ACTUAL=$PWD

cd ${S_RCT}

f ${TIPO_ARCHIVO} | xargs grep "=" | grep -v "==" | grep -v "\-\-" | grep -v "CONCEPT" | grep -v "NIVEL" | grep -v "FECHA" | grep -v "VERSION" | grep "${FILTRO}" | cut -d ":" -f2- 

COD_RET=$?

if [ ${COD_RET} -gt 0 ] ; then
e_pmp xameo "[tipo_objeto [filtro] ]" "No hay resultados para la tupla ${TIPO_ARCHIVO} ${FILTRO}"
fi


cd ${RUTA_ACTUAL}

}

#--------------------------------------------------------------------
# FUNCION xamer
#--------------------------------------------------------------------

xamer()
{
IS_xamer="Devuelve los rutas de los objetos definidos. Si no indicamos extension, las variables"
INFO_SCRIPT=${IS_xamer}

TIPO_ARCHIVO=$1 ;
FILTRO=$2

if [ "${TIPO_ARCHIVO}" == "" ] ;  then
TIPO_ARCHIVO=v
fi

RUTA_ACTUAL=$PWD

cd ${S_RCT}

f ${TIPO_ARCHIVO} | xargs grep "=" | grep -v "==" | grep -v "\-\-" | grep -v "CONCEPT" | grep -v "NIVEL" | grep -v "FECHA" | grep -v "VERSION" | grep "${FILTRO}" | cut -d ":" -f1 | uniq

COD_RET=$?

if [ ${COD_RET} -gt 0 ] ; then
e_pmp xamer "[tipo_objeto [filtro] ]" "No hay resultados para la tupla ${TIPO_ARCHIVO} ${FILTRO}"
fi


cd ${RUTA_ACTUAL}

}
