#!/usr/bin/bash
#-------------------------------------------------------------------
# Funcion General Vista Version - Proyecto Brqx - Brqx Org
# Brqx Org - Rct - 2007
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.0"          #  Version del Script actual
FECHA_SCRIPT="Septiembre 2007"
#-==================================================================
#- Funciones
#-------------------------------------------------------------------
# + cw ( Cambia de permiso al usuario que se le diga )
#-------------------------------------------------------------------

 #
 #+ Recibe como parametros :
 #
 # 1.Usuario pasado : zb/zb


  cw()
  {
  MULTIUSUARIO=$1
  if [ "$MULTIUSUARIO" != "" ]; then
  echo "Vamos a cambiar archivos al usuario : ${MULTIUSUARIO}"
  chown -R ${MULTIUSUARIO}:${MULTIUSUARIO} *
  fi
  }
