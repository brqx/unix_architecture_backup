#!/usr/bin/python
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

sp              = ""
sp_fullcomando  = ""
sp_info         = ""

#-Variable que nos permitira imprimir en pantalla o en fichero de log
LOG_SHOW="screen"


#- Imprime el path del sistema
##pp(sys.path)

try:
    sp              = os.environ['BASEPYTHON']
    pypath          = os.environ['PYTHONPATH']
    spazio_path     = os.environ['SPAZIO']


    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
    #              I N I C I O   P R O G R A M A
    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

    #-- Clase de log
    comando     =   "send"
    log         =   Log(comando)

    log.spazio  =   spazio_path
    

    log.Log("Carga librerias correctas"     ,log.bline)
    log.Log("SPAZIO:"                       ,log.bline )
    log.Log(spazio_path                     ,log.bline) 
    log.Log(log.lines                       ,log.lines)
    log.Log("PYTHONPATH:"                   ,log.bline )
    log.Log( 
        pm_string.str_args(sys.path,len(sys.path)) , log.bline)

    #-Establecimiento del directorio temporal de spazio
    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==

    spazio_ini  =   log.spazio + log.slash + "spazio.ini"
    clave = "CfgPath"

    rulsff = RulesSffEst(clave, spazio_ini)    
    log.tmp = rulsff.tmp
    log.log = rulsff.log
    log.cfg = rulsff.cfg
    
    log.Log("Ruta configuracion"        , log.cfg)                    
    log.Log("Ruta temporal"             , log.tmp)                    
##    log.Log("Ruta logs"                 , log.log)                    

    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==
        
    
    numero_argumentos   = len(sys.argv)
    str_num_args        = str(numero_argumentos)
    
    # Script de python y sus parametros    
    sp_fullcomando      = pm_string.str_args(sys.argv, numero_argumentos)  


    log.Log("Comando lanzado"       , sp_fullcomando)

    log.Log("Numero argumentos"     , str_num_args)

   
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

        log.__Log(sp_info , str(numero_argumentos))        

       
        source_filename   =   sys.argv[1]     # Nombre Fichero
        preprocess_type   =   sys.argv[2]     # Tipo_Preproceso 
        preprocess_args   =   sys.argv[3]     # Parametro


        log.__Log("Fichero_pasado", source_filename)
   

        #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
        #   A. INICIO OBTENCION METADATOS
        #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

        #-Este nombre aqui no lo podemo saber 
        reglas  = log.spazio + log.slash +  \
                  "rules" + log.slash + "send.dat"

        correlation_id_posible = preprocess_args

        reglas2  = log.cfg + log.slash + correlation_id_posible
                  
        log.__Log("Posible nombre Reglas" ,reglas2          )

        ls      = "screen"
        ll      = 20

        log.Log("Antes llamada FileDsp" ,log.bline          )
        log.Log(log.lines               ,log.lines          )
        log.Log("Source FileName"       ,source_filename    )
        log.Log("Tipo Preproceso"       ,preprocess_type    )
        log.Log("Argumentos Preproceso" ,preprocess_args    )

        log.Log(log.lines               ,log.lines          )

        log.Log("Fichero de Reglas"     ,reglas             )



        ofdsp = FileDsp(source_filename, 
                        preprocess_type,
                        preprocess_args,
                        reglas)        


        syscode_dsp         = 0  
        sysstr_dsp          = ""

        #- La llamada a filetdsp solo se va a producir si se indica
        #  bandera

        #- Por tanto en caso de tiempo no hay que considerarlo
        
        syscall_dsp         = ""

        preprocess_time     = log.pmt_ind + "t"
        preprocess_trigger  = log.pmt_ind + "r"



        if   preprocess_type == preprocess_time:
            
            log.Log("Entra por Tiempo"  , log.bline         )    
            tipo_preproceso     = "Agenda Estatica"
            syscode_dsp         =  ofdsp.getResult() 

            str_syscode_dsp     = str (syscode_dsp)
            
            log.Log("Salida FileTDsp"           ,   log.lines       )
            log.Log(log.dlines                  ,   log.dlines      )
            log.Log(sysstr_dsp                  ,   log.bline       )
            log.Log(log.endlines                ,   log.endlines    )    
        

        elif preprocess_type == preprocess_trigger:

        
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

            log.Log(log.lines                   ,   log.lines)
            log.Log("Resultado DSP Correcto"    ,   str_syscode_dsp)

            log.Log("Tipo"                      ,   tipo_preproceso)

            log.Log(log.lines                   ,   log.lines)

            
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

            
            exit(syscode_dsp)
            #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
            #   E. FIN RECEPCION DEL ARCHIVO
            #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
    
        else:
            #-Al ser un error recuperamos con get_valor

            log.Log(log.ascline                 ,   log.ascline)
            sp_info = "Error llamada filedsp "
            log.Log(sp_info                     ,   str_resultado_dsp)
            log.Log("Tipo"                      ,   tipo_preproceso)
            log.Log(log.ascline                 ,   log.ascline)

            exit(resultado_dsp)
        #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
        #   A. FIN OBTENCION METADATOS
        #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

            
    else:
        sp_info = "Final Algoritmo.Argumentos no correctos." 

        log.__Log(sp_info , str(numero_argumentos))        

        exit(1)
    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
    #              F I N A L   P R O G R A M A
    #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

#- Formato excepciones 2.5 en adelante
except SyntaxError as e:

## Ajuste excepciones 2.4
##    except SyntaxError:
##    ht, e = sys.exc_info()[:2]
    print "Error de sintaxis. Lineas no respetadas" \
            + e.message    + e.args

except ImportError as e:
    print "Error al importar " + e.message + e.args   

except ValueError as e:
    print "Error de tipo - parsear un numerico  " + \
            e.message    + str(e.args)


except AttributeError as e:
    print "Error al pasar un atributo " + e.message + str(e.args)

except IndentationError as e:
    print "Error al tabular el codigo" + e.message + str(e.args)   

except IndexError as e:
    print "Error al acceder a una posicion que no existe en lista" \
        + e.message    + str(e.args)

        
except NameError:
    print "Error de tipo de datos. Acceder como string a una lista, por ejemplo"    

except TypeError:
    print "Error de tipo de datos"

## No se si existe en esta version de python
## except WindowsError as e:
##    print "Error al acceder a un fichero en windows" \
##        + e.message    + str(e.args)


except Exception:
    exc_type, exc_obj, exc_tb = sys.exc_info()
    fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
    print "Descubriendo excepciones"
    print(exc_type, fname, exc_tb.tb_lineno)

    LOG_SHOW=""
