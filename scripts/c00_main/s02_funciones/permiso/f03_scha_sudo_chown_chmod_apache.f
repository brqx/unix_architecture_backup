#!/bin/bash
#-------------------------------------------------------------------
# Funcion General Vista Version - Proyecto Brqx - Brqx Org
# Brqx Org - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.1"          #  Version del Script actual
FECHA_SCRIPT="Agosto 2016"
#-==================================================================
#- Funciones
#-------------------------------------------------------------------
# + scha ( Cambia de permiso y de usuario)
#-------------------------------------------------------------------

 #
 #+ Recibe como parametros :
 #
 # 1.Usuario pasado : zb/zb

scha()
{
MULTIUSUARIO=$1
if [ "${MULTIUSUARIO}" == "" ]; then
MULTIUSUARIO=apache
fi
sudo chown -R ${MULTIUSUARIO}:apache *					2> /dev/null
sudo chmod -R 775 *																2> /dev/null
sudo chown -R ${MULTIUSUARIO}:apache .htaccess		2> /dev/null
sudo chmod -R 775 * .htaccess											2> /dev/null
}
