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
#-- ax - bx - cx - dx - ex - fx - gx - hx - ix - jx
#-==================================================================

# Mini Alias - Brqx Cpanel
#-====================================-

alias ax='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@abrqx.com:${PWD}/'
alias bx='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@bbrqx.com:${PWD}/'
alias cx='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@cbrqx.com:${PWD}/'
alias dx='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@dbrqx.com:${PWD}/'
alias ex='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@ebrqx.com:${PWD}/'
alias fx='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@fbrqx.com:${PWD}/'
alias gx='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@gbrqx.com:${PWD}/'
alias hx='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@hbrqx.com:${PWD}/'
alias ix='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@ibrqx.com:${PWD}/'
alias jx='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@jbrqx.com:${PWD}/'
alias kx='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@kbrqx.com:${PWD}/'
alias lx='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@lbrqx.com:${PWD}/'
alias mx='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@mbrqx.com:${PWD}/'
alias nx='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@nbrqx.com:${PWD}/'
alias ox='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@obrqx.com:${PWD}/'
alias px='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@pbrqx.com:${PWD}/'
alias qx='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@qbrqx.com:${PWD}/'
alias rx='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@rbrqx.com:${PWD}/'
alias sx='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@sbrqx.com:${PWD}/'
alias tx='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@tbrqx.com:${PWD}/'
alias ux='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@ubrqx.com:${PWD}/'
alias vx='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@vbrqx.com:${PWD}/'
alias wx='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@wbrqx.com:${PWD}/'
alias xx='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@xbrqx.com:${PWD}/'
alias yx='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@ybrqx.com:${PWD}/'
alias zx='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@zbrqx.com:${PWD}/'

#- Super alias de sincronismo absoluto - lanzado desde px
#-Ux es un VS con poco espacio
alias xxh='dx && gx && cx && vx && xx && zx && tx'; 
alias ggh='tx && gx && qx && ix' # Replicate to cluster members
alias eeh='ex && fx' # Replicate to cluster members

alias z139='rsync -avz -e "ssh -oPort=22" ${PWD}/ root@192.168.1.139:$PWD/'

alias x137='rsync -avz -e "ssh -oPort=22" ${PWD}/ ric@192.168.1.137:$PWD/'
alias x139='rsync -avz -e "ssh -oPort=22" ${PWD}/ ric@192.168.1.139:$PWD/'
alias x142='rsync -avz -e "ssh -oPort=22" ${PWD}/ ric@192.168.1.142:$PWD/'
alias x145='rsync -avz -e "ssh -oPort=22" ${PWD}/ ric@192.168.1.145:$PWD/'

#New aliases for lenovo connection

alias rix='rsync -avz --exclude=.git -e "ssh -oPort=60022" ${PWD}/ ric@lenovo64:$PWD/'
alias rox='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@lenovo64:$PWD/'

#New aliases for revo connection

alias vix='rsync -avz --exclude=.git -e "ssh -oPort=60022" ${PWD}/ ric@revo:$PWD/'
alias vox='rsync -avz --exclude=.git -e "ssh -oPort=60022" ${PWD}/ root@revo:$PWD/'


#New aliases for asus connection

alias aix='rsync -avz -e "ssh -oPort=60022" ${PWD}/ ric@asus32:$PWD/'
alias aox='rsync -avz -e "ssh -oPort=60022" ${PWD}/ root@asus32:$PWD/'

#Special aliases for mac mini

#alias mix='rsync -avz -e "ssh -oPort=22" ${PWD}/ macminii7@maci7:Library$PWD'
alias mix='rsync -avz -e "ssh -oPort=22" ${PWD}/ macminii7@maci7:$PWD/'

alias mox='rsync -avz -e "ssh -oPort=22" ${PWD}/ root@maci7:Library$PWD'

alias fix='rsync -avz -e "ssh -oPort=22" macminii7@maci7:$PWD/ ${PWD}/'



alias xto_farm='rsync -avz --omit-dir-times -e "ssh -oPort=60022" ${PWD}/ ric@farmacia:$PWD/'
alias xfrom_farm='rsync -avz --omit-dir-times -e "ssh -oPort=60022" ric@farmacia:$PWD/ ${PWD}/'
alias xfarm='xto_farm'

