#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="2.5" #  Version del Script actual
FECHA_SCRIPT="Julio 2016"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="drupal"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="lcore"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- xnb_exec
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#--
#-------------------------------------------------------------------
#- Ejemplos ( siempre debe recibir 3 parametros - ya tratados - )
#-------------------------------------------------------------------
#E xnb modules pathauto 50
#E xnb nodejs 80
#-==================================================================

#- Enlace agil contra modulos de produccion
#- Ejecuta la seleccion pasada
#-- Recive como parametro :
#-- 1. Tema a enlazar

xnb_exec()
{

TIPO_COMPONENTE=$1
NOMBRE_COMPONENTE=$2
VERSION_COMPONENTE=$3

# No se han pasado los 3 parametros
if [ "${VERSION_COMPONENTE}" == "" ] ;  then
#-==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==

echo "Los parametros pasados no son correctos"
echo "---------------------------------------"
echo "${TIPO_COMPONENTE}  ${NOMBRE_COMPONENTE}  ${VERSION_COMPONENTE}"
else


RUTA_PROD=/brqx/base/drupal/v${VERSION_COMPONENTE}/${TIPO_COMPONENTE}/abc/
LETRA=$(echo ${NOMBRE_COMPONENTE} | cut -c1)
RUTA_COMPLETA=${RUTA_PROD}${LETRA}/${NOMBRE_COMPONENTE}

if  [ "${VERSION_COMPONENTE}" == "80" ] ;  then
###--- CAMBIOS PARA 80
INFO_FILE_EXT=info.yml
else
INFO_FILE_EXT=info
fi

LINEAS_FIND=$(		find ${RUTA_COMPLETA} -name "${NOMBRE_COMPONENTE}.${INFO_FILE_EXT}" | head -1 | wc -l		)
FIND_PROD=$(		find ${RUTA_COMPLETA} -name "${NOMBRE_COMPONENTE}.${INFO_FILE_EXT}" | head -1 				)

FIND_PROD_PROB=$(	find ${RUTA_COMPLETA} -type f | head -1 												)


#--- CAMBIOS PARA 80 - 70 - 50

#Si no hay lineas no se puede hacer el for

if [ "${LINEAS_FIND}" == "1" ] ; then
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
RUTA_PRODUCTO_PROD=$(dirname ${FIND_PROD}		)
else
#-Solucionamos el problema de modulo problematico al no tener fichero de modulo
echo "${TIPO_COMPONENTE} PROBLEMATICO PERO SE ENLAZA : ${NOMBRE_COMPONENTE}"

RUTA_PRODUCTO_PROD=$(dirname ${FIND_PROD_PROB} 	)
fi

#YA TENEMOS LA RUTA DE PRODUCCION

#-------------------------------------------------------------------
#Hay que enlazar : /brqx/prod/drupal/v50/themes/abc/a/activesite/activesite_2_5
#En                /brqx/lnk/drupal/v50/themes/abc/a/activesite
#-------------------------------------------------------------------

RUTA_LNK=/brqx/lnk/drupal/v${VERSION_COMPONENTE}/${TIPO_COMPONENTE}/abc/

FOLDER_ENLACE_PROD="${RUTA_LNK}${LETRA}"
RUTA_ENLACE_PROD=${FOLDER_ENLACE_PROD}/${NOMBRE_COMPONENTE}

#-Si no existe ruta LNK, se crea

if [ -d "${FOLDER_ENLACE_PROD}" ] ; then
A=B
else
mkdir -p ${FOLDER_ENLACE_PROD}				2> /dev/null
fi

echo "RUTA ORIGEN : $RUTA_PRODUCTO_PROD"
echo "RUTA DESTINO: $RUTA_ENLACE_PROD"
lnk  ${RUTA_PRODUCTO_PROD} ${RUTA_ENLACE_PROD}

chow ${RUTA_PRODUCTO_PROD} ${RUTA_ENLACE_PROD}


#-==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
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
#limpia_variables;
#-==================================================================
