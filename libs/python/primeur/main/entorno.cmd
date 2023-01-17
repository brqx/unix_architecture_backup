@ECHO OFF
REM Ruta Python
REM set PYTHONHOME=<ruta python>
REM set PYTHONHOME=z:\utils\Desarrollo\Entornos\Graficos\Python\Python_332_portable\App
set PYTHONHOME=z:\utils\Desarrollo\Entornos\Graficos\Python\winpython_332\python-3.3.2

REM Ruta Spazio
set SPAZIO=c:\spazio

REM Ruta Scripts
REM set BASEPYTHON=<ruta scripts>primeur
set BASEPYTHON=u:
set PYTHONPATH= 

REM SET PYTHONPATH=%PYTHONHOME%\Lib;%BASEPYTHON%\spazio;%BASEPYTHON%\main;%BASEPYTHON%\base;%BASEPYTHON%\oop;%BASEPYTHON%\oop\oo_arg;%BASEPYTHON%\oop\oo_date;%BASEPYTHON%\oop\oo_env;%BASEPYTHON%\oop\oo_file;%BASEPYTHON%\oop\oo_log;%BASEPYTHON%\oop\oo_msg;%BASEPYTHON%\oop\oo_parse;%BASEPYTHON%\oop%\oo_post;%BASEPYTHON%\oop\oo_compress;%BASEPYTHON%\oop\oo_search;%BASEPYTHON%\oop\oo_split;%BASEPYTHON%\oop\oo_str;%BASEPYTHON%\oop\oo_sys;%BASEPYTHON%\oop\oo_spa\acq;%BASEPYTHON%\oop\oo_spa\lis;%BASEPYTHON%\oop\oo_spa\spv;%BASEPYTHON%\oop\oo_spa\dsp;%BASEPYTHON%\oop\oo_spa\gen;%BASEPYTHON%\oop\oo_rul\acq;%BASEPYTHON%\oop\oo_rul\dsp;%BASEPYTHON%\oop\oo_rul\gen;%BASEPYTHON%\oop\oo_post
SET PYTHONPATH=%PYTHONHOME%;%PYTHONHOME%\Lib;u:\spazio;u:\main;u:\base;u:\oop;u:\oop\oo_arg;u:\oop\oo_date;u:\oop\oo_env;u:\oop\oo_file;u:\oop\oo_log;u:\oop\oo_msg;u:\oop\oo_parse;u:\oop\oo_post;u:\oop\oo_compress;u:\oop\oo_search;u:\oop\oo_split;u:\oop\oo_str;u:\oop\oo_sys;u:\oop\oo_spa\acq;u:\oop\oo_spa\lis;u:\oop\oo_spa\spv;u:\oop\oo_spa\dsp;u:\oop\oo_spa\gen;u:\oop\oo_rul\acq;u:\oop\oo_rul\dsp;u:\oop\oo_rul\gen;u:\oop\oo_post

set PATH=%PYTHONPATH%;%PATH%
