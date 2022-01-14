#!/bin/bash
#-------------------------------------------------------------------
# Variables Entornos Unix - Brqz - I+D
# BRQX NG - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.2"          #  Version del Script actual
FECHA_SCRIPT="Junio 2011"
#-==================================================================

#-------------------------------------------------------------------
#- Perfiles definidos - Ajuste en servidor
#-------------------------------------------------------------------

PERFIL_01=ProcSrvStandAlone # Perfil anterior a la arquitectura brqx
PERFIL_02=ProcSrv02     # Perfil generado contra oracle ARQDB02
PERFIL_03=ProcSrv03
PERFIL_04=ProcSrv01     # Perfil que ha fallado

#-------------------------------------------------------------------
#- Rutas a los perfiles
#-------------------------------------------------------------------

RUTA_PERFIL_01=${WPS_PF}${PERFIL_01}/
RUTA_PERFIL_02=${WPS_PF}${PERFIL_02}/
RUTA_PERFIL_03=${WPS_PF}${PERFIL_03}/
RUTA_PERFIL_04=${WPS_PF}${PERFIL_04}/



#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------

