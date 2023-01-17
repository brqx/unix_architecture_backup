#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2022
#-------------------------------------------------------------------
VERSION_SCRIPT="2.5" #  Version del Script actual
FECHA_SCRIPT="Julio 2022"
STATUS_SCRIPT="pending"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="special"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#L-- colors - brqz
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Establece un prompt que se basa en la ultima ruta de la estructura de directorios
#-------------------------------------------------------------------
#T generacion prompt
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E putblue   -- Prepara el prompt con una cadena indicada
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

# *red - green - yellow - blue - magent - black
# cyan - white

putred()
{
IS_putred="Put red color text"
INFO_SCRIPT=${IS_putred}

INFO=$1

if [ "${INFO}" == "-?" ] ; then

e_pmt manage_short_paths

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

enablered
echo -n "${*}"
setreset
#echo ""

fi

}

# red - *green - yellow - blue - magent - black
# cyan - white

putgreen()
{
IS_putgreen="Put green color text"
INFO_SCRIPT=${IS_putgreen}

INFO=$1

if [ "${INFO}" == "-?" ] ; then

e_pmt manage_short_paths

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

enablegreen 
echo -n "${*}"
setreset
#echo ""

fi

}


#-------------------------------------------------------------------
# red - green - *yellow - blue - magent - black
# cyan - white

putyellow()
{
IS_putyellow="Put yellow color text"
INFO_SCRIPT=${IS_putyellow}

INFO=$1

if [ "${INFO}" == "-?" ] ; then

e_pmt manage_short_paths

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

enableyellow
echo -n "${*}"
setreset
textreset
#echo ""

fi

}


#-------------------------------------------------------------------
# red - green - yellow - *blue - magent - black
# cyan - white

putblue()
{
IS_putblue="Put blue color text"
INFO_SCRIPT=${IS_putblue}

INFO=$1

if [ "${INFO}" == "-?" ] ; then

e_pmt manage_short_paths

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

enableblue 
echo -n "${*}"
setreset
#echo ""

fi

}


#-------------------------------------------------------------------
# red - green - yellow - blue - *magent - black
# cyan - white


putmagent()
{
IS_putmagent="Put magent color text"
INFO_SCRIPT=${IS_putmagent}

INFO=$1

if [ "${INFO}" == "-?" ] ; then

e_pmt manage_short_paths

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

enablemagent
echo -n "${*}"
setreset
#echo ""

fi

}


#-------------------------------------------------------------------
# red - green - yellow - *lue - magent - *black
# cyan - white

putblack()
{
IS_putblack="Put black color text"
INFO_SCRIPT=${IS_putblack}

INFO=$1

if [ "${INFO}" == "-?" ] ; then

e_pmt manage_short_paths

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

enableblack
echo -n "${*}"
setreset
#echo ""

fi

}


#-------------------------------------------------------------------
# red - green - yellow - *lue - magent - black
# *cyan - white

putcyan()
{
IS_putcyan="Put cyan color text"
INFO_SCRIPT=${IS_putcyan}

INFO=$1

if [ "${INFO}" == "-?" ] ; then

e_pmt manage_short_paths

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

enablecyan
echo -n "${*}"
setreset
#echo ""

fi

}


#-------------------------------------------------------------------
# red - green - yellow - blue - magent - black
# cyan - *white

putwhite()
{
IS_putwhite="Put white color text"
INFO_SCRIPT=${IS_putwhite}

INFO=$1

if [ "${INFO}" == "-?" ] ; then

e_pmt manage_short_paths

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

enablewhite
echo -n "${*}"
setreset
#echo ""

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
