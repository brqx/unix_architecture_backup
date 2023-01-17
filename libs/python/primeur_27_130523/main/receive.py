#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
-+ Clases utilizadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- FileList      : Clase de spazio para listado de atributos
-----------------------------------------------------------
- FileAcq       : Clase de spazio para acq
-----------------------------------------------------------
- PostProceso   : Clase de PostProceso
-----------------------------------------------------------
- Log           : Clase de gestion de logs
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- pm_string
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- os 
-----------------------------------------------------------
- sys
===========================================================
+ Process Status  : [130509]
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

from oo_fileacq import FileAcq
from oo_filelist import FileList

from oo_postproceso import PostProceso

from oo_log import Log

from oo_rules_sff_est   import RulesSffEst

#- Importacion de librerias de primeur

import pm_string

#- Importacion de librerias del sistema

import os, sys


sp              = ""
sp_fullcomando  = ""
sp_info         = ""

#-Variable que nos permitira imprimir en pantalla o en fichero de log
LOG_SHOW            =   "screen"
log_level           = 40     #- Debe indicar no logs
log_class_level     = 0
log_show            =   "screen"
##log_show_file       =   "screen"
##log_show_mix        =   "screen"

log_show_file       =   "file"
log_show_mix        =   "screenandfile"

cfg_tracesrv         =   "tracesrv.ini"   

log_file_trc         =   "ev_extraer.log"
log_file_hst         =   "ev_extraer.hst"
log_file_err         =   "ev_extraer.err"

log_file            =   ""
rules_file          =   ""

cadena_out          = ""

