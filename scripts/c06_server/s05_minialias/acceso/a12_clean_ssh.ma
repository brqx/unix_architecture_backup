#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.1"          #  Version del Script actual
FECHA_SCRIPT="Enero 2013"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_MOLDE="minialias"
CONCEPT_ARQUETIPO="acceso"
CONCEPT_LEVEL="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO}"
#-==================================================================
#+ Alias definidos:
#-------------------------------------------------------------------
#-- xsh - sx - sfx
#-- s50 - sf50
#-- ay - by - cy - dx - ex - fx - gx - hx - ix - jx
#-------------------------------------------------------------------
#+ Funciones requeridas:
#-------------------------------------------------------------------
#-- con_ssh
#-==================================================================

# Mini Alias - Brqx Cpanel
#-====================================-

alias ayy='clean_dir_to_abrqx'
alias byy='clean_dir_to_bbrqx'
alias cyy='clean_dir_to_cbrqx'
alias dyy='clean_dir_to_dbrqx'
alias eyy='clean_dir_to_ebrqx'
alias fyy='clean_dir_to_fbrqx'
alias gyy='clean_dir_to_gbrqx'
alias hyy='clean_dir_to_hbrqx'
alias iyy='clean_dir_to_ibrqx'
alias jyy='clean_dir_to_jbrqx'
alias kyy='clean_dir_to_kbrqx'
alias lyy='clean_dir_to_lbrqx'
alias myy='clean_dir_to_mbrqx'
alias nyy='clean_dir_to_nbrqx'
alias oyy='clean_dir_to_obrqx'
alias pyy='clean_dir_to_pbrqx'
alias qyy='clean_dir_to_qbrqx'
alias ryy='clean_dir_to_rbrqx'
alias syy='clean_dir_to_sbrqx'
alias tyy='clean_dir_to_tbrqx'
alias uyy='clean_dir_to_ubrqx'
alias vyy='clean_dir_to_vbrqx'
alias wyy='clean_dir_to_wbrqx'
alias xyy='clean_dir_to_xbrqx'
alias yyy='clean_dir_to_ybrqx'
alias yyz='clean_dir_to_zbrqx'

#- Super alias de sincronismo absoluto - lanzado desde px
#-Replica eliminando previamente contenido
alias yyh='byy && dyy && pyy && qyy && hyy && tyy && fyy'; # && ux'
alias yyg='tyy && gyy && qyy && iyy' # Replicate to cluster members
alias yye='eyy && fyy'
