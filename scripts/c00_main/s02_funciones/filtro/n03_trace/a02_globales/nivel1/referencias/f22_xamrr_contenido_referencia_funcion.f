#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="5.1" #  Version del Script actual
FECHA_SCRIPT="Mayo 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
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
#-- damrf - damrr - xamrr
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- f - S_RCT
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Devuelve los objetos definidos ( Variables - Alias - Funciones ... )
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T informacion funciones objetos
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P FUNCION
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
# damrf   -- Las referencias a las funciones de los archivos
#-------------------------------------------------------------------
#E damrf fa3
#E ./c00_main/s02_funciones/filtro/n01_find/f08_f3.f:#-- fa3 - f4 - f5
#-------------------------------------------------------------------
#E damrr fa3   --> Nos da solo la ruta que contiene la funcion
#E # ./c00_main/s02_funciones/filtro/n01_find/f08_f3.f
#-------------------------------------------------------------------
#E xamrf fa3
#E #-- fa3 - f4 - f5
#-==================================================================

#--------------------------------------------------------------------
# FUNCION damrf
#--------------------------------------------------------------------

# Te devuelve las referencias a la funcion 
damrf()
{
IS_damrf="Devuelve solo las referencias a la funcion y la linea correspondiente"
INFO_SCRIPT=${IS_damrf}

FILTRO=$1
if [ "${FILTRO}" != "" ] ; then

RUTA_ACTUAL=$PWD

cd ${S_RCT}

f f | xargs grep "$FILTRO " | grep -v ":#" | grep -v ":e_" | grep -v "IS_${FILTRO}" |  grep -v "$FILTRO()" 

COD_RET=$?

if [ ${COD_RET} -gt 0 ] ; then
e_pmp damefr "funcion" "No existe la funcion ${FILTRO}"
fi

cd ${RUTA_ACTUAL}

else
# Lo ideal seria llamar a e_pmt damef damef function

e_pmi damrf "funcion"

fi

}

#--------------------------------------------------------------------
# FUNCION damrr
#--------------------------------------------------------------------

# Te devuelve las lineas que referencian el uso de la funcion
damrr()
{
IS_damrr="Devuelve solo las referencias a la funcion. Los ficheros que la incluyen"
INFO_SCRIPT=${IS_damrr}

FILTRO=$1

if [ "${FILTRO}" != "" ] ; then

#- Sin argumento te devuelve alguna funcion

RUTA_ACTUAL=$PWD

cd ${S_RCT}

f f | xargs grep "$FILTRO " | grep -v ":#" | grep -v ":e_" | grep -v "IS_${FILTRO}" | grep -v "$FILTRO()" | cut -d ":" -f1 

COD_RET=$?

if [ ${COD_RET} -gt 0 ] ; then
e_pmp damerr "funcion" "No existe la funcion ${FILTRO}"
fi

cd ${RUTA_ACTUAL}

else
# Lo ideal seria llamar a e_pmt damef damef function

e_pmi damrr "funcion"

fi
}


#--------------------------------------------------------------------
# FUNCION xamrf
#--------------------------------------------------------------------

# Te devuelve las lineas que referencian el uso de la funcion
xamrf()
{
IS_xamrf="Devuelve solo las referencias a la funcion. No informa de los ficheros"
INFO_SCRIPT=${IS_xamrf}

FILTRO=$1

if [ "${FILTRO}" != "" ] ; then

#- Sin argumento te devuelve alguna funcion

RUTA_ACTUAL=$PWD

cd ${S_RCT}

f f | xargs grep "$FILTRO " | grep -v ":#" | grep -v ":e_" | grep -v "IS_${FILTRO}" | grep -v "$FILTRO()" | cut -d ":" -f2- 

COD_RET=$?

if [ ${COD_RET} -gt 0 ] ; then
e_pmp damefr "funcion" "No existe la funcion ${FILTRO}"
fi

cd ${RUTA_ACTUAL}

else
# Lo ideal seria llamar a e_pmt damef damef function

e_pmi xamrf "funcion"

fi
}

