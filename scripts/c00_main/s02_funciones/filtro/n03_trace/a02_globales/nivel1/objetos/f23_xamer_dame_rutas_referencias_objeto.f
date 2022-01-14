#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="5.1" #  Version del Script actual
FECHA_SCRIPT="Octubre 2011"
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
#-- xamer
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- f - S_RCT
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Devuelve los archivos que tienen las referencias a los objetos
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
#E SERVER:/RUTA/scripts>xamer ma sx
#E ./c06_server/s05_minialias/acceso/a01_ssh.ma
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#--------------------------------------------------------------------
# FUNCION xamer
#--------------------------------------------------------------------

xamer()
{
IS_xamer="Devuelve las rutas de archivos que tienen las referencias a los objetos"
INFO_SCRIPT=${IS_xamer}

TIPO_ARCHIVO=$1 ;
FILTRO=$2

if [ "${FILTRO}" == "" ] ;  then
TIPO_ARCHIVO=v
FILTRO=$1
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
