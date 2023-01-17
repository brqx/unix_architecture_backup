#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
-+ Clases utilizadas            : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- File          - Clase para gestion de ficheros
-----------------------------------------------------------
- FileDsp       - Clase de spazio para dsp - envio
-----------------------------------------------------------
- RulesSffEst   - Clase de estructura SFF de Reglas
-----------------------------------------------------------
- Log           - Clase de gestion de logs
-----------------------------------------------------------
+ Librerias Primeur requeridas  :
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- pm_string
-----------------------------------------------------------
+ Librerias Sistema requeridas  :
-----------------------------------------------------------
- os 
-----------------------------------------------------------
- sys
===========================================================
+ Process Status  : [130517]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [4] [_] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [_] [4] [5]
===========================================================
"""

#- Importacion de clases utilizadas

from oo_filedsp import FileDsp

from oo_log import Log

from oo_file import File

from oo_rules_sff_est   import RulesSffEst


#- Importacion de librerias de primeur

import pm_string

#- Importacion de librerias del sistema

import os, sys

#- Python 3.3
import re

sp              = ""
sp_fullcomando  = ""
sp_info         = ""


log_level           = 1     #- Debe indicar no logs
log_class_level     = 0
log_show            =   "screen"
##log_show_file       =   "screen"
##log_show_mix        =   "screen"

log_show_file       =   "file"
log_show_mix        =   "screenandfile"

cfg_tracesrv         =   "tracesrv.ini"   

log_file_trc         =   "ev_enviar.log"
log_file_hst         =   "ev_enviar.hst"
log_file_err         =   "ev_enviar.err"

log_file            =   ""
rules_file          =   ""

cadena_out          = ""



try:
    sp              = os.environ['BASEPYTHON']
    pypath          = os.environ['PYTHONPATH']
    spazio_path     = os.environ['SPAZIO']


    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
    #              I N I C I O   P R O G R A M A
    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

    #-- Clase de log
    program     =   "send"
    #-Logger general de impresion en pantalla
    log         =   Log(program             , 
                        log_level           , 
                        log_class_level     ,
                        log_show_mix        ,
                        log_file            )

    log.spazio  =   spazio_path
    

    log.Log("Carga librerias correctas" ,
            log.bline                   , "square_simple")


    log.Log("SPAZIO:"                   ,
            spazio_path                 , "simple_simple")

    log.Log("PYTHONPATH:"               ,
            log.bline                   , "normal")

    log.Log( 
        pm_string.str_args(sys.path,len(sys.path)) , 
        log.bline                       , "square_double")

    #-Establecimiento del directorio temporal de spazio
    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==


    #- El fichero por defecto lo conoce
    #- que hacemos sin o existe

    config_comment  = ";"
    rules_comment   = "#"


    #-Leemos la configuracion
    rulsff = RulesSffEst(rules_file         ,
                         config_comment     ,
                         log_level          ,
                         log_class_level    ,
                         log_show           )    


    open_file_code=rulsff.getOpenFileCode()
    str_open_file_code = str(open_file_code)

    if open_file_code == 0:
    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
    #   A. INICIO CHECK SPAZIO INI
    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=


##   El tamaño máximo de los ficheros de log de SPAZIO está 
##   definido en el fichero de configuración “tracesrv.ini” 
##   en la clave “FILE_MAXSIZE” que indica el tamaño máximo 
##   en bytes.
##   El fichero “tracesrv.ini” estára almacenado en el path 
##   ‘cfg’ de SPAZIO (obtenido de la clave “CfgPath” del 
##   fichero $SPAZIO/spazio.ini o por defecto será $SPAZIO/cfg.


    #-- A partir de éste momento podemos imprimir logs

        tracesrv_ini = log.cfg_path + log.slash + cfg_tracesrv
      

    #- Usamos log_path porque ya hay un metodo llamado log
    
        log.cfg_path = rulsff.cfg_path
        log.tmp_path = rulsff.tmp_path
        log.log_path = rulsff.log_path


        log.Log("Ruta configuracion"                        , 
                log.cfg_path                                     ,
                "simple_simple"                             )                    

        log.Log("Ruta temporal"                             , 
                log.tmp_path                                     ,
                "simple_simple"                             )                    

        log.Log("Ruta logs"                                 , 
                log.log_path                                ,
                "simple_simple"                             )                   


        log.Log("Ruta TraceSrv"             , tracesrv_ini  )                    


        #-Gestionar size de los logs

        rulsff_tracesrv = RulesSffEst(tracesrv_ini          ,
                                      config_comment        ,
                                      log_level             ,
                                      log_class_level       ,
                                      log_show              )    


        size_log_key = "FILE_MAXSIZE"
        tupla_correl_id = ""

        size_log  = rulsff_tracesrv.getKeyValue( 
                                            size_log_key    ,
                                            tracesrv_ini    ,
                                            tupla_correl_id ,
                                            config_comment  )

        log.Log("Size logs"             , size_log  )                    


        #-Logger historico - trazas y error
        hst_file = log.log_path + log.slash + log_file_hst
        log_file = log.log_path + log.slash + log_file_trc
        err_file = log.log_path + log.slash + log_file_err

        log.Log("Fichero historico"         , hst_file,
                "simple_simple"                             )                    


        log.Log("Fichero trazas"            , log_file,
                "simple_simple"                             )                    


        log.Log("Fichero errores"           , err_file,
                "simple_simple"                             )                    

        #- Log historico
        log_hst         =   Log(program             , 
                            log_level               , 
                            log_class_level         ,
                            log_show_file           ,
                            hst_file                )

        #- Log de errores
        log_err         =   Log(program             , 
                            log_level               , 
                            log_class_level         ,
                            log_show_file           ,
                            err_file                )

        #- Log de traceo - a partir de aqui se trace a fichero
        #-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        log.set_log_file(log_file)    
        log.set_log_show(log_show_mix)


        #- Size de los logs por defecto
        log.set_log_size(size_log)
        log_hst.set_log_size(size_log)
        log_err.set_log_size(size_log)

        #- Size actual de los logs
        # Orden unix : stat -c %s log/ev_extraer.hst         


        str_size_log_trc = ""
        str_size_log_hst = ""        
        str_size_log_err = ""

        if os.path.exists(log_file):
            size_log_trc = os.path.getsize(log_file)        
            str_size_log_trc = str(size_log_trc)


        if os.path.exists(hst_file):
            size_log_hst = os.path.getsize(hst_file)        
            str_size_log_hst = str(size_log_hst)


        if os.path.exists(err_file):
            size_log_err = os.path.getsize(err_file)        
            str_size_log_err = str(size_log_err)


        log.Log("Current Size Log"          ,
                str_size_log_trc            ,
                "simple_alt"                )

        log.Log("Current Size Hst"          ,
                str_size_log_hst            ,
                "simple_alt"                )

        log.Log("Current Size Err"          ,
                str_size_log_err            ,
                "simple_alt"                )

        #--==--==--==--==--==--==--==--==--==--==--==--==--==--==

        #- Log de historico        
        log_hst.Log("Lanzamiento Filetacq")

       #--==--==--==--==--==--==--==--==--==--==--==--==--==--==
           
        
        numero_argumentos   = len(sys.argv)
        str_num_args        = str(numero_argumentos)
        
        # Script de python y sus parametros    
        sp_fullcomando      = pm_string.str_args(sys.argv, numero_argumentos)  
    
    
        log.Log("Comando lanzado"       , 
                sp_fullcomando          , "double_alt")
    
        log.Log("Numero argumentos"     , 
                str_num_args            , "simple_alt")
    
       
        #- Generamos el Log de historico
    ##    pm_logpmt.log_his(sp_fullcomando , mod, "66", LOG_SHOW)
    
        #-Tenmos dos formas de actuar :
        # 
        #a. Envio por tiempo <nom_preproc> nombre_fich -t [time]
        #-- El dsp lo hace la agenda estatica
        #   La comprobacion debe ser solo por tiempo
    
        #b. Envio por bandera <nom_preproc> nombre_fich -r  [CORRELID]       
        #-- La invocacion del script se basa en la generacion de una
        #   bandera o por tiempo
        #   El script debe:
        #   - preparar la ruta de inicio
        #   - enviar el fichero asociado a la bandera
        #   - mover el fichero a la ruta de backup
            
    
        ## print numero_argumentos - 7 con usuario y clave
        if numero_argumentos >= 3:
                
            sp_info = "Inicio Algoritmo.Argumentos correctos." 
    
            log.Log(sp_info , 
                    str(numero_argumentos),
                    "simple_simple")        
    
           
            source_filename   =   sys.argv[1]     # Nombre Fichero
            preprocess_type   =   sys.argv[2]     # Tipo_Preproceso 
            preprocess_args   =   sys.argv[3]     # Parametro
    
    
            log.Log("Fichero_pasado"      , 
                     source_filename       ,
                     "simple_simple"       )
       
    
            #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
            #   A. INICIO OBTENCION METADATOS
            #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
    
    
            correlation_id_posible = "CORRELID"
            #preprocess_args
   
            rules_filename  = log.cfg_path + log.slash + \
            correlation_id_posible + "_dsp.rul"

                  
            log.Log("Nombre Fichero Reglas" ,
                        rules_filename          , 
                        "square_alt"            )

            rul2sff = RulesSffEst(rules_filename        ,
                                  rules_comment         ,
                                  log_level             ,
                                  log_class_level       ,
                                  log_show              ,
                                  log_file              ,
                                  err_file              )    
    
            open_frules_code        =rul2sff.getOpenFileCode()
            str_open_frules_code    = str(open_file_code)
            
            log.Log("Codigo fichero reglas" ,
                    str_open_frules_code    ,
                    "square_alt"            )
    
    
            log.Log("Antes llamada FileDsp" ,
                    log.bline               ,
                    "double_alt"            )

            log.Log("Source FileName"       ,
                    source_filename         ,
                    "simple_simple"         )

            log.Log("Tipo Preproceso"       ,
                    preprocess_type         ,
                    "simple_simple"         )

            log.Log("Argumentos Preproceso" ,
                    preprocess_args         ,
                    "simple_simple"         )
    
    
            log.Log("Fichero de Reglas"     ,
                    rules_filename          ,
                    "simple_simple"         )
   
    
            ofdsp = FileDsp(source_filename     , 
                            preprocess_type     ,
                            preprocess_args     ,
                            rules_filename      ,
                            log_level           ,
                            log_class_level     ,
                            log_show            ,
                            log_file            ,
                            err_file            )


            ofdsp.processDsp()
    
            syscall_dsp     =   ofdsp.getRunStr()
            str_syscall_dsp =   str(syscall_dsp)
    
            syscode_dsp     =   ofdsp.getSysCode()
            str_syscode_dsp =   str(syscode_dsp)


    
            sysstr_dsp      =   ofdsp.getSysOutStr()
            str_sysstr_dsp  =   str(sysstr_dsp)
    
            log.Log("Llamada Dsp"                   ,   
                    str_syscall_dsp                 ,   
                    "double_alt"                    )

##                log.Log("Salida Acq"                    ,   
##                        str_sysstr_acq                  ,   
##                         "double_alt"                   )    

            log.Log("Resultado Dsp"                 ,   
                    str_syscode_dsp                 ,
                    "double_alt"                    )    
    
            #- La llamada a filetdsp solo se va a producir si se indica
            #  bandera
    
            #- Por tanto en caso de tiempo no hay que considerarlo
            
            syscall_dsp         = ""
    
            preprocess_time     = log.pmt_ind + "t"
            preprocess_trigger  = log.pmt_ind + "r"
    
    
    
            if   preprocess_type == preprocess_time:
                
                log.Log("Entra por Tiempo"                  , 
                        preprocess_time + " " + preprocess_args   ,
                        "double_alt"                            )    

                tipo_preproceso     = "Agenda Estatica"
                syscode_dsp         =  ofdsp.getResult() 
                sysstr_dsp          =  ofdsp.getResultStr() 
    
                str_syscode_dsp     = str (syscode_dsp)
                
                log.Log("Salida FileTDsp"           ,   
                        str_syscode_dsp             ,   
                        "simple_alt"                )
            
                log.Log("Salida FileTDsp"           ,   
                        sysstr_dsp                  ,   
                        "simple_alt"                )

    
            elif preprocess_type == preprocess_trigger:
                #- Aqui tiene sentido el fichero de reglas
            
                syscall_dsp = ofdsp.getRunStr()
        
                log.Log(log.dlines                  ,   log.dlines      )            
                log.Log("Llamada FileDsp"           ,   log.bline       ) 
                log.Log(syscall_dsp                 ,   log.bline       )
                log.Log(log.lines                   ,   log.lines       )
    
            
                log.Log("Entra por Bandera" ,   log.bline           )    
    
                tipo_preproceso = "Scripts Python"
                syscode_dsp = ofdsp.getSysCode()
                str_syscode_dsp = str (syscode_dsp)
        
                sysstr_dsp      = ofdsp.getSysOutStr()
    
                log.Log(log.dlines                  ,   log.dlines      )            
                log.Log("Resultado FiletDsp"        ,   str_syscode_dsp )
                log.Log(log.lines                   ,   log.lines       )
        
                log.Log("Salida FiletDsp"           ,   log.lines       )
                log.Log(log.dlines                  ,   log.dlines      )
                log.Log(sysstr_dsp                  ,   log.bline       )
                log.Log(log.endlines                ,   log.endlines    )    
    
    
    
            if syscode_dsp == 0:        
    
                #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
                #   D. BACKUP Y BORRADO DE BANDERA
                #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
    
                log.Log("Resultado DSP Correcto"    ,   
                        str_syscode_dsp             ,
                        "square_alt"                )
    
                log.Log("Tipo"                      ,   
                        tipo_preproceso             ,
                        "simple_simple"             )
    
    
                
                #- Solo debe borrar la bandera si es proceso de bandera
                
                if preprocess_type == "-r":
    
    
                    #-Como hemos cambiado el fichero hemos perdido la bandera
                    #- La generamos
                    source_filename_trg = ofdsp.getSourceFileName()
                    source_filename     = ofdsp.getSourceFileNameNoExt()
    
                    backup_path         = ofdsp.getBackupDir()
    
                    fban = File()
    
                    log.Log("Borrando Fichero Bandera"  ,   source_filename_trg )
                    fban.deleteFile(source_filename_trg)            
                    log.Log("Bandera borrada"           ,   log.bline           )
    
                    log.Log("Borrando Fichero "         ,   source_filename_trg )
                    fban.deleteFile(source_filename)            
                    log.Log("Fichero borrado"           ,   log.bline           )
    
    ##                log.__Log("Carpeta backup"            ,   backup_path     )
    ##                log.__Log("Copiando fichero"          ,   source_filename )
                      
    ##                fban.copyfile(source_filename       ,   backup_path     )
            else:

                if preprocess_type == "-r":
                    #- Preproceso por bandera
                    log.Log("Resultado DSP Erroneo"    ,   
                                str_syscode_dsp             ,
                                "square_alt"                )

                else:
                    #- Preproceso por tiempo
                    log.Log("Resultado DSP Erroneo"    ,   
                                str_syscode_dsp             ,
                                "square_alt"                )
            
                    log.Log("Tipo"                      ,   
                                tipo_preproceso             ,
                                "simple_simple"             )

                #- Caso en que se ha modificado en tiempo
                
                exit(syscode_dsp)
        
            #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
            #   A. FIN OBTENCION METADATOS
            #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
    
                
        else:
            sp_info = "Final Algoritmo.Argumentos no correctos." 
    
            cad_out = sp_info + str(numero_argumentos)
            print (cad_out)
    
            exit(1)
        #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
        #              F I N A L   P R O G R A M A
        #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

#- Formato excepciones 2.5 en adelante
except SyntaxError as e:

## Ajuste excepciones 2.4
##    except SyntaxError:
##    ht, e = sys.exc_info()[:2]
    cad_out = "Error de sintaxis. Lineas no respetadas" + \
    e.message + e.args


except ImportError as e:
    cad_out = "Error al importar "

except ValueError as e:
    cad_out = "Error de tipo - parsear un numerico  "  + e.message



except AttributeError as e:
    cad_out = "Error al pasar un atributo " 

except IndentationError as e:
    cad_out = "Error al tabular el codigo" + e.message + str(e.args)   

except IndexError as e:
    cad_out = "Error al acceder a una posicion que no existe en lista" \
        + e.message    + str(e.args)

        
except NameError:
    cad_out = "Error de tipo de datos. Acceder como string a una lista, por ejemplo"    

except TypeError:
    cad_out = "Error de tipo de datos"

## No se si existe en esta version de python
## except WindowsError as e:
##    print "Error al acceder a un fichero en windows" \
##        + e.message    + str(e.args)


except Exception:
    exc_type, exc_obj, exc_tb = sys.exc_info()
    fname = re.split(exc_tb.tb_frame.f_code.co_filename,os.path)[1]
    cad_out = "Descubriendo excepciones"
    print(exc_type, fname, exc_tb.tb_lineno)

