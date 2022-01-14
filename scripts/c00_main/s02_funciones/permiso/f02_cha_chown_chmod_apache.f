#!/bin/bash
#-------------------------------------------------------------------
# Funcion General Vista Version - Proyecto Brqx - Brqx Org
# Brqx Org - Rct - 2015
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.0"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2015"
#-==================================================================
#- Funciones
#-------------------------------------------------------------------
# + cha ( Cambia de permiso y de usuario)
#-------------------------------------------------------------------

 #
 #+ Recibe como parametros :
 #
 # 1.Usuario pasado : zb/zb

cha()
{
MULTIUSUARIO=$1
if [ "${MULTIUSUARIO}" == "" ]; then
MULTIUSUARIO=apache
fi
chown -R ${MULTIUSUARIO}:apache *					2> /dev/null
chmod -R 775 *																2> /dev/null
chown -R ${MULTIUSUARIO}:apache .htaccess		2> /dev/null
chmod -R 775 * .htaccess											2> /dev/null
}
