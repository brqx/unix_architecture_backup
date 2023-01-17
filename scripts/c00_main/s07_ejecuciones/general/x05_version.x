#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.0"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_MOLDE="ejecuciones"
CONCEPT_ARQUETIPO="terminal"
CONCEPT_LEVEL="Lista de $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO}"
#-==================================================================
#+ Ejecuciones:
#-------------------------------------------------------------------
#-- version lenguajes
#-------------------------------------------------------------------


echo "=============================================================="
echo "Anagrama: $ANAGRAMA Temporada: $TEMPORADA "
echo "--------------------------------------------------------------"
echo "Profile : $VERSION_PROFILE - Fecha : $FECHA_PROFILE"
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"

#-------------------------------------------------------------------
#- java php python perl jython
#-------------------------------------------------------------------

echo "Version de Java actual   : ${VERSION_JAVA}    -  $( which java   )"

if [ "${EXISTE_PHP}" == "0" ]  ; then
echo "Version de Php actual    : ${VERSION_PHP}     -  $( which php    )"
fi

if [ "${EXISTE_PERL}" == "0" ]  ; then
echo "Version de Perl actual   : ${VERSION_PERL}    -  $( which perl   )"
fi

if [ "${EXISTE_RUBY}" == "0" ]  ; then
echo "Version de Ruby actual   : ${VERSION_RUBY}    -  $( which ruby   )"
fi


echo "=============================================================="
