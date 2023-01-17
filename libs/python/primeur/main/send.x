#!/bin/bash
FLOG=/tmp/log_spazio_send.log
echo "------------------------entrando shell dsp (envio) ----------------------------" | tee $FLOG
send.py $@   | tee  $FLOG
