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
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="filtro"
CONCEPT_VARIANTE_04="trace"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- damejer
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- xamela - xamell - damela - damell
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Devuelve la jerarquia de llamadas a dicha funcion
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T jerarquia listas
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P FUNCION
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E damejer f2  --  Jerarquia de llamadas (rutas) para invocar a f2
#-------------------------------------------------------------------
#E xamejer f3  --  Jerarquia de llamadas (ficheros )para invocar a f3
#-------------------------------------------------------------------

#--------------------------------------------------------------------
# damejer
#--------------------------------------------------------------------

damejer()
{
IS_xamejer="Lista la jerarquia de llamadas. Las rutas completas"
INFO_SCRIPT=${IS_damejer}


FUNCION=$1

if [ "${FUNCION}" != "" ] ;  then

LISTA=$( xamela ${FUNCION} )
LISTA_FULL=$( damela ${FUNCION} )


echo ${LISTA_FULL}

while [ "${LISTA}" != "" ] ; do

LISTA_2=$( xamell ${LISTA} )
LISTA_FULL_2=$( damell ${LISTA} )

echo ${LISTA_FULL_2}

LISTA=${LISTA_2}
done

#-------------------------------------------------------------------
else

e_pmi damejer "funcion" 

fi

}

#--------------------------------------------------------------------
# xamejer
#--------------------------------------------------------------------


# Te el listado de ficheros que incluyen el archivo en la jerarquia
#- Anteriormente se llamaba damela
xamejer()
{
IS_xamejer="Lista la jerarquia de llamadas. Solo los archivos"
INFO_SCRIPT=${IS_xamejer}


#- Paso uno - Solicitamos la primera lista, que contiene el archivo

FUNCION=$1

if [ "${FUNCION}" != "" ] ;  then

LISTA=$( xamela ${FUNCION} )

while [ "${LISTA}" != "" ] ; do

LISTA_2=$( xamell ${LISTA} )

echo $LISTA

LISTA=${LISTA_2}
done

#-------------------------------------------------------------------
else

e_pmi xamejer "funcion" 

fi

}
