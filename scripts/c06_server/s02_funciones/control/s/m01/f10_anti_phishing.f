#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
LEVEL_NIVEL_05=05
CONCEPT_MOLDE_05="funciones"
CONCEPT_ARQUETIPO_05="control"
CONCEPT_LEVEL_05="Script $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO}"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- phishing_control
#-------------------------------------------------------------------
#-- genkeys_phishing
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#- Devuelve informacion del site - size logs - entradas directorio
#  etc
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#-- phishing_control --> controla phishing a nivel de servidor
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

phishing_control()
{
#Script to control phising in servers
LIST_FOLDERS=$(find /home/ -maxdepth 1 -mindepth 1  -type d  | grep -v installd | grep -v cpan | grep -v cpeasy | grep -v lost | grep -v MySQL
| grep -v varnish |grep -v cprestore | grep -v logs | cut -d "/" -f3 |
tr "\n" " " )

# Testing folding
FOLDERS=
SUPER_KEY=


for i in ${LIST_FOLDERS}
do
KEY_FOLDER=$(echo $i | cut -c1-3)
NUM_FOLDER=$(ls -1 /home/$i/www/ | wc -l ) #echo "$i -- ${KEY_FOLDER} -- ${NUM_FOLDER}"
SUPER_KEY=${SUPER_KEY}${KEY_FOLDER}_${NUM_FOLDER}
FOLDERS=${FOLDERS}-${i}_${NUM_FOLDER}
done

echo ${SUPER_KEY} > /root/zsuperkey.key_new

echo ${FOLDERS} | tr "-" "\n"  > /root/zsuperkey.folders_new

diff /root/zsuperkey.key_new /root/zsuperkey.key

RETORNO=$?

if [ "${RETORNO}" == "0" ] ; then
echo "No hay peligro clave segur - No danger - Sure keys"
else
echo "ALERT - New folder created $(uname -n) on:  `date` `who` $( diff /brqx/zsuperkey.folders /brqx/zsuperkey.folders_new ) " | mail -s "Alert FBRQX: New folder intrussion `who | cut -d"(" -f2 | cut -d")"
-f1`" alerts@unixy.es

echo "ALERT - New folder created $(uname -n) on:  `date` `who` $( diff /brqx/zsuperkey.folders /brqx/zsuperkey.folders_new ) " | mail -s "Alert FBRQX: New folder intrussion `who | cut -d"(" -f2 | cut -d")"
-f1`" alerts@unixy.net


fi

}


#-------------------------------------------------------------------
#+ Sistema de trazado N5 - parametrizado
#-------------------------------------------------------------------
if [ "${N5}" != "" ] ; then
echo "${LEVEL_NIVEL_05}/${LEVEL_NIVEL}--${CONCEPT_LEVEL_05}"
fi
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================
