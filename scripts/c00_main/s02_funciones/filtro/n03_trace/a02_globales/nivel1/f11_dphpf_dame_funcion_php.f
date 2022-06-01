#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="5.1" #  Version del Script actual
FECHA_SCRIPT="Febrero 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="informaciones"
CONCEPT_ARQUETIPO_04="general"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- damef_php - xamef_php
#-------------------------------------------------------------------
#+ Funciones / Alias /Variables Requeridas
#-------------------------------------------------------------------
#-- ff
#-------------------------------------------------------------------
#- Devuelve los objetos definidos ( Variables - Alias - Funciones ... )
#  Por defecto devolvera las variables o los alias
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E damea_php tab3     -- Retorna el la ruta del fichero que contiene la funcion
#-------------------------------------------------------------------
#E xamea_php captura  -- Devuelve el fichero que tiene la funcion
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


#--------------------------------------------------------------------
# damea_php
#--------------------------------------------------------------------

damea_php()
{
IS_damea_php="Devuelve la la ruta del archivo que contiene la funcion"
INFO_SCRIPT=${IS_damea_php}

FILTRO=$1

#-Debe ir a la ruta de Php - Falta establecerla

if [ "${FILTRO}" != "" ] ; then

RUTA_ACTUAL=$PWD

RUTA_PHP=/home/ibm/scripts_ibm/web/objetos/

cd ${RUTA_PHP}

ff | xargs grep -l "function ${FILTRO}" 

cd ${RUTA_ACTUAL}
else
# Lo ideal seria llamar a e_pmt damef damef function

e_pmi damef "funcion"

fi


}


#--------------------------------------------------------------------
# xamea_php
#--------------------------------------------------------------------

xamea_php()
{
IS_xamea_php="Devuelve el nombre del archivo que contiene la funcion"
INFO_SCRIPT=${IS_xamea_php}

FILTRO=$1

if [ "${FILTRO}" != "" ] ; then

FUNCION=$( damea_php ${FILTRO}  )

if [ "${FUNCION}" != "" ] ; then
basename ${FUNCION}
fi

else
# Lo ideal seria llamar a e_pmt damef damef function

e_pmi xamea_php "funcion"

fi


}



