#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2022
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Enero 2022"
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


##FECHA=$(date +%G_%m_%d_%H-%M)
##2022_01_14_09-30
FECHA=$(date +%G_%m)
##2022_01

SYNC_LOG_FILE=${TMPDIR}zsync_cron_${FECHA}.log

##DOCS_FOLDER=/Library/Documentos/
DOCS_FOLDER=/Library/ric/testsync/

#Usuario local por defecto
USERPERMS_LOCAL=ric

# farmacia=$(dig +short 8325.coessegur.net | grep -v webhop)

# Funcion que recibe usa variables definidas
# - Directorios SOURCE y TARGET
# - Servidor remoto USER - SERVER y PORT
# - Ejemplo Library/dir1

brqx_sync_to()
{
# Entra como root
VER=0.0.1
# Hay que insertar un seguro de FOLDER

if [ "${FOLDER}" != "" ] ; then 
SOURCE=$1
#TARGET=$2
OLD_PATH=${PWD}
#TARGET_PWD=$(dirname ${SOURCE})

# Si no existe el source no debe sincronizar
cd ${SOURCE}
EXISTE_RUTA=$?

if [ "${EXISTE_RUTA}" == "0" ] ; then
#Ready to sync
#--------------------------------------------------------------------------------------

echo "Sincronizando ${SOURCE} en ${SERVER} : ${PORT} -  ${VER}"

# Esperamos 1 segundo
nc -z ${SERVER} ${PORT} -w 1
READY_TO_SYNC=$?

if [ "${READY_TO_SYNC}" == "0" ] ; then
#Ready to sync
#--------------------------------------------------------------------------------------
#xfrom_mac
# Queremos sincronizar desde Library siempre
# --existing              skip creating new files on receiver
# -u, --update            skip files that are newer on the receiver

rsync -avz --exclude="*lock*" --update --omit-dir-times -e "ssh -oPort=${PORT}" ${PWD}/  ${USER}@${SERVER}:$PWD/  

rsync -avz --exclude="*lock*" --update --omit-dir-times -e "ssh -oPort=${PORT}" ${USER}@${SERVER}:$PWD/ ${PWD}/   

echo "Cambiando USERPERMS -- ${USERPERMS}"
chmod -R 775 ${SOURCE}
# Userperms local es el usuario local 
chown -R ${USERPERMS_LOCAL} ${SOURCE}

# Falla en la botica al ser apache
if [ "${SERVER}" != "8325.coessegur.net" ] ; then
echo "CAMBIANDO PROPIETARIOS - ${USER} con ${USERPERMSRMT}"
ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "chmod -R 775 ${SOURCE} " 
# Falla en la botica al ser apache
# echo "ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} chown -R ${USERPERMSRMT} ${SOURCE} " 

ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "chown -R ${USERPERMSRMT} ${SOURCE} " 
fi

else
echo "Server ${SERVER} : ${PORT} not ready to sync"

#END Ready to sync
#--------------------------------------------------------------------------------------
fi
else

echo "Ruta no existe para sincronizar en  ${SERVER} : ${PORT} - > ${SOURCE} "

#END Existe ruta
#--------------------------------------------------------------------------------------
fi 

cd ${OLD_PATH}
#echo "End Sync"
fi
}

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# XYN - SINCRONISMO ESPECIFICO HACIA LOS EQUIPOS
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Sincronismo hacia lenovo
xyn_lenovo()
{
FOLDER=$1
SERVER=lenovo ; PORT=60022 ; USER=ric  ; USERPERMS=ric ; USERPERMSRMT=ric
brqx_sync_to ${FOLDER}
}

# Sincronismo hacia mac mini i7
xyn_mac7()
{
FOLDER=$1
SERVER=maci7 ; PORT=22 ; USER=macminii7  ; USERPERMS=macminii7 ; USERPERMSRMT=macminii7
brqx_sync_to ${FOLDER}
}

# Sincronismo hacia mac mini i7
xyn_mac_salon()
{
FOLDER=$1
SERVER=mac_salon ; PORT=22 ; USER=ric  ; USERPERMS=ric ; USERPERMSRMT=ric
brqx_sync_to ${FOLDER}
}

# Sincronismo hacia mac mini i7
xyn_farm()
{
# No funciona el cambio de usuario apache 
# Linea de cron */10 9-19 * * * chmod -R 775 /ssd/Documentos && chown -R apache. /ssd/Documentos &> /dev/null

FOLDER=$1
SERVER=8325.coessegur.net ; PORT=60022 ; USER=ric  ; USERPERMS=ric ; USERPERMSRMT=ric
brqx_sync_to ${FOLDER}
}

# Sincronismo hacia servidores
xyn_zt()
{
FOLDER=$1
SERVER=tbrqx.com ; PORT=60022 ; USER=ric  ; USERPERMS=ric ; USERPERMSRMT=ric
brqx_sync_to ${FOLDER}
}

# Sincronismo hacia servidores
xyn_zc()
{
FOLDER=$1
SERVER=abrqx.com ; PORT=60022 ; USER=ric  ; USERPERMS=ric ; USERPERMSRMT=ric
brqx_sync_to ${FOLDER}
}

# Sincronismo hacia servidores
xyn_zd()
{
FOLDER=$1
SERVER=dbrqx.com ; PORT=60022 ; USER=ric  ; USERPERMS=ric ; USERPERMSRMT=ric
brqx_sync_to ${FOLDER}
}

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# SYN_FOR - SINCRONISMO ESPECIFICO PARA LOS EQUIPOS
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

xyn_for_lenovo()
{
USERPERMS_LOCAL=ric

xyn_farm ${DOCS_FOLDER}a
xyn_farm ${DOCS_FOLDER}c

xyn_mac7 ${DOCS_FOLDER}a
xyn_mac7 ${DOCS_FOLDER}c

xyn_zc ${DOCS_FOLDER}a
xyn_zc ${DOCS_FOLDER}c

xyn_zt ${DOCS_FOLDER}a
xyn_zt ${DOCS_FOLDER}c

xyn_zd ${DOCS_FOLDER}a
xyn_zd ${DOCS_FOLDER}c

}

xyn_for_revo()
{
xyn_lenovo ${DOCS_FOLDER}a
xyn_lenovo ${DOCS_FOLDER}c
}

xyn_for_macsalon()
{
xyn_lenovo ${DOCS_FOLDER}a
xyn_lenovo ${DOCS_FOLDER}c
}

xyn_for_zd()
{
xyn_farm ${DOCS_FOLDER}a
xyn_farm ${DOCS_FOLDER}c

xyn_zc ${DOCS_FOLDER}a
xyn_zc ${DOCS_FOLDER}c

xyn_zt ${DOCS_FOLDER}a
xyn_zt ${DOCS_FOLDER}c
}

xyn_for_zt()
{
xyn_farm ${DOCS_FOLDER}a
xyn_farm ${DOCS_FOLDER}c

xyn_zc ${DOCS_FOLDER}a
xyn_zc ${DOCS_FOLDER}c

xyn_zd ${DOCS_FOLDER}a
xyn_zd ${DOCS_FOLDER}c
}

xyn_for_zc()
{
xyn_farm ${DOCS_FOLDER}a
xyn_farm ${DOCS_FOLDER}c

xyn_zd ${DOCS_FOLDER}a
xyn_zd ${DOCS_FOLDER}c

xyn_zt ${DOCS_FOLDER}a
xyn_zt ${DOCS_FOLDER}c
}


xyn_for_lenovo

DOCS_FOLDER=/Library/Documentos/

xyn_for_lenovo
