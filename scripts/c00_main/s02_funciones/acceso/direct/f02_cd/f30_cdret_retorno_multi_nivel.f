#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2022
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Enero 2022"
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
#-- cdret - cdone
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- ll - retcd
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
#E cdret 5	-- Retrocede 5 niveles
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
 
cdret()
{
IS_cdret="Vuelve N niveles pero guarda como retorno la ruta inicial"
INFO_SCRIPT=${IS_cdret}

NIVELES=$1

if [ "${NIVELES}" == "" ] ;  then
NIVELES=1
fi

if [ "${NIVELES}" = "-?" ] ;  then
e_pmp cdret "Niveles de vuelta"

else

#- Es la ruta a la que vamos a regresar si ejecutamos "cd -"
#- Variable OLDPWD

retcd ${NIVELES}

ll

#-Salida de informacion parametrizada 

##e_pmi2 cdret "Ruta anterior: ${OLDPWD}" "Puede volver con (cd -)"

#-Esta parte queda aplazada - hay que mejorar la presentacion de informacion
##e_pmi3 cdret "Ruta anterior:" "${OLDPWD}" "Puede volver con (cd -)"

# Ajuste de formato del prompt
brqz

fi
}

#-------------------------------------------------------------------

cdone()
{
IS_cdone="Vuelve 1 nivel. Es el cd.. pero para habilitar brqz"
INFO_SCRIPT=${IS_cdone}

NIVELES=$1

if [ "${NIVELES}" = "-?" ] ;  then
e_pmp cdret "Niveles de vuelta"

else

#- Es la ruta a la que vamos a regresar si ejecutamos "cd -"
#- Variable OLDPWD

cd ..

# brqz

ll

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
