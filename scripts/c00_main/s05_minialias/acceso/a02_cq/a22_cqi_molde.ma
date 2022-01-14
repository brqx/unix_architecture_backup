#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.0"          #  Version del Script actual
FECHA_SCRIPT="Junio 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_MOLDE="alias"
CONCEPT_ARQUETIPO="acceso"
CONCEPT_LEVEL="Lista de $CONCEPT_MOLDE Comunes"
#-==================================================================
#- * El objetivo es una movilidad rapida por la estructura definida
#-   Aportamos cambio rapido entre directorios de la estructura
#-------------------------------------------------------------------
# 1.-alias         (cqia)   : Alias usados en la configuracion general
# 2.-exportaciones (cqie)   : Exportaciones realizadas en el entorno cargado
# 3.-funciones     (cqif)   : Funciones establecidas para este profile
# 4.-informaciones (cqii)   : Carpeta de traceados e informaciones
# 5.-minialias     (cqim)   : Mini alias definidos en el entorno ejecutado
# 6.-variables     (cqiv)   : Variables establecidas en la configuracion actual
#-------------------------------------------------------------------
#+ Alias definidos:
#-------------------------------------------------------------------
#-- cqia - cqie - cqif - cqii - cqim - cqiv
#-------------------------------------------------------------------
 
#- Alias de acceso por molde ida y vuelta

alias cqia='cd1 && cqa'
alias cqie='cd1 && cqe'
alias cqif='cd1 && cqf'
alias cqii='cd1 && cqi'
alias cqim='cd1 && cqm'
alias cqiv='cd1 && cqv'

#-------------------------------------------------------------------

