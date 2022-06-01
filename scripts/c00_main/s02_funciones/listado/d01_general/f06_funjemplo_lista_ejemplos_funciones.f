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
CONCEPT_ARQUETIPO_04="listado"
CONCEPT_VARIANTE_04=""
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-==================================================================
#+ Funciones definidos:
#-------------------------------------------------------------------
#-- funjemplo
#-====----========----========----========----========----========--
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- listafune
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lista los ejemplos de as funciones que se ajustan a los tags solicitados
#-------------------------------------------------------------------
#T listado tags funciones
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P TAG [<LISTA DE TAGS>]
#-------------------------------------------------------------------
#-- Ejemplos :
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#E funjemplo listado carpetas
#-==================================================================

#-El objetivo es aprovechar un sistema de metatags implantado
#-Conseguimos salida bonita con column
funjemplo()
{
IS_funjemplo="Lista los ejemplos de funciones que se ajustan a los tags solicitados"
INFO_SCRIPT=${IS_funjemplo}


if [ ${1} != "" ] ; then

#- Preparamos el retorno con "cd -"
RUTA_ACTUAL=${PWD}

OLDPWD=${RUTA_ACTUAL}

#-De entrada localizamos la ruta de Scripts
cd ${S_RCT}

#- Preparamos la consulta recursiva
LISTAPAR=(${@})

len=$#
let len--
CADENA=
cont=0

while [ ${cont} -lt ${len} ] ; do
CADENA="${CADENA} | grep ${LISTAPAR[$cont]}"
let cont++

done

#-Tenemos la cadena con todos los GREP
#-Sacamos la lista de ficheros con META TAGS

## Para completar la cadena usaremos una funcion que utilice un archivo

CADENA="find $PWD -type f | xargs grep '^#E ' ${CADENA} | cut -d ':' -f1" 


#- Aqui tambien metemos un bucle - conseguimos que se puedan pasar todos los parametros
## f ${EXTENSION} | grep ${LISTAPAR[1]} | grep ${FILTRO[2} | grep ${FILTRO_03}   ;

for i in $( eval ${CADENA}  ) ; do
listafune $i
done


#-Vuelta a la ruta de partida
cd ${RUTA_ACTUAL}

else
e_pmi funjemplo "lista de tags"

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
