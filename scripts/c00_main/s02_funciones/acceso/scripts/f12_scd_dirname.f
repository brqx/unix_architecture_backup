#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Junio 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="acceso"
CONCEPT_VARIANTE_04="scripts"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- scd
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Accede a una ruta filtrando el final partiendo de la ruta de SCRIPTS - comando dirname
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T acceso cd scripts
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P RUTA_CON_O_SIN_ARCHIVO
#-------------------------------------------------------------------
#- Muy util para entrar en la ruta de un archivo
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E scd  /aaaa/bbb/capu.x  -- Entra en <ruta_scripts>/aaaa/bbb
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
 
#- Esta funcion parte de la ruta actual, pero puede ser util en una ruta base  
#- En este caso parte de la ruta de scripts
scd()
{

IS_scd="Accede a una ruta filtrando el final partiendo de la ruta de SCRIPTS - comando dirname"
INFO_SCRIPT=${IS_scd}

#- Preparamos el retorno con "cd -"
RUTA_ACTUAL=${PWD}

OLDPWD=${RUTA_ACTUAL}

#- Nuestro objetivo es ir a la ruta de la funcion
cd ${S_RCT}


if [ "${1}" != "" ] ;  then

  CARPETA_DESTINO=`dirname $1` ;
  cd ${CARPETA_DESTINO} && ll ;

else
e_pmi scd "ruta"

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
