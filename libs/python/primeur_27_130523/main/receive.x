#!/bin/bash
##FLOG=/tmp/log_spazio_receive.log
echo "------------------------entrando shell ack (recepcion) -----------------------" | tee $FLOG
/brqx/arquitectura/unix/libs/python/primeur/main/receive.py $@  
##/brqx/arquitectura/unix/libs/python/primeur/main/receive.py $@  | tee $FLOG 

