#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="5.1" #  Version del Script actual
FECHA_SCRIPT="Octubre 2011"
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
#-- xamef
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- f - S_RCT
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Devuelve el nombre del archivo que contiene la funcion
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
#E xamef fa3 -- f08_fa3.f
#-==================================================================

#--------------------------------------------------------------------
# FUNCION xamef
#--------------------------------------------------------------------

# Te devuelve solo la ruta del archivo que contiene la funcion 
xamef()
{
IS_xamef="Devuelve solo el archivo que contiene la funcion, sin la ruta al mismo"
INFO_SCRIPT=${IS_xamef}

RUTA_ACTUAL=$PWD


FILTRO=$1

if [ "${FILTRO}" != "" ] ; then
cd ${S_RCT}


RESULTADO=$(f f | xargs grep "^$FILTRO()" | cut -d ":" -f1 )

COD_RET=$?

if [ ${COD_RET} -gt 0 ] ; then
#---==------==------==------==------==------==------==------==------
e_pmp xamep "funcion" "No existe la funcion ${FILTRO}"
else

if [ "$RESULTADO" != "" ] ; then
echo "$(basename ${RESULTADO} )" 2> /dev/null
fi

#---==------==------==------==------==------==------==------==------
fi

cd ${RUTA_ACTUAL}

else
# Lo ideal seria llamar a e_pmt damef damef function

e_pmi xamef "funcion"

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

