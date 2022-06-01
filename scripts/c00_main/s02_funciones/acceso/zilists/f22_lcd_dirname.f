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
CONCEPT_VARIANTE_04="zilists"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- lcd
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Acceso partiendo de la ruta de las listas
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T acceso cd listas
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P RUTA_DE_UNA_LISTA
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E lcd  /aaaa/bbb/capu.x  -- Entra en <ruta_listas>/aaaa/bbb
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
 
#- Esta funcion parte de la ruta actual, pero puede ser util en una ruta base  
#- En este caso parte de la ruta de scripts
lcd()
{
IS_lcd="Accede a una ruta filtrando el final partiendo de la ruta de LISTAS - comando dirname"
INFO_SCRIPT=${IS_lcd}

RUTA_ACTUAL=$PWD
#- Preparamos el retorno con "cd -"
OLDPWD=${RUTA_ACTUAL}

#- Nuestro objetivo es ir a la ruta de la funcion
cd ${L_RCT}


if [ "${1}" != "" ] ;  then

  CARPETA_DESTINO=`dirname $1` ;
  cd ${CARPETA_DESTINO} && ll ;

else
e_pmi lcd "ruta"

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
