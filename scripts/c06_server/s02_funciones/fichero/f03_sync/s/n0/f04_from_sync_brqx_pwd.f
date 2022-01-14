#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2015
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.0"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2015"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_PRODUCTO="cpanel"
CONCEPT_MOLDE="alias"
CONCEPT_ARQUETIPO="fichero"
CONCEPT_LEVEL="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO}"
#-==================================================================
# Funciones definidas:
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#- sync_dir_from_ebrqx
#-------------------------------------------------------------------
# Ejemplo base:
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# 
# "Sincronizando   Local    ${RUTA_LOCAL}                        "
# "--------------------------------------------------------------"
# "  Local      EBRQX -   ${RUTA_LOCAL}                          "
# "  Destino    ABRQX -   ${RUTA_DESTINO}                        "
# "--------------------------------------------------------------"
# 
# sync_dir_from_brqx "${RUTA_LOCAL}" ${RUTA_DESTINO}
#-------------------------------------------------------------------
# Informacion
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# La idea es auto sincronizar rutas paralelas entre servidores
#- ==================================================================
# Recibe como primer parametro el fuente y como segundo el destino
# La idea es que sincronice la carpeta actual, pues pasarle una carpeta 
# al ser la ruta tan larga es un poco absurdo.

#- que abrqx sea jbrqx
sync_dir_from_abrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
rsync -avz -e "ssh -oPort=60022"  root@abrqx.com:${dst} ${src}
}

sync_dir_from_bbrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
rsync -avz -e "ssh -oPort=60022"  root@bbrqx.com:${dst} ${src}
}

sync_dir_from_cbrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
rsync -avz -e "ssh -oPort=60022"  root@cbrqx.com:${dst} ${src}
}

sync_dir_from_dbrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro
src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
rsync -avz -e "ssh -oPort=60022" root@dbrqx.com:${dst}  ${src}
}

sync_dir_from_ebrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
rsync -avz -e "ssh -oPort=60022"  root@ebrqx.com:${dst} ${src}
}


sync_dir_from_fbrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
rsync -avz -e "ssh -oPort=60022"  root@fbrqx.com:${dst} ${src}
}

sync_dir_from_gbrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
rsync -avz -e "ssh -oPort=60022" root@gbrqx.com:${dst}  ${src}
}


sync_dir_from_hbrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
#rsync -avz -e "ssh -oPort=60022" ${src} root@hbrqx.com:${dst};
rsync -avz -e "ssh -oPort=60022"  root@hbrqx.com:${dst} ${src}

}


sync_dir_from_ibrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
#rsync -avz -e "ssh -oPort=65533" ${src} root@ibrqx.com:${dst};
rsync -avz -e "ssh -oPort=60022"  root@ibrqx.com:${dst} ${src}
}

sync_dir_from_jbrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
rsync -avz -e "ssh -oPort=60022"  root@jbrqx.com:${dst} ${src}
}

sync_dir_from_kbrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
rsync -avz -e "ssh -oPort=60022"  root@kbrqx.com:${dst} ${src}
}

sync_dir_from_lbrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
rsync -avz -e "ssh -oPort=60022"  root@lbrqx.com:${dst} ${src}
}

sync_dir_from_mbrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
rsync -avz -e "ssh -oPort=60022"  root@mbrqx.com:${dst} ${src}
}

sync_dir_from_nbrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
rsync -avz -e "ssh -oPort=60022"  root@nbrqx.com:${dst} ${src}
}

sync_dir_from_obrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
rsync -avz -e "ssh -oPort=60022"  root@obrqx.com:${dst} ${src}
}

sync_dir_from_pbrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
rsync -avz -e "ssh -oPort=60022"  root@pbrqx.com:${dst} ${src}
}

sync_dir_from_qbrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
rsync -avz -e "ssh -oPort=60022"  root@qbrqx.com:${dst} ${src}
}

sync_dir_from_rbrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
rsync -avz -e "ssh -oPort=60022"  root@rbrqx.com:${dst} ${src}
}

sync_dir_from_sbrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
rsync -avz -e "ssh -oPort=60022"  root@sbrqx.com:${dst} ${src}
}

sync_dir_from_tbrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
rsync -avz -e "ssh -oPort=60022"  root@tbrqx.com:${dst} ${src}
}

sync_dir_from_ubrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
rsync -avz -e "ssh -oPort=60022"  root@ubrqx.com:${dst} ${src}
}

sync_dir_from_vbrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
rsync -avz -e "ssh -oPort=60022"  root@vbrqx.com:${dst} ${src}
}

sync_dir_from_wbrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
rsync -avz -e "ssh -oPort=60022"  root@wbrqx.com:${dst} ${src}
}

sync_dir_from_xbrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
rsync -avz -e "ssh -oPort=60022"  root@xbrqx.com:${dst} ${src}
}

sync_dir_from_ybrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
rsync -avz -e "ssh -oPort=60022"  root@ybrqx.com:${dst} ${src} 
}

sync_dir_from_zbrqx()
{
PAR=$1   # Primer parametro para el cambio
CHA=$2   # Cambio de parametro

src=$( dirname ${PWD} )
dst_01=${PWD}
dst=$dst_01
if [ "$PAR" != ""  ] ; then
dst=$(echo ${dst_01} | sed "s/${PAR}/${CHA}/g")
fi
rsync -avz -e "ssh -oPort=60022"  root@zbrqx.com:${dst} ${src}
}

