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
#-- ax - bx - cx - dx - ex - fx - gx - hx - ix - jx
#-------------------------------------------------------------------
#+ Funciones requeridas:
#-------------------------------------------------------------------
#-- con_ssh
#-==================================================================

# Mini Alias - Brqx Cpanel
#-====================================-

alias azz='zync_dir_to_abrqx'
alias bzz='zync_dir_to_bbrqx'
alias czz='zync_dir_to_cbrqx'
alias dzz='zync_dir_to_dbrqx'
alias ezz='zync_dir_to_ebrqx'
alias fzz='zync_dir_to_fbrqx'
alias gzz='zync_dir_to_gbrqx'
alias hzz='zync_dir_to_hbrqx'
alias izz='zync_dir_to_ibrqx'
alias jzz='zync_dir_to_jbrqx'
alias kzz='zync_dir_to_kbrqx'
alias lzz='zync_dir_to_lbrqx'
alias mzz='zync_dir_to_mbrqx'
alias nzz='zync_dir_to_nbrqx'
alias ozz='zync_dir_to_obrqx'
alias pzz='zync_dir_to_pbrqx'
alias qzz='zync_dir_to_qbrqx'
alias rzz='zync_dir_to_rbrqx'
alias szz='zync_dir_to_sbrqx'
alias tzz='zync_dir_to_tbrqx'
alias uzz='zync_dir_to_ubrqx'
alias vzz='zync_dir_to_vbrqx'
alias wzz='zync_dir_to_wbrqx'
alias xzz='zync_dir_to_xbrqx'
alias yzz='zync_dir_to_ybrqx'
alias zzz='zync_dir_to_zbrqx'

#- Super alias de sincronismo absoluto - lanzado desde px
#-Replica eliminando previamente contenido
alias zzh='bzz && dzz && pzz && qzz && hzz && tzz && fzz'; # && ux'
alias zzg='tzz && gzz && qzz && izz' # Replicate to cluster members
alias zze='ezz && fzz'
