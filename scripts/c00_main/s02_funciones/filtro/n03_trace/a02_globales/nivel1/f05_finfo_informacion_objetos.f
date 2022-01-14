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
CONCEPT_MOLDE_04="informaciones"
CONCEPT_ARQUETIPO_04="general"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- finfo
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- damer - S_RCT
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
#E finfo f3  -- Devuelve la informacion de la funcion
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#--------------------------------------------------------------------
# FUNCION finfo
#--------------------------------------------------------------------

#- Pendiente de incrementar funcionalidad - alias - variables 
#- De momento solo funciones
finfo()
{
INFO_SCRIPT="Devuelve informacion de la funcion / objeto indicado"

OBJETO=$1 ;

if [ "${OBJETO}" != "" ] ;  then

RUTA_ACTUAL=$PWD

#-Debemos partir de la ruta de los scripts
cd ${S_RCT}

#-- Debemos diferenciar entre funciones alias y otros objetos

INFO_OBJETO=$( damer ${OBJETO} | xargs grep "IS_${OBJETO}=" | cut -d "\"" -f2 | tr " " "_" )
#- Aqui no vale el codigo de retorno pues siempre da 0
COD_RET=$?


cd ${S_RCT}
PMT_OBJETO=$( damer ${OBJETO} | xargs grep "^#P" | cut -d " " -f2- | tr " " "_" )


if [ "${COD_RET}" == "1" ] ; then
#- En este caso o no es una funcion es hay un error

e_pmpi ${OBJETO} "No hay resultados" "Igual puede ser otro tipo de objeto"

else

e_pmpi ${OBJETO} ${INFO_OBJETO} ${PMT_OBJETO}

fi

cd ${RUTA_ACTUAL}

else

# Lo ideal seria llamar a e_pmt damef damef function

e_pmi finfo "OBJETO"

fi
}


