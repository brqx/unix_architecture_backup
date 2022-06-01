#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2018
#-------------------------------------------------------------------
VERSION_SCRIPT="V 0.0.1"          #  Version del Script actual
FECHA_SCRIPT="Agosto 2018"
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

### - Gestion de certificados  :

echo "=============================================================="

# - Algoritmo

#-1 Parar servicio haproxy ssl 
service haproxy_ssl_01 stop

#-2 Renovar certificados en Nginx
/usr/bin/certbot renew &> /var/log/letsencrypt/le-renew.log

#-3 Copiar certificados de Nginx a los almacenes Haproxy

#-4 Copiar subdominios

/etc/haproxy/zren.x

#-5 Copiar dominios - Pendiente

#/etc/haproxy/gdom.x

#-7 Pendiente reiniciar nginx
kill -9 $(ps -eaf | grep nginx | grep -v "grep" | tr -s " " | cut -d " " -f2 | tr "\n" " ") && rm -f /var/run/nginx/nginx_server*.sock
sleep 5
/usr/sbin/nginx -c /etc/nginx/nginx.conf && chown apache:apache /var/run/nginx/nginx_server*.sock

#-6 Iniciar servicio haproxy ssl 
service haproxy_ssl_01 start

