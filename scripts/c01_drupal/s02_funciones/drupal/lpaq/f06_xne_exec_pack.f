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
CONCEPT_PRODUCTO_04="drupal"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="lpaq"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- xne_exec
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#- Ejemplos ( siempre debe recibir 3 parametros - ya tratados - )
#-------------------------------------------------------------------
#- xne modules pathauto bas 50
#-==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==

#- Enlace agil contra modulos de produccion
#- Ejecuta la seleccion pasada
#-- Recive como parametro :
#-------------------------------------------------------------------
#-- 1. Tipo de componente ( por defecto modules )
#-- 2. Nombre del componente
#-- 3. Paquete ( por defecto bas )
#-- 4. Version de Drupal ( por defecto 5.0 )
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


xne_exec()
{

TIPO_COMPONENTE=$1
NOMBRE_COMPONENTE=$2
PAQUETE_COMPONENTE=$3
VERSION_COMPONENTE=$4

# No se han pasado los 3 parametros
if [ "${VERSION_COMPONENTE}" == "" ] ;  then
#-==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==

e_pmi xne_exec "${TIPO_COMPONENTE}  ${NOMBRE_COMPONENTE}  ${PAQUETE_COMPONENTE}  ${VERSION_COMPONENTE}"

else
#- Los parametros pasados SON correctos


RUTA_ENLACE=/brqx/lnk/drupal/v${VERSION_COMPONENTE}/${TIPO_COMPONENTE}/abc/
LETRA=$( echo ${NOMBRE_COMPONENTE} | cut -c1)
RUTA_ENLACE_COMPLETA=${RUTA_ENLACE}${LETRA}/${NOMBRE_COMPONENTE}

#Vamos a por la ruta del paquete

if [ "${VERSION_DRUPAL}" == "50" ] ; then
PACK_NAME=pack
else
PACK_NAME=plive
fi

RUTA_PAQ_FIJA=/brqx/${PACK_NAME}/drupal/v${VERSION_COMPONENTE}/${TIPO_COMPONENTE}/
RUTA_PAQ_COMPLETA=${RUTA_PAQ_FIJA}${PAQUETE_COMPONENTE}/${LETRA}/${NOMBRE_COMPONENTE}

echo "RUTA ORIGEN : $RUTA_ENLACE_COMPLETA"
echo "RUTA DESTINO: $RUTA_PAQ_COMPLETA"
lnk ${RUTA_ENLACE_COMPLETA} ${RUTA_PAQ_COMPLETA}


#-==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
fi


}
