#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2019
#-------------------------------------------------------------------
VERSION_SCRIPT="V 5.1"          #  Version del Script actual
FECHA_SCRIPT="Junio 2019"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_MOLDE="ejecuciones"
CONCEPT_ARQUETIPO="terminal"
CONCEPT_LEVEL="Lista de $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO}"
#-==================================================================
#+ Ejecuciones:
#-------------------------------------------------------------------
#-- editor - retroceso - clear
#-------------------------------------------------------------------

#- Definicion del editor
#-=================================-

#set -o vi
set -o emacs

#- Establecemos caracter de borrado
#-=================================-

stty erase ^?

#- Limpiamos la pantalla
#-=================================-
##clear

#- Insertamos en el path la ruta de XWindows
#-=================================-

PATH=$PATH:/usr/share/terminfo/x

#- Preparamos el entorno de Ruby On Rails

PATH=$PATH:/opt/ruby/rbenv/bin


