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
#-- damei - xamei
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- damer
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
#I damei v  -- Devuelve el listado indicado considerando el archivo
#-------------------------------------------------------------------
#I xamei v  -- Devuelve solo el contenido indicado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#--------------------------------------------------------------------
# FUNCION damei
#--------------------------------------------------------------------

damei()
{
IS_damei="Devuelve las referencias marcadas como informacion en el archivo "#I""
INFO_SCRIPT=${IS_damei}

FILTRO=$1 ;

if [ "${FILTRO}" != "" ] ;  then

RUTA_ACTUAL=$PWD

cd ${S_RCT}

damer ${FILTRO} | xargs grep -l "^#I"  

COD_RET=$?

if [ ${COD_RET} -gt 0 ] ; then
e_pmp damei "filtro" "No hay resultados para el filtro:  ${FILTRO}"
fi

cd ${RUTA_ACTUAL}

else

# Lo ideal seria llamar a e_pmt damef damef function

e_pmi damei "filtro"

fi
}

#--------------------------------------------------------------------
# FUNCION xamei
#--------------------------------------------------------------------

#-- El objetivo de sacar el listado y la funcion no se consigue tras unas vueltas

xamei()
{
IS_xamei="Devuelve las referencias marcadas como informacion en el archivo "#I""
INFO_SCRIPT=${IS_xamei}


FILTRO=$1 ;

if [ "${FILTRO}" != "" ] ;  then

RUTA_ACTUAL=$PWD

cd ${S_RCT}

damer ${FILTRO} | xargs grep "^#I" 

COD_RET=$?

if [ ${COD_RET} -gt 0 ] ; then
e_pmp xamei "filtro" "No hay resultados para fitro: ${FILTRO}"
fi

cd ${RUTA_ACTUAL}

else

# Lo ideal seria llamar a e_pmt damef damef function

e_pmi xamei "filtro"

fi

}
