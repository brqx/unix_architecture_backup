#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org - MACOS
# Brqx Org - Rct - 2022
#-------------------------------------------------------------------
VERSION_SCRIPT="V 5.1"          #  Version del Script actual
FECHA_SCRIPT="Junio 2022"
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

# Run Shell for MACOS (force to be bash)

## chsh -s /bin/bash
## Changing shell for macminii7.

#

#- Definicion del editor
#-=================================-

#set -o vi
set -o emacs

#- Establecemos caracter de borrado
#-=================================-

# En Mac esto no va
# stty erase ^?

#- Limpiamos la pantalla
#-=================================-
## clear

#- Insertamos en el path la ruta de XWindows ( Solo para linux)
#-=================================-

#- Preparamos el entorno de Ruby On Rails

PATH=$PATH:/opt/ruby/rbenv/bin
