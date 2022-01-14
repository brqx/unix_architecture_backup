#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Enero 2012"
STATUS_SCRIPT="all_checked"
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
#-- retcd
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
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
#E retcd 5	-- Retrocede 5 niveles
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Retorno generico
retcd()
{
IS_retcd="Vuelve N niveles pero guarda como retorno la ruta inicial"
INFO_SCRIPT=${IS_retcd}

NIVELES=$1

if [ "${NIVELES}" == "" ] ;  then
NIVELES=1
fi

if [ "${NIVELES}" = "-1" ] ;  then
e_pmp retcd "Niveles de vuelta"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Es la ruta a la que vamos a regresar si ejecutamos "cd -"
#- Variable OLDPWD
RUTA_ACTUAL=$PWD

CONT=0

while [ "${CONT}" != "${NIVELES}" ]
do
cd ..
let CONT++
done

#-Retorno historico 5 niveles
OLDPWD[5]=${OLDPWD[4]}
OLDPWD[4]=${OLDPWD[3]}
OLDPWD[3]=${OLDPWD[2]}
OLDPWD[2]=${OLDPWD}
OLDPWD=${RUTA_ACTUAL}

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