try:
    sp          = os.environ['BASEPYTHON']
    pypath      = os.environ['PYTHONPATH']
    spazio_path = os.environ['SPAZIO']
    

    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
    #              I N I C I O   P R O G R A M A
    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

    
    #-- Clase de log
    program     =   "receive"


    #-Logger general de impresion en pantalla
    log         =   Log(program             , 
                        log_level           , 
                        log_class_level     ,
                        log_show_mix        ,
                        log_file            )
    #-Debemos tener un metodo publico de logs para los programas
    # principales


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


    log.Log("Codigo fichero configuracion"  ,
            str_open_file_code              ,
            "square_double"                 )

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

        tracesrv_ini = log.cfg + log.slash + cfg_tracesrv
      


    #- Usamos log_path porque ya hay un metodo llamado log
    
        log.cfg = rulsff.cfg
        log.tmp = rulsff.tmp
        log.log_path = rulsff.log_path


        log.Log("Ruta configuracion"                        , 
                log.cfg                                     ,
                "simple_simple"                             )                    

        log.Log("Ruta temporal"                             , 
                log.tmp                                     ,
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
  
        
        numero_argumentos = len(sys.argv)
        str_num_args      = str(numero_argumentos)
        
        # Script de python y sus parametros    
        sp_fullcomando  =   pm_string.str_args(sys.argv, numero_argumentos)  
    
    
        log.Log("Comando lanzado"       , 
                sp_fullcomando          , "double_alt")
    
        log.Log("Numero argumentos"     , 
                str_num_args            , "simple_alt")
       
        #- Generamos el Log de historico
    ##    pm_logpmt.log_his(sp_fullcomando , "primeur", "66", LOG_SHOW)
    
    
        ## numero_argumentos - 9 con usuario y clave
        if numero_argumentos == 7:
        #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
        #   B. INICIO CHECK ARGS
        #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
    
                
            sp_info = "Inicio Algoritmo.Argumentos correctos." 
    
            log.Log(sp_info , 
                    str(numero_argumentos),
                    "simple_simple")        
    
            ##?GRNAME? ?EVNAME? ?SESS_ID? ?QMANAGER? ?QUEUE? ?INT_NUM?
           
            sp_grname   =   sys.argv[1]     # EvGr1
            sp_evname   =   sys.argv[2]     # EvGr1Ev1       
            sp_sess_id  =   sys.argv[3]     # 2A000000
            sp_qmanager =   sys.argv[4]     # fuduntu
            sp_queue    =   sys.argv[5]     # EVENTQUEUE
            sp_numint   =   sys.argv[6]     # 0005000000000016
    ##      sp_user     =   sys.argv[7]     # Usuario
    ##      sp_pass     =   sys.argv[8]     # Clave
       
    
            #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
            #   A. INICIO OBTENCION METADATOS
            #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
    
    ##        u = sp_user
    ##        p = sp_pass
    
            #-Ajuste multi sistema
            nod     = log.pmt_ind + "oNOD"      
            csv     = log.pmt_ind + "o CSV"    
            banner  = log.pmt_ind + "oNOBanner"
    
            log.Log("Antes llamada FileList"    ,   
                    log.bline                   , "simple_simple"   )
            log.Log("QManager"                  ,   sp_qmanager     )
            log.Log("Queue"                     ,   sp_queue        )
            log.Log("Num Int"                   ,   sp_numint       )
            log.Log("Nod"                       ,   nod             )
            log.Log("Csv"                       ,   csv             )
            log.Log("Banner"                    ,   
                    banner                      , "simple_simple"   )
    ##        log.Log("Usuario",banner)
    ##        log.Log("Clave",banner)
            
    
            #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
            #   B. FILE LIST
            #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
    
    
            oflist = FileList(sp_qmanager       , 
                              sp_queue          , 
                              sp_numint         , 
                              nod, csv, banner  ,
                              log_level         ,   
                              log_class_level   ,
                              log_show          )        
    
            syscall_lis     =   oflist.getRunStr()
            str_syscall_lis =   str(syscall_lis)
    
            syscode_lis     =   oflist.getSysCode()
            str_syscode_lis =   str(syscode_lis)
    
            sysstr_lis      =   oflist.getSysOutStr()
            str_sysstr_lis  =   str(sysstr_lis)
    
    
            log.Log("Llamada FileList"          ,   
                    syscall_lis                 ,   "double_alt"    )
    
    
            log.Log("Resultado Filelist"        ,   
                    str_syscode_lis             ,   "square_alt"    )
            
    
            log.Log("Salida FileList"           ,   
                    sysstr_lis                  ,   "double_double" )
    
                
            if syscode_lis == 0:        
    
                #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
                #   C. FILE ACQ
                #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
    
    
                qm = sp_qmanager
                q = sp_queue
                n = sp_numint
                ci = oflist.getCorrelId()
    
                se = oflist.getSender()
    
                sf = oflist.getSourceFileName()
                df = oflist.getDestinationFileName()
                rt = oflist.getDirectory()
                de = oflist.getDescription()
    
    
                correlation_id_posible = ci
                
                rules_filename  = log.cfg + log.slash + \
                correlation_id_posible + "_acq.rul"
                          
                log.Log("Nombre Fichero Reglas" ,
                        rules_filename          , 
                        "square_double"         )
    
    
                #-Aqui tenemos dos casos que exista o que no exista
    
                rul2sff = RulesSffEst(rules_filename        ,
                                      rules_comment         ,
                                      log_level             ,
                                      log_class_level       ,
                                      log_show              )    
    
                open_frules_code        =rul2sff.getOpenFileCode()
                str_open_frules_code    = str(open_file_code)
            
                log.Log("Codigo fichero reglas",
                        str_open_frules_code,
                        "square_double")

##                if open_frules_code == 0:
                #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
                #   D. INICIO CHECK RULES FILE
                #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

                
   
                log.Log("Antes llamada FileAcq"     ,   
                        log.bline                   , "simple_simple"       )
                log.Log("QManager"                  ,   sp_qmanager         )
                log.Log("Queue"                     ,   sp_queue            )
                log.Log("Num Int"                   ,   sp_numint           )
                log.Log("Correlation Id"            ,   ci                  )
                log.Log("Emisor"                    ,   se                  )
                log.Log("Source FileName"           ,   
                        sf                          , "square_alt"          )
                log.Log("Destination Filename"      ,   df                  )
                log.Log("Directory"                 ,   rt                  )
                log.Log("Description"               ,   
                        de                          , "simple_simple"       )
    
                #-Acq debe funcionar con y sin reglas
                ofacq = FileAcq(sp_qmanager             , 
                                sp_queue                , 
                                sp_numint               , 
                                df, sf , ci , se, rt    , 
                                rules_filename          , 
                                log_level               ,
                                log_class_level         ,
                                log_show                )
    
                #- Debe procesar la informacion que tenga acq ylanzar
                #  el comando
                
                ofacq.processAcq()


                #- La llamada puede devolver una cadena vacia
                syscall_acq     =   ofacq.getRunStr()
                str_syscall_acq =   str(syscall_acq)
    
                syscode_acq     =   ofacq.getSysCode()
                str_syscode_acq =   str(syscode_acq)


    
                sysstr_acq      =   ofacq.getSysOutStr()
                str_sysstr_acq  =   str(sysstr_acq)
    
                log.Log("Llamada Acq"                   ,   
                        str_syscall_acq                 ,   
                        "double_alt"                    )

##                log.Log("Salida Acq"                    ,   
##                        str_sysstr_acq                  ,   
##                         "double_alt"                   )    

                log.Log("Resultado Acq"                 ,   
                        str_syscode_acq                 ,
                        "double_alt"                    )    

    
                if syscode_acq == 0:        

                    log.Log("Llamada FileAcq Correcta"          , 
                            str_sysstr_acq                      ,
                            "double_alt"                        )
                  
    
                    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
                    #   D. POST PROCESO
                    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
                    #- El post proceso solo debe ejecutarse si
                    #  hay fichero de reglas
        
                    exist_rules_file = ofacq.getExistRulesFile()        

                    if exist_rules_file:
        
                        clean_df        = ofacq.getCleanDestinationFileName()
                        df              = ofacq.getDestinationFileName()
                        d               = ofacq.getDirectory()
                        post_process    = ofacq.getPostProcess()
                        post_args       = ofacq.getPostProcessArgs()
                        comp            = ofacq.getCompress()
                        trg             = ofacq.getTrigger()
            
    
                        log.Log("Antes de invocar al Post Proceso"          , 
                                log.bline                                   ,
                                "simple_alt"                                )
    
                        log.Log("Source FileName"       ,   sf              )
                        log.Log("Clean_Dest FileName"   ,   clean_df        )
                        log.Log("Destination FileName"  ,   df              )
                        log.Log("Directory"             ,   d               )
                        log.Log("Post Process"          ,   post_process    )
                        log.Log("Args Post Process"     ,   post_args       )
                        log.Log("Cmpresion"             ,   comp            )
                        log.Log("Trigger"               ,   trg             )
                        
                        oPost = PostProceso(
                                df                      , 
                                d                       , 
                                post_process            ,
                                comp                    , 
                                trg                     ,
                                log_level               ,
                                log_class_level         ,
                                log_show                )           

           
                        oPost.setPostArgs(post_args)           
                        oPost.processPost()


                else:
                    #- Propagacion de los errores
#                    error_str = ofacq.getError()
                    log.Log("Error llamada FileAcq"             , 
                            str_sysstr_acq                      ,
                            "double_double"                     )
        
            else:
                #-Al ser un error recuperamos con get_valor
        
                log.Log("Error llamada Filelist"            , 
                        sysstr_lis                          ,
                        "double_double"                     )
    
            #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
            #   A. FIN OBTENCION METADATOS
            #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
    
                
        else:
            sp_info = "Final Algoritmo.Argumentos no correctos." 
    
            log.Log(sp_info , 
                    str(numero_argumentos)      , "square_double")        

            log_err.Log(sp_info , 
                    str(numero_argumentos)      , "square_double")        

    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
    #              F I N A L   P R O G R A M A
    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

#- Formato excepciones 2.5 en adelante
except SyntaxError as e:
    cadena_out = "Error de sintaxis. Lineas no respetadas" + \
                 e.message    + str(e.args)
    print(cadena_out)
    pass

except ImportError as e:
	cadena_out = "Error al importar " + \
                 e.message + str(e.args)

except ValueError as e:
	cadena_out = "Error de tipo - parsear un numerico  " + \
				 e.message    + str(e.args)

except AttributeError as e:
	cadena_out = "Error al pasar un atributo " + e.message + str(e.args)  


except IndentationError as e:
	cadena_out = "Error al tabular el codigo" + e.message + str(e.args)


except IndexError as e:
	cadena_out = "Error al acceder a una posicion que no existe en lista" \
				+ e.message    + str(e.args)

        
except NameError:
    print ("Error de tipo de datos. Acceder como string a una lista, por ejemplo")    

except TypeError:
    print ("Error de tipo de datos")

except Exception:
    exc_type, exc_obj, exc_tb = sys.exc_info()
    fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
    print ("Descubriendo excepciones")
#	cadena_out = exc_type + fname + exc_tb.tb_lineno
#	print  (exc_type, fname, exc_tb.tb_lineno)

# print(cadena_out)
