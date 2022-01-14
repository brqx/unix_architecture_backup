#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2015
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Febrero 2015"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_PRODUCTO="cpanel"
CONCEPT_MOLDE="alias"
CONCEPT_ARQUETIPO="fichero"
CONCEPT_LEVEL="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO}"
#-==================================================================
# Funciones definidas:
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# La idea es auto sincronizar rutas paralelas entre servidores
#- ==================================================================

#-Sincronismo real entre ficheros
FECHA=$(date +%G_%m_%d_%H-%M)
echo $FECHA
SYNC_LOG_FILE_ZE=/var/log/zsync/msync_change_${FECHA}_ze.log
SYNC_LOG_FILE_ZF=/var/log/zsync/msync_change_${FECHA}_zf.log
SYNC_LOG_FILE_ZV=/var/log/zsync/msync_change_${FECHA}_zv.log


#-Estos no se si funcionan bien

#Sincronismos de estructura - Por si no va bien lsyncd

#--Replication list

#-Folders (with subdirs)
#/etc/exim
#/etc/dovecot
#/etc/mail/spamassassin
#/etc/clam.d

#-Exeptions:
#/etc/exim/custom.conf
#/etc/dovecot/conf.d/10-custom.conf

#-Files
#/etc/logrotate.d/dovecot
#/etc/logrotate.d/exim
#/etc/logrotate.d/spamd
#/etc/logrotate.d/clamd
#/etc/freshclam.conf

#-Additional for testing:
#/home/mail/public_html

ssh -p 60022 ebrqx.com "rm -f /root/.unison/fp*"
ssh -p 60022 ebrqx.com "rm -f /root/.unison/ar*"
ssh -p 60022 ebrqx.com "rm -f /root/.unison/lk*"

rm -f /root/.unison/fp*
rm -f /root/.unison/ar*
rm -f /root/.unison/lk*


unison mail_logrotate
unison mail_dovecot
unison mail_exim
unison mail_others

rm -f /root/.unison/fp*
rm -f /root/.unison/ar*
rm -f /root/.unison/lk*

ssh -p 60022 ebrqx.com "rm -f /root/.unison/fp*"
ssh -p 60022 ebrqx.com "rm -f /root/.unison/ar*"
ssh -p 60022 ebrqx.com "rm -f /root/.unison/lk*"

