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
CONCEPT_ARQUETIPO_04="lcore"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- xnp_exec  ( Enlaza PACK --- WWW )
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#--
#-------------------------------------------------------------------
#- Ejemplos ( siempre debe recibir 3 parametros - ya tratados - )
#-------------------------------------------------------------------
#- xnp_exec modules bas 50
#-==================================================================

#- Enlace agil contra paquete desde proyectos
#- Ejecuta la seleccion pasada
#-- Recive como parametro :
#-------------------------------------------------------------------
#-- 1. Tipo de componente
#-- 2. Nombre del paquete
#-- 3. Version de Drupal ( por defecto 5.0 )
#-------------------------------------------------------------------

xnp_exec()
{
INFO_SCRIPT="Enlaza nivel de SITE (Nivel WWW )  con los paquetes ( Nivel PAK )"


TIPO_COMPONENTE=$1
PAQUETE_COMPONENTE=$2
VERSION_COMPONENTE=$3

RUTA_PROYECTO=$PWD

# No se han pasado los 3 parametros
if [ "${VERSION_COMPONENTE}" == "" ] ;  then
#-==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==

e_pmi xnp_exec "${TIPO_COMPONENTE}  ${PAQUETE_COMPONENTE}  ${VERSION_COMPONENTE}"
#-====----========----========----========----========----========--
else
#-==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
#- Los parametros pasados SON correctos

RUTA_PRODUCTO_PROD=${RUTA_PROYECTO}/${PAQUETE_COMPONENTE}

#-------------------------------------------------------------------
#Hay que enlazar : /brqx/pack/drupal/v50/themes/bas
#En                /home/www/fic/sites/all/modules/base/bas
#-------------------------------------------------------------------

RUTA_LNK=/brqx/pack/drupal/v${VERSION_COMPONENTE}/${TIPO_COMPONENTE}/
RUTA_ENLACE_PROD=${RUTA_LNK}${PAQUETE_COMPONENTE}

echo "RUTA ORIGEN : $RUTA_PRODUCTO_PROD"
echo "RUTA DESTINO: $RUTA_ENLACE_PROD"
unlink ${RUTA_PRODUCTO_PROD}
ln -s  ${RUTA_ENLACE_PROD} ${RUTA_PRODUCTO_PROD}

#-====----========----========----========----========----========--
fi


}
