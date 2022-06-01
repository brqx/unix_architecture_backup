#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.5
@pythonver: 3.3
-----------------------------------------------------------
-+ Clases utilizadas        : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- FileList          - Clase de spazio para listado de atributos
-----------------------------------------------------------
- FileAcq           - Clase de spazio para acq
-----------------------------------------------------------
- FileSpv           - Clase de spazio para spv
-----------------------------------------------------------
- PostProceso       - Clase de PostProceso
-----------------------------------------------------------
- Log               - Clase de gestion de logs
-----------------------------------------------------------
- RulesSffESt       - Clase de Reglas en fichero
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
+ Process Status  : [130701]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [4] [_] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [3] [_] [5]
===========================================================
"""
script_version  = "0.0.7"
arch_version    = "0.0.5"
script_change   = "130701"
arch_change     = "130701" 

#- Importacion de clases utilizadas

import os, sys

## print ("antes de nada")
## print (os.environ['PYTHONPATH'])
## print (os.environ['PATH'])

from oo_fileacq         import FileAcq

from oo_filespev        import FileSpv

from oo_filelist        import FileList

from oo_postproceso     import PostProceso

from oo_log             import Log

from oo_rules_sff_est   import RulesSffEst

#- Importacion de librerias de primeur

import pm_string

#- Importacion de librerias del sistema


#- Python 3.3
import re


sp                          =   ""
sp_fullcomando              =   ""
sp_info                     =   ""

#-Nuevos niveles de log - Clarificacion
#-- [ 0 ]  - Muestra solo los logs de salida principales
#-- [-1 ]  - No genera nada por pantalla

#-Variable que nos permitira imprimir en pantalla o en fichero de log

log_level_no_logs           =  -1   #- No genera ningun log
log_level_main_logs         =   0   #- Solo genera principales
log_level_normal_logs       =   30  #- Genera logs de funcionalidad
log_level_full_logs         =   90  #- Genera todos los logs

#-Estableciendo nivel de log
log_level                   =   log_level_normal_logs
log_class_level             =   0

#-Nivel Main Log - Log de llamadas principales
main_log_level              =   log_level + 1

log_show                    =   "file"
##log_show_file       =   "screen"
##log_show_mix        =   "screen"

log_show_file               =   "file"
log_show_mix                =   "screenandfile"

cfg_tracesrv                =   "tracesrv.ini"   

log_file_trc                =   "ev_extraer.log"
log_file_hst                =   "ev_extraer.hst"
log_file_err                =   "ev_extraer.err"

log_file                    =   ""

log_size                    =   1000000
rules_file                  =   ""

cadena_out                  =   ""

try:
    sp                      = os.environ['BASEPYTHON']
    pypath                  = os.environ['PYTHONPATH']
    spazio_path             = os.environ['SPAZIO']
    shell_var               = ""

    if os.name != "nt":
        shell_var           = os.environ['SHELL']    

    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
    #              I N I C I O   P R O G R A M A
    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
   
    #-- Clase de log
    program                 =   "receive"

    #-Logger general de impresion en pantalla
    log                     =   Log(program                     , 
                                    log_level                   , 
                                    log_class_level             ,
                                    log_show                    ,
                                    log_file                    ,
                                    log_size                    )



    #-Logger de mensajes principales
    mainlog                     =   Log(program                 , 
                                    main_log_level              , 
                                    log_class_level             ,
                                    log_show                    ,
                                    log_file                    ,
                                    log_size                    )


    #-Debemos tener un metodo publico de logs para los programas
    # principales


    if len(sys.argv) == 2:
        indicador = log.pmt_ind + "h"
        if sys.argv[1] == indicador:
            log.set_log_show(log_show_mix)
            log.sysver(script_version               , 
                       script_change                , 
                       arch_version                 , 
                       arch_change                  )

            exit(99)


    log.spazio          =   spazio_path
    mainlog.spazio      =   spazio_path


    mainlog.Log("Carga librerias correctas" ,
                log.bline                   , 
                "square_simple"             )

    mainlog.Log("SPAZIO:"                   ,
                spazio_path                 , 
                "simple_simple"             )

    mainlog.Log("PYTHONPATH:"               ,
                pypath                      , 
                "double_simple"             )

    #- Esta parte solo vale para unix
    log.Log("SHELL:"                    ,
            shell_var                   , 
            "double_simple"             )

    log.Log("SLASH:"                    ,
            log.slash                   , 
            "simple_simple"             )

            


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


    log.Log("Codigo fichero configuracion"              ,
            str_open_file_code                          ,
            "square_double"                             )

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
    
        log.tmp_path = rulsff.tmp_path
        log.cfg_path = rulsff.cfg_path
        log.log_path = rulsff.log_path

        mainlog.tmp_path = rulsff.tmp_path
        mainlog.cfg_path = rulsff.cfg_path
        mainlog.log_path = rulsff.log_path



        log.Log("Ruta configuracion"                        ,
                log.cfg_path                                ,
                "simple_simple"                             )                    

        log.Log("Ruta temporal"                             , 
                log.tmp_path                                ,
                "simple_simple"                             )                    

        log.Log("Ruta logs"                                 , 
                log.log_path                                ,
                "simple_simple"                             )                   


        log.Log("Ruta TraceSrv"                             , 
                tracesrv_ini                                ,
                "simple_simple"                             )                    


        #-Gestionar size de los logs


        
        rulsff_tracesrv = RulesSffEst(tracesrv_ini          ,
                                      config_comment        ,
                                      log_level             ,
                                      log_class_level       ,
                                      log_show              )    



        size_log_key    = "FILE_MAXSIZE"
        tupla_correl_id = ""


        size_log  = rulsff_tracesrv.getKeyValue( 
                                            size_log_key    ,
                                            tracesrv_ini    ,
                                            tupla_correl_id ,
                                            config_comment  )


        log.Log("Size logs"                                 , 
                size_log                                    ,
                "simple_simple"                             )                    

        if size_log != "":
            log_size = int(size_log)
        


        #-Logger historico - trazas y error
        hst_file = log.log_path + log.slash + log_file_hst
        log_file = log.log_path + log.slash + log_file_trc
        err_file = log.log_path + log.slash + log_file_err

        log.Log("Fichero historico"         , 
                hst_file                    ,
                "simple_simple"             )                    


        log.Log("Fichero trazas"            , 
                log_file                    ,
                "simple_simple"             )                    


        log.Log("Fichero errores"           , 
                err_file                    ,
                "simple_simple"             )
                


        #- Log historico
        log_hst         =   Log(program             , 
                            main_log_level          , 
                            log_class_level         ,
                            log_show_file           ,
                            hst_file                ,
                            log_size                )

        #- Log de errores
        log_err         =   Log(program             , 
                            main_log_level          , 
                            log_class_level         ,
                            log_show_file           ,
                            err_file                ,
                            log_size                )


        #- Log de traceo - a partir de aqui se trace a fichero
        #-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        log.set_log_file(log_file)    
        log.set_log_show(log_show)


        #- Size de los logs por defecto
        log.set_log_size(log_size)


        #- Main Log de traceo - a partir de aqui se trace a fichero
        #-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        mainlog.set_log_file(log_file)    
        mainlog.set_log_show(log_show)


        #- Size de los logs por defecto
        mainlog.set_log_size(log_size)



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
        sp_fullcomando  =   pm_string.str_args(sys.argv             , 
                                               numero_argumentos    )  
    
    
        mainlog.Log("Comando lanzado"               , 
                sp_fullcomando                  , 
                "double_simple"                 )
    
        mainlog.Log("Numero argumentos"             , 
                str_num_args                    , 
                "simple_alt"                    )
       
        #- Generamos el Log de historico
    ##    pm_logpmt.log_his(sp_fullcomando , "primeur", "66", LOG_SHOW)
    
    
        ## numero_argumentos - 9 con usuario y clave
        if numero_argumentos == 7:
        #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
        #   B. INICIO CHECK ARGS
        #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
    
                
            sp_info = "Inicio Algoritmo.Argumentos correctos." 
    
            log.Log(sp_info                     , 
                    str_num_args                ,
                    "simple_simple"             )        
    
            ##?GRNAME? ?EVNAME? ?SESS_ID? ?QMANAGER? ?QUEUE? ?INT_NUM?

            shell       =   sys.argv[0]     # EvGr1
           
            sp_grname   =   sys.argv[1]     # EvGr1
            sp_evname   =   sys.argv[2]     # EvGr1Ev1       
            sp_sess_id  =   sys.argv[3]     # 2A000000
            sp_qmanager =   sys.argv[4]     # fuduntu
            sp_queue    =   sys.argv[5]     # EVENTQUEUE
            sp_numint   =   sys.argv[6]     # 0005000000000016
    ##      sp_user     =   sys.argv[7]     # Usuario
    ##      sp_pass     =   sys.argv[8]     # Clave
       

            mainlog.Log("Parametros de entrada"     ,   
                        log.bline                   , 
                        "double_alt"                )

            mainlog.Log("Posicion 0 - Shell"        ,   
                        shell                       ,
                        "double_simple"             )

            mainlog.Log("Posicion 1 - Grupo"        ,   
                        sp_grname                   ,
                        "simple_simple"             )
                    
            mainlog.Log("Posicion 2 - Evento"       ,   
                        sp_evname                   ,
                        "simple_simple"             )

            mainlog.Log("Posicion 3 - Id Sesion"    ,   
                        sp_sess_id                  ,
                        "simple_simple"             )

            mainlog.Log("Posicion 4 - QM"           ,   
                        sp_qmanager                 ,
                        "simple_simple"             )

            mainlog.Log("Posicion 5 - Queue"        ,   
                        sp_queue                    ,
                        "simple_simple"             )

            mainlog.Log("Posicion 6 - NumInt"       ,   
                        sp_numint                   ,
                        "simple_simple"             )


    
            #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
            #   C. INICIO OBTENCION METADATOS
            #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
    
    ##        u = sp_user
    ##        p = sp_pass
    
            #-Ajuste multi sistema
            nod     = log.pmt_ind + "oNOD"      
            csv     = log.pmt_ind + "o CSV"    
            banner  = log.pmt_ind + "oNOBanner"
    
            mainlog.Log("Antes llamada FileList"    ,   
                        log.bline                   , 
                        "double_alt"                )

            mainlog.Log("QManager"                  ,   
                        sp_qmanager                 ,
                        "simple_simple"             )
                    
            mainlog.Log("Queue"                     ,   
                        sp_queue                    ,
                        "simple_simple"             )
            
            mainlog.Log("Num Int"                   ,   
                        sp_numint                   ,
                        "simple_simple"             )
                    
            mainlog.Log("Nod"                       ,   
                        nod                         )
                    
            mainlog.Log("Csv"                       ,   
                        csv                         )
                    
            mainlog.Log("Banner"                    ,   
                        banner                      , 
                        "simple_simple"             )
    ##        log.Log("Usuario",banner)
    ##        log.Log("Clave",banner)
            
    
            #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
            #   D. FILE LIST
            #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
    
    
            oflist = FileList(sp_qmanager       , 
                              sp_queue          , 
                              sp_numint         , 
                              nod               , 
                              csv               , 
                              banner            ,
                              log_level         ,   
                              log_class_level   ,
                              log_show          ,
                              log_file          ,
                              err_file          ,
                              log_size          )        

   
            syscall_lis     =   oflist.getRunStr()
            str_syscall_lis =   str(syscall_lis)
    
            syscode_lis     =   oflist.getSysCode()
            str_syscode_lis =   str(syscode_lis)
    
            sysstr_lis      =   oflist.getSysOutStr()
            str_sysstr_lis  =   str(sysstr_lis)
    
    
    
            mainlog.Log("Llamada FileList"          ,   
                        syscall_lis                 ,   
                        "double_alt"                )
    
    
            mainlog.Log("Resultado Filelist"        ,   
                        str_syscode_lis             ,   
                        "square_alt"                )
            
    
            mainlog.Log("Salida FileList"           ,   
                        sysstr_lis                  ,   
                        "double_alt"                )
    
               
            if syscode_lis == 0:        
    
                #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
                #   E. FILE ACQ
                #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
    
    
                correlation_id              = oflist.getCorrelId()
    
                sender = oflist.getSender()
    
                source_filename             = \
                                    oflist.getSourceFileName()
                destination_filename        = \
                                    oflist.getDestinationFileName()

                directory   = oflist.getDirectory()
                description = oflist.getDescription()
    
                    
                rules_filename  =   log.cfg_path    +   \
                                    log.slash       +   \
                                    correlation_id  + "_acq.rul"
                          
                log.Log("Nombre Fichero Reglas" ,
                        rules_filename          , 
                        "square_alt"            )
    
    
                #-Aqui tenemos dos casos que exista o que no exista
    
                rul2sff = RulesSffEst(rules_filename        ,
                                      rules_comment         ,
                                      log_level             ,
                                      log_class_level       ,
                                      log_show              ,
                                      log_file              ,
                                      err_file              ,
                                      log_size              )    
    
                open_frules_code        =   rul2sff.getOpenFileCode()
                str_open_frules_code    =   str(open_file_code)
            
                log.Log("Codigo fichero reglas" ,
                        str_open_frules_code    ,
                        "square_alt"            )

##                if open_frules_code == 0:
                #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
                #   E1. INICIO CHECK RULES FILE
                #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
             
   
                mainlog.Log("Antes llamada FileAcq"     ,   
                            log.bline                   , 
                            "double_simple"             )

                mainlog.Log("QManager"                  ,   
                            sp_qmanager                 )

                mainlog.Log("Queue"                     ,   
                            sp_queue                    )

                mainlog.Log("Num Int"                   ,   
                            sp_numint                   )

                mainlog.Log("Correlation Id"            ,   
                            correlation_id              ,
                            "simple_simple"             )

                mainlog.Log("Emisor"                    ,   
                            sender                      ,
                            "simple_simple"             )

                mainlog.Log("Source FileName"           ,   
                            source_filename             , 
                            "square_simple"             )

                mainlog.Log("Destination Filename"      ,   
                            destination_filename        ,
                            "simple_simple"             )

                mainlog.Log("Directory"                 ,   
                            directory                   ,
                            "simple_Simiple"            )

                mainlog.Log("Description"               ,   
                            description                 , 
                            "simple_simple"             )
    
    
                #-Acq debe funcionar con y sin reglas
                ofacq = FileAcq(sp_qmanager             , 
                                sp_queue                , 
                                sp_numint               , 
                                destination_filename    , 
                                source_filename         , 
                                correlation_id          , 
                                sender                  , 
                                directory               , 
                                rules_filename          , 
                                log_level               ,
                                log_class_level         ,
                                log_show                ,
                                log_file                ,
                                err_file                ,
                                log_size                )

   
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
    
                mainlog.Log("Llamada Acq"                   ,   
                            str_syscall_acq                 ,   
                            "double_alt"                    )

##                log.Log("Salida Acq"                    ,   
##                        str_sysstr_acq                  ,   
##                         "double_alt"                   )    

                mainlog.Log("Resultado Acq"                 ,   
                            str_syscode_acq                 ,
                            "double_alt"                    )    

    
                #-Preparamos el spev como si fuera a ir correcta la recepcion            
                spev_type    = "E"
    
                if syscode_acq == 0:        

                    log.Log("Llamada FileAcq Correcta"          , 
                            str_sysstr_acq                      ,
                            "double_alt"                        )
                  
    
                    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
                    #   F. POST PROCESO
                    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
                    #- El post proceso solo debe ejecutarse si
                    #  hay fichero de reglas
        
                    exist_rules_file = ofacq.getExistRulesFile()        

                    if exist_rules_file:
        
                        clean_df                = \
                                        ofacq.getCleanDestinationFileName()

                        destination_filename    = \
                                        ofacq.getDestinationFileName()

                        directory               = \
                                        ofacq.getDirectory()

                        post_process    = ofacq.getPostProcess()
                        post_args       = ofacq.getPostProcessArgs()
                        comp            = ofacq.getCompress()
                        trg             = ofacq.getTrigger()
                        copydup         = ofacq.getCopyDup()
                        deletefile      = ofacq.getDeleteFile()

          
    
                        mainlog.Log("Antes de invocar al Post Proceso"          , 
                                    log.bline                                   ,
                                    "simple_alt"                                )
    
                        mainlog.Log("Source FileName"                           ,   
                                    source_filename                             ,
                                    "simple_simple"                             )
                                
                        mainlog.Log("Clean_Dest FileName"                       ,   
                                    clean_df                                    ,
                                    "simple_simple"                             )

                        mainlog.Log("Destination FileName"                      ,   
                                    destination_filename                        ,
                                    "simple_simple"                             )
                                
                        mainlog.Log("Directory"                                 ,   
                                    directory                                   ,
                                    "simple_simple"                             )
                                
                        mainlog.Log("Post Process"                              ,   
                                    post_process                                ,
                                    "simple_simple"                             )
                                
                        mainlog.Log("Args Post Process"                         ,   
                                    post_args                                   ,
                                    "simple_simple"                             )
                                
                        mainlog.Log("Compresion"                                ,   
                                    comp                                        ,
                                    "simple_simple"                             )

                        mainlog.Log("Trigger"                                   ,
                                    trg                                         ,
                                    "simple_simple"                             )


                        mainlog.Log("CopyDup - Duplicados"                      ,
                                    copydup                                     ,
                                    "simple_simple"                             )


                        mainlog.Log("CopyDup - Delete Extracted File "          ,
                                    deletefile                                  ,
                                    "simple_simple"                             )

                        
                        oPost = PostProceso(
                                destination_filename    , 
                                directory               , 
                                post_process            ,
                                comp                    , 
                                trg                     ,
                                copydup                 ,                                
                                deletefile              ,
                                log_level               ,
                                log_class_level         ,
                                log_show                ,                
                                log_file                ,
                                err_file                ,
                                log_size                )           

           
                        oPost.setPostArgs(post_args)           
                        oPost.processPost()


                        syscode_psp     =   oPost.getPostExitCode()
                        str_syscode_psp =   str(syscode_psp)
        
        
            
                        sysstr_psp      =   oPost.getPostExitStr()
                        str_sysstr_psp  =   str(sysstr_psp)

            
                        mainlog.Log("Codigo Resultado Post"                     ,   
                                    str_syscode_psp                             ,
                                    "simple_alt"                                )    


                        mainlog.Log("Mensaje Resultado Post"                    ,   
                                    str_sysstr_psp                              ,
                                    "double_alt"                                )    



                    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
                    #   F1. INICIO SPEV - ACTIVACION END - OK
                    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

                    spev_type    = "E"
                    

                else:
                    #- Propagacion de los errores
#                    error_str = ofacq.getError()
                    log_err.Log("Error llamada FileAcq"             , 
                                str_sysstr_acq                      ,
                                "double_double"                     )
        
                    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
                    #   F1. INICIO SPEV - ACTIVACION ERROR - REINTENTO
                    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

                    spev_type    = "R"



                #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
                #   X1. INICIO SPEV
                #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

                #-Filtro activo para spevcmd                

                run_spev = ""
                    
                if run_spev != "":
                    
                    oSpev = FileSpv(sp_qmanager                 , 
                                    sp_sess_id                  , 
                                    spev_type                   , 
                                    log_level                   ,
                                    log_class_level             ,
                                    log_show                    ,
                                    log_file                    ,
                                    err_file                    ,
                                    log_size                    )           
    
    
                    oSpev.processSpv()
        
        
                    #- La llamada puede devolver una cadena vacia
                    syscall_spv     =   oSpev.getRunStr()
                    str_syscall_spv =   str(syscall_spv)
            
                    syscode_spv     =   oSpev.getSysCode()
                    str_syscode_spv =   str(syscode_spv)
        
        
            
                    sysstr_spv      =   oSpev.getSysOutStr()
                    str_sysstr_spv  =   str(sysstr_spv)

            
                    mainlog.Log("Llamada Spv"                       ,   
                                str_syscall_spv                     ,   
                                "double_alt"                        )
        
        ##                log.Log("Salida Spv"                      ,   
        ##                        str_sysstr_spv                    ,   
        ##                         "double_alt"                     )    
        
                    mainlog.Log("Resultado Spv"                     ,   
                                str_syscode_spv                     ,
                                "double_alt"                        )    
    
    
                    if syscode_spv == 0:        
        
                        log.Log("Llamada Spev Correcta"         , 
                                str_sysstr_spv                  ,
                                "double_alt"                    )



            else:
                #-Al ser un error recuperamos con get_valor
        
                log_err.Log("Error llamada Filelist"            , 
                            sysstr_lis                          ,
                            "double_double"                     )
    
                exit(6)        
            #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
            #   C. FIN OBTENCION METADATOS
            #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
    
                
        else:
            sp_info = "Final Algoritmo.Argumentos no correctos." 
    
            log_err.Log(sp_info                                 , 
                    log.bline                                   , 
                    "square_double"                             )        

            sp_info = "Numero de parametros pasados" 

            log_err.Log(sp_info                                 , 
                    str(numero_argumentos)                      , 
                    "simple_double"                             )        

            exit(7)
        #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
        #   B. FIN CHECK ARGS
        #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=


    else:
        #- En este nivel no hay Error Log ni History Log
        sp_info = "Error. No se puede obtener la configuracion de Spazio." 

        mainlog.Log(sp_info                             , 
                    log.bline                           , 
                    "square_double"                     )        
        exit(8)


    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
    #   A. FIN CHECK SPAZIO INI
    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=



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
    fname = re.split(exc_tb.tb_frame.f_code.co_filename,os.path)[1]
    print ("Descubriendo excepciones")
#	cadena_out = exc_type + fname + exc_tb.tb_lineno
#	print  (exc_type, fname, exc_tb.tb_lineno)

# print(cadena_out)
