#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Julio 2011"
STATUS_SCRIPT="all_checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="acceso"
CONCEPT_VARIANTE_04="direct"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- genr
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - gene
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Entra recursivamente en todas los vocablos indicados
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T acceso cd parametros
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [<lista indicadores>]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E genr aM4  ( entraria en la carpeta /app/Mufac/v04 )
#-------------------------------------------------------------------
#E genr app fac 04
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
 
#-Generico para cr
genr()
{
IS_genr="Accede a la ruta de composicion indicada"
INFO_SCRIPT=${IS_genr}

EXPR_PASADA=$1

if [ "${EXPR_PASADA}" == "" ] ;  then
EXPR_PASADA="-?"
fi

if [ "${EXPR_PASADA}" == "-?" ] ;  then
#- Informar de los parametros
e_pmi genr "multiples cadenas"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------
RUTA_ACTUAL_genr=${PWD}

NUM_INDICADORES=${#}

#-- Inicio del Case
case ${NUM_INDICADORES} in
'1' )

CADENA=$1;

echo $CADENA

LETRA=$(echo $CADENA | cut -c1);
CONT=2;

while  [ "${LETRA}" != "" ] ; do
gene "${LETRA}"

##echo "Entra en ${LETRA} - ${CONT}";
LETRA=$(echo ${CADENA} | cut --characters="${CONT}" );

CONT=$(expr $CONT + 1 );
done

;;
*)
# En este caso los saltos van delimitados por espacios
CADENA=$1;
CONT=2;
PARAMETROS=$@

for n in ${PARAMETROS} ; do

CADENA=${n}
gene "${CADENA}"

done
;;
esac
#-- Fin del Case
OLDPWD=${RUTA_ACTUAL_genr}
SALIDA_genr="${SALIDA_gene}"

return ${SALIDA_genr}
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
