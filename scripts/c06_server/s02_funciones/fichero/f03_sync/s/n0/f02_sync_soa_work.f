#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2010
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Febrero 2010"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_CARACTER="especifico"
CONCEPT_PRODUCTO="server"
CONCEPT_MOLDE="alias"
CONCEPT_ARQUETIPO="fichero"
CONCEPT_LEVEL="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} ${CONCEPT_CARACTER}"
#-==================================================================
# Funciones definidas:
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#- sync_dir_to_ebrqx
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
# sync_dir_to_brqx "${RUTA_LOCAL}" ${RUTA_DESTINO}
#-------------------------------------------------------------------
# Informacion
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# La idea es auto sincronizar rutas paralelas entre servidores
#- ==================================================================
# Recibe como primer parametro el fuente y como segundo el destino
# La idea es que sincronice la carpeta actual, pues pasarle una carpeta 
# al ser la ruta tan larga es un poco absurdo.

# 10.255.221.124	portal	less000900111
# 10.255.221.143	core	les000900113
# 10.255.221.144	frontal	les000900114
# 10.255.220.110	brqx_soa soa	les000900304
# 10.255.220.141	wsrr	les000900305
# 10.255.220.147	wbm monitor	les000900307

# No funciona - no permite copiar si no eres root creo
# Ya si puedo usarlo pero tiene problemas y es lento
sync_dir_to_core()
{

src=${PWD};
dst=`dirname ${PWD}`;
rsync -avz -e "ssh -oPort=22" ${src} root@10.255.221.143:${dst};
}

## Con scp si funciona
##scp -r $PWD ibm@10.255.221.143:`dirname ${PWD}`

sync_dir_to_frontal()
{

src=${PWD};
dst=`dirname ${PWD}`;
rsync -avz -e "ssh -oPort=22" ${src} root@fbrqx.com:${dst};
}


sync_dir_to_monitor()
{

src=${PWD};
dst=`dirname ${PWD}`;
#rsync -avz -e "ssh -oPort=22" ${src} root@ibrqx.com:${dst};
rsync -avz -e "ssh -oPort=22" ${src} root@78.46.102.12:${dst};
}

sync_dir_to_server()
{
SERVIDOR_REMOTO=${1}
USUARIO_REMOTO=${2}
src=${PWD};
dst=$(dirname ${PWD} );
rsync -avz -e "ssh -oPort=22" ${src} ${USUARIO_REMOTO}@${SERVIDOR_REMOTO}:${dst};
}