#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.2"          #  Version del Script actual
FECHA_SCRIPT="Enero 2016"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_MOLDE="minialias"
CONCEPT_ARQUETIPO="acceso"
CONCEPT_LEVEL="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO}"
#-==================================================================
#+ Alias definidos:
#-------------------------------------------------------------------
#-- azx - bzx - czx - dzx - ezx - fzx - gzx - hzx - izx - jzx
#-==================================================================

# Mini Alias - Brqx Cpanel
#-====================================-

alias azx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@abrqx.com:${PWD}/'
alias bzx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@bbrqx.com:${PWD}/'
alias czx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@cbrqx.com:${PWD}/'
alias dzx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@dbrqx.com:${PWD}/'
alias ezx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@ebrqx.com:${PWD}/'
alias fzx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@fbrqx.com:${PWD}/'
alias gzx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@gbrqx.com:${PWD}/'
alias hzx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@hbrqx.com:${PWD}/'
alias izx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@ibrqx.com:${PWD}/'
alias jzx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@jbrqx.com:${PWD}/'
alias kzx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@kbrqx.com:${PWD}/'
alias lzx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@lbrqx.com:${PWD}/'
alias mzx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@mbrqx.com:${PWD}/'
alias nzx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@nbrqx.com:${PWD}/'
alias ozx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@obrqx.com:${PWD}/'
alias pzx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@pbrqx.com:${PWD}/'
alias qzx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@qbrqx.com:${PWD}/'
alias rzx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@rbrqx.com:${PWD}/'
alias szx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@sbrqx.com:${PWD}/'
alias tzx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@tbrqx.com:${PWD}/'
alias uzx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@ubrqx.com:${PWD}/'
alias vzx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@vbrqx.com:${PWD}/'
alias wzx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@wbrqx.com:${PWD}/'
alias xzx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@xbrqx.com:${PWD}/'
alias yzx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@ybrqx.com:${PWD}/'
alias zzx='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ root@zbrqx.com:${PWD}/'

#- Super alias de sincronismo absoluto - lanzado desde px
#-Ux es un VS con poco espacio

alias zx139='rsync -avz --delete --recursive    -e "ssh -oPort=22" ${PWD}/ root@192.168.1.139:$PWD/'

alias zx137='rsync -avz --delete --recursive    -e "ssh -oPort=22" ${PWD}/ ric@192.168.1.137:$PWD/'
alias zx139='rsync -avz --delete --recursive    -e "ssh -oPort=22" ${PWD}/ ric@192.168.1.139:$PWD/'
alias zx142='rsync -avz --delete --recursive    -e "ssh -oPort=22" ${PWD}/ ric@192.168.1.142:$PWD/'
alias zx145='rsync -avz --delete --recursive    -e "ssh -oPort=22" ${PWD}/ ric@192.168.1.145:$PWD/'
alias zxfarm='rsync -avz --delete --recursive    -e "ssh -oPort=60022" ${PWD}/ ric@farmacia:$PWD/'

alias zzh='yzx && dzx && ezx && fzx && izx && tzx && czx && uzx'

