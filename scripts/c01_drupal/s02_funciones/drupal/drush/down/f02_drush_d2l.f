#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="V 5.3"          #  Version del Script actual
FECHA_SCRIPT="Julio 2016"
STATUS_SCRIPT="Pendiente"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_MOLDE="funcion"
CONCEPT_ARQUETIPO="drush"
CONCEPT_LEVEL="Script $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} ${CONCEPT_CARACTER}"
#-==================================================================
#+ Funciones definidos:
#-------------------------------------------------------------------
#-- d2l		--> Drush download V2
#-====----========----========----========----========----========--
#- Drupal Drush - La shell de drupal (requiere que est� instalada )
#-====----========----========----========----========----========--
#-- Parametros :
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- 1. Componente a descargar ( por defecto el de la ruta actual )
#-------------------------------------------------------------------
#-- Ejemplos :
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- d2l	--> No hace nada 
#-------------------------------------------------------------------
#-- d2l cck 5 --> Baja cck-5.x-1.x-dev
#-------------------------------------------------------------------
#-- ddl cck 6 3 --> Baja cck-6.x-3.x-dev
#-------------------------------------------------------------------
#-- ddl cck 6 3.1 --> Baja cck-6.x-3.1
#-==================================================================

d2l()
{
INFO_SCRIPT="Descarga via drush el modulo y version que se le indique"

# La idea es generar drush ddl ampliado
#
#- Como minimo debe recibir 2 parametros


NUMERO_PARAMETROS=$#
MODULO=$1
VERSION=$2
SUBVERSION=$3
ERROR=0


case ${NUMERO_PARAMETROS} in
'3' )
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#- Estamos en este caso
#------------------------------------------------------------------
#- ddl cck 6 3[.1]
#------------------------------------------------------------------
#-- ddl cck 6 3 --> Baja cck-6.x-3.x-dev
#------------------------------------------------------------------

# Lo primero es saber la longitud de la subversion

SUBVER_LEN=`echo ${SUBVERSION} | awk '{print length($1) }'`

if [ "${SUBVER_LEN}" = "1" ] ; then
#- Estamos en el caso simple
VERSION_FINAL=${VERSION}.x-${SUBVERSION}.x-dev
else
#-- ddl cck 6 3.1 --> Baja cck-6.x-3.1
VERSION_FINAL=${VERSION}.x-${SUBVERSION}
fi

;;
'2' )
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
#- Por defecto la 7.x
#------------------------------------------------------------------
#-- d2l cck 7 --> Baja cck-7.x-1.x-dev
#-- d2l cck 7 3.1 --> Baja cck-7.x-3.1

SUBVER_LEN=`echo ${VERSION} | awk '{print length($1) }'`

if [ "${SUBVER_LEN}" = "1" ] ; then
#- Estamos en el caso simple
VERSION_FINAL=7.x-${VERSION}.x-dev
else
#-- ddl cck 6 3.1 --> Baja cck-6.x-3.1
VERSION_FINAL=7.x-${VERSION}
fi
;;
*)
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
#- Si no es ninguno de los otros casos, la orden esta mal

e_pmi d2l "${MODULO} ${VERSION} ${SUBVERSION}"

ERROR=1
;;
esac

#- Lanzamos Drush

if [ $ERROR == "0" ] ; then
echo "Lanzamiento drush ${MODULO}-${VERSION_FINAL}"
drush dl ${MODULO}-${VERSION_FINAL} --destination=.

else

e_pmi drush "${MODULO} ${VERSION} ${SUBVERSION}" 

fi

#-====----========----========----========----========----========--

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

