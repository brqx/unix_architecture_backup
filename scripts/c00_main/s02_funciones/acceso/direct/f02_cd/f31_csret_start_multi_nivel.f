#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2017
#-------------------------------------------------------------------
VERSION_SCRIPT="1.0" #  Version del Script actual
FECHA_SCRIPT="Marzo 2017"
STATUS_SCRIPT="pending"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="acceso"
CONCEPT_VARIANTE_04="direct"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- csret
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- ll
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Vuelve N niveles pero guarda como retorno la ruta inicial
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T acceso cd retorno
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [NIVELES]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E csret 5	-- Retrocede 5 niveles
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
 
csret()
{
IS_cdret="Vuelve N niveles en el inicio de la ruta actual"
INFO_SCRIPT=${IS_cdret}

NIVELES=$1

if [ "${NIVELES}" == "" ] ;  then
NIVELES=1
fi

if [ "${NIVELES}" = "-?" ] ;  then
e_pmp csret "Niveles de desde el inicio"

else

# /mnt/ssd/brqx/arquitectura/unix/scripts/c00_main/s02_funciones/acceso/direct/f02_cd
# cs2 --- go to /brqx/arquitectura/unix/scripts/c00_main/s02_funciones/acceso/direct/f02_cd

#- Es la ruta a la que vamos a regresar si ejecutamos "cd -"
#- Variable OLDPWD
OLDPWD=$PWD

let NIVELES++ ; let NIVELES++ 

RUTA=$(echo $PWD | cut -d '/' -f ${NIVELES}- )

RUTA="/${RUTA}"

# echo "Ruta : ${RUTA}  - Niveles : ${NIVELES}"

if [ -d ${RUTA} ] ; then
cd ${RUTA}
fi

ll
# Ajuste de formato del prompt
# brqz

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
