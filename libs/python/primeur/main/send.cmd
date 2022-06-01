@ECHO OFF

REM Habria que comprobar si no existen las variables
echo %PYTHONPATH%
echo %FLOG%

set SHSTART= --------entrando shell dsp (envio) ---------
echo %SHSTART%				
send.py %1 %2 %3 %4 %5 %6 %7 %8 %9 	

REM echo %SHSTART%				> %FLOG%	2>&1
REM send.py %1 %2 %3 %4 %5 %6 %7 %8 %9 		> %FLOG%	2>&1  
