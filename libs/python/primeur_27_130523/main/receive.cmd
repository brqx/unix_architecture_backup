@ECHO OFF

REM Habria que comprobar si no existen las variables
echo %PYTHONPATH%
echo %FLOG%

set SHSTART= -----------------entrando shell acq (recepcion) --------------------
echo %SHSTART%				
receive.py %1 %2 %3 %4 %5 %6 %7	%8 %9	

REM echo %SHSTART%				> %FLOG%	2>&1
REM receive.py %1 %2 %3 %4 %5 %6 %7	%8 %9	> %FLOG%	2>&1

