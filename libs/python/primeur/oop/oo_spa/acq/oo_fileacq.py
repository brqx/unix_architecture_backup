#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.4
@pythonver: 3.3
-----------------------------------------------------------
+ Clases definidas              : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- FileAcq       - Clase de spazio para recepcion - Fileacq 
-----------------------------------------------------------
-+ Clases heredadas             : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- SpazioAcq     - Clase de Spazio para Acq
-----------------------------------------------------------
- RulesAcq      - Clase de reglas para Acq
-----------------------------------------------------------
- Sys           - Clase de comandos de ejecuccion
-----------------------------------------------------------
-+ Clases utilizadas            : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- Parse         - Clase de parseo
-----------------------------------------------------------
-+ Metodos definidos            : 
-----------------------------------------------------------
- processAcqWithoutRules    - Procesa Acq sin fichero de reglas
-----------------------------------------------------------
- processAcqWithRules       - Procesa Acq con fichero de reglas
-----------------------------------------------------------
- processAcq                - Procesa Acq 
-----------------------------------------------------------
- runRules                  - Ejecuta las reglas
-----------------------------------------------------------
- createRunStr              - Genera cadena del comando
-----------------------------------------------------------
+ Librerias Primeur requeridas  :
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas  :
-----------------------------------------------------------
- Ninguna
===========================================================
+ Process Status  : [130604]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [3] [4] [_]
===========================================================
"""

#- Importacion de librerias del sistema

import os
import platform
import ctypes
import datetime

#- Importacion de clases heredadas
from oo_sys         import Sys
from oo_rules_acq   import RulesAcq
from oo_spacq       import SpazioAcq


#- Importacion de clases utilizadas

from oo_parse       import Parse

from oo_file        import File


class FileAcq(SpazioAcq                     , 
              RulesAcq                      , 
              Sys                           ):
    
    __cls                           = "FileAcq"
    __mth                           = ""    
    __log_level                     = 0
    __log_class_level               = 0

    __log_show                      = "screen"
    __log_file                      = ""    # Log file por defecto
    __log_file_alt                  = ""    # Log file alterno
    __log_file_err                  = ""    # Log file de error

    
    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                   , 
                 qmname                 =   ""          , 
                 queue                  =   ""          , 
                 numint                 =   ""          , 
                 destination_filename   =   ""          , 
                 source_filename        =   ""          , 
                 correl_id              =   ""          ,
                 sender                 =   ""          ,
                 ruta_temporal          =   ""          ,
                 rules_file             =   ""          ,
                 log_level              =   0           ,
                 log_class_level        =   0           ,
                 log_show               =   "screen"    ,
                 log_file               =   ""          ,
                 log_file_err           =   ""          ,
                 log_size               =   1000000     ):
        """ Constructor Filetacq
        """
        mth = "init"
        
        #- Establecimiento nivel de log
        self.__log_level = log_level

        self.LogInitConstructor(log_level           , 
                                log_class_level     , 
                                log_show            )

        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level

        #-Estableciendo fichero de log
        self.__log_show     =   log_show

        self.__log_file     =   log_file
        self.__log_file_err =   log_file_err  

       
        SpazioAcq.__init__( self                        ,
                            qmname                      , 
                            queue                       , 
                            numint                      , 
                            destination_filename        , 
                            source_filename             , 
                            correl_id                   ,
                            sender                      ,
                            ruta_temporal               ,
                            rules_file                  ,
                            log_level                   ,
                            log_class_level             ,
                            log_show                    ,
                            log_file                    ,
                            log_file_err                ,
                            log_size                    )


        # Aqui no se ha construido
        correl_id_tuple = correl_id + "." + sender        
                

        self.__Log("Fichero reglas"                 ,   
                   rules_file                       ,
                   mth                              ,
                   "simple_simple"                  )

        self.__Log("Tupla Correl_id"                ,   
                   correl_id_tuple                  ,
                   mth                              ,
                   "simple_simple"                  )

        self.setCorrelIdTuple(correl_id_tuple)
        self.setRulesFileName(rules_file)

        #- Puede ser que no exista fichero o  permisos
        #  Ahora vemos como actuar

        rules_comment   = "#"

        RulesAcq.__init__(  self                    , 
                            correl_id_tuple         , 
                            rules_file              ,
                            rules_comment           ,
                            log_level               ,
                            log_class_level         ,
                            log_show                ,
                            log_file                ,
                            log_file_err            ,
                            log_size                )

        command         =       ""


        Sys.__init__(       self                    ,
                            command                 ,
                            log_level               ,
                            log_class_level         ,
                            log_show                ,
                            log_file                ,
                            log_file_err            ,
                            log_size                )


  
        if log_level >log_class_level:
            self.sInfoConstructor(self.__cls)

            if log_level > 80:
                self.__Log(self.msg         ,
                           self.bline       ,
                           mth              ,
                           "simple_simple"  )

        self.LogEndConstructor()


                    
    #-Clase de log alternada
    def __LogAlt(self                           ,
              texto         =   ""              ,
              valor         =   ""              ,
              mth           =   "init"          ,
              dec           =   "normal"        ):
        """ Log de la clase
        """        
        if mth == "":
            mth = self.__mth

        cls = self.__cls

        log_level       = self.__log_level
        log_class_level = self.__log_class_level
        log_show        = self.__log_show
        log_file_alt    = self.__log_file_alt

           
        self.log(texto              , 
                 valor              ,
                 cls                ,
                 mth                ,        
                 dec                ,
                 log_level          ,
                 log_class_level    ,
                 log_show           ,
                 log_file_alt       )        


    #-Clase de log de traza
    def __Log(self                          ,
              texto                         ,
              valor         =   ""          ,
              mth           =   "init"      ,
              dec           =   "normal"    ):
        """ Log de la clase para traza
        """        

        self.__log_file_alt  = self.__log_file

        self.__LogAlt(texto                 ,
                      valor                 ,
                      mth                   ,
                      dec                   )

    #-Clase de log de error
    def __ErrLog(self                           ,
              texto                             ,
              valor         =   ""              ,
              mth           =   "init"          ,
              dec           =   "normal"        ):
        """ Log de la clase para error
        """        
        self.__log_file_alt  = self.__log_file_err

        self.__LogAlt(texto                 ,
                      valor                 ,
                      mth                   ,
                      dec                   )


    def processAcqWithRules(self):
        """ Procesa la recepcion del archivo
        """        

        correl_id_tuple = self.getCorrelIdTuple()
        rules_file      = self.getRulesFileName()

    
        self.sffAcqInit(  correl_id_tuple       , 
                          rules_file            )

        self.runRules()



    def processAcqWithoutRules(self):
        """ Procesa la recepcion del archivo
            Sin fichero de reglas
        """        
        mth = "processAcqWithoutRules"

        destination_filename = self.getDestinationFileName()

        self.__Log("Destination FileName"       ,
                    destination_filename        ,
                    mth                         ,
                    "simple_simple"             )

        directorio          = os.path.dirname(destination_filename)
        fichero_a_evaluar   = os.path.basename(destination_filename)


        self.setDirectory(directorio)
        #-Aqui habria que invocar las reglas

        #- Puede ser una variable de etiquetas
        destname                =   ""  
        sourcename_full_path    =   self.getSourceFileName()
        correl_id               =   self.getCorrelId()
        sender                  =   self.getSender()
        description             =   self.getDescription()


##        sourcename_path         = os.path.dirname(sourcename_full_path)
        sourcename              = sourcename_full_path
#        sourcename              = os.path.basename(sourcename_full_path)

        self.__Log("Entrada en parseo"          ,
                   "-"                          ,
                    mth                         ,
                    "double_alt"                )


        self.__Log("Source FileName"            ,
                    sourcename                  ,
                    mth                         ,
                    "simple_simple"             )

        self.__Log("Directorio"                 ,
                    directorio                  ,
                    mth                         ,
                    "simple_alt"                )


        self.__Log("Fichero a evaluar"          ,
                    fichero_a_evaluar           ,
                    mth                         ,
                    "double_alt"                )

        self.__Log("Correl Id"                  ,
                    correl_id                   ,
                    mth                         ,
                    "simple_simple"             )

        self.__Log("Sender"                     ,
                    sender                      ,
                    mth                         ,
                    "simple_simple"             )

        self.__Log("Description"                ,
                    description                 ,
                    mth                         ,
                    "simple_simple"             )


        #-Falta gestionar los los en parse
        #-------------------------------------++++++
        log_level       = self.__log_level
        log_class_level = self.__log_class_level
        log_show        = self.__log_show
        log_file        = self.__log_file
        log_file_err    = self.__log_file_err
        log_size        = self.get_log_size()

        compress        = ""
        trigger         = ""

        oparse = Parse(
                 fichero_a_evaluar          ,
                 sourcename                 ,
                 destname                   ,
                 correl_id                  ,
                 sender                     ,
                 description                ,
                 compress                   ,
                 trigger                    ,
                 log_level                  ,
                 log_class_level            ,
                 log_show                   ,
                 log_file                   ,
                 log_file_err               ,
                 log_size                   )


##        oparse.runParse()

        regla_destfilename_parseada= oparse.getResultado()

        self.setDestinationFileName(regla_destfilename_parseada)


        self.__Log("Destination FileName Parseado"  ,
                    regla_destfilename_parseada     ,
                    mth                             ,
                    "square_alt"                    )


    def processAcq(self):
        """ Procesa la recepcion del archivo
        """        
        mth = "processAcq"

        #-Sabemos si hay configuracion de reglas
        open_file_code = self.getOpenFileCode()        
        str_open_file_code = str(open_file_code)
        
        self.__Log("Codigo Fichero Reglas"      ,
                  str_open_file_code            ,
                  mth                           ,
                  "square_alt"                  )
        
        if open_file_code == 0:
            #-Hay fichero de reglas
            self.processAcqWithRules()
            self.setExistRulesFile(True)
        else:
            #-No hay fichero de reglas
            self.processAcqWithoutRules()
            self.setExistRulesFile(False)

        #-Hay que comprobar si existe el directorio

        directorio = self.getDirectory()
        
             
        fdir = File(directorio)
      
        dir_code = fdir.getOpenFileCode()
        
        str_dir_code = str(dir_code)

        self.__Log("Codigo de acceso"                                       ,
                    str_dir_code                                            ,
                    mth                                                     ,
                   "simple_simple"                                          )

        if directorio != "":
            
            if dir_code == 0:
                #-Existe el directorio destino y hay permisos
                self.__Log("Directorio existente"                           ,
                           directorio                                       ,
                           mth                                              ,
                           "double_alt"                                     )
    
                #- En este punto hay que ver si hay permisos

                #--  os.R_OK, os.W_OK, and os.X_OK.
                if os.access(directorio , os.W_OK ):

                    self.__Log("Permisos correctos en la ruta"                ,
                               directorio                                     ,
                               mth                                            ,
                               "double_alt"                                   )
    
                    free = 0
                    
                    if platform.system() == 'Windows':

                        self.__Log("Plataforma windows"                     ,
                                   self.bline                               ,
                                   mth                                      ,
                                   "simple_simple"                          )

                        free_bytes = ctypes.c_ulonglong(0)
                        ctypes.windll.kernel32.GetDiskFreeSpaceExW(
                            ctypes.c_wchar_p(directorio)                    , 
                            None                                            , 
                            None                                            , 
                            ctypes.pointer(free_bytes)                      )

                        free = free_bytes.value/1024/1024
                    else:    

                        self.__Log("Plataforma unix"                        ,
                                   self.bline                               ,
                                   mth                                      ,
                                   "simple_simple"                          )
    
                        #-Devuelve el espacio en disco en Mb
                        st = os.statvfs(directorio)
                        free = int (st.f_bavail * st.f_frsize /1024/1024 )
    ##                    free = psutil.disk_usage(directorio)
    
                    str_free    = str(free)
    
                    #-PErmitimos que se ejecute con mas de 1 Mb
                    if free > 1:
                        self.__Log("Espacio suficiente para grabar fichero"   ,
                                   str_free                                   ,
                                   mth                                        ,
                                   "double_alt"                               )
    
                        #-- Generar cadena del sistema
                        self.createRunStr()
        
                       
                        #-- Ejecuccion de la cadena
                        self.runSys()

                    else:
                        self.__ErrLog("No hay espacio en disco"               ,
                                   directorio                                 ,
                                   mth                                        ,
                                   "double_double"                            )

                        self.setSysCode(4)

                else:
                    self.__ErrLog("No hay permisos de escritura en la ruta"   ,
                               directorio                                     ,
                               mth                                            ,
                               "double_double"                                )

                    self.setSysCode(3)
    
            else:
                
                self.__ErrLog("Directorio no existe"                          ,
                           directorio                                         ,
                           mth                                                ,
                           "double_double"                                    )

                self.setSysCode(1)

        else:
            self.__ErrLog("El directorio no se ha indicado en la ruta"      ,
                       directorio                                           ,
                       mth                                                  ,
                       "double_double"                                      )

            self.setSysCode(2)
       
        

    def runRules(self):
        """ Procesa la recepcion del archivo
        """        
        mth = "runRules"
        self.LogInitMethod(self.__cls)


        sourcename      = self.getSourceFileName()
        destname        = self.getDestinationFileName()
        correl_id       = self.getCorrelId()
        sender          = self.getSender()
        descripcion     = self.getDescription()


        self.__Log("Ejecutando de reglas"       ,   
                   self.lines                   , 
                   mth                          ,
                   "double_alt"                 )

        self.__Log("Source Name"                ,   
                   sourcename                   , 
                   mth                          ,
                   "simple_simple"              )

        self.__Log("Destination Name"           ,   
                   destname                     , 
                   mth                          ,
                   "simple_simple"              )

        self.__Log("Correl Id"                  ,   
                   correl_id                    , 
                   mth                          ,
                   "simple_simple"              )

        self.__Log("Sender"                     ,   
                   sender                       , 
                   mth                          ,
                   "simple_simple"              )

        self.__Log("Description"                ,   
                   descripcion                  , 
                   mth                          ,
                   "simple_simple"              )

    
        #- Log Code
        #  print "oo_fileacq:runRules:sourcename="+ sourcename


        #- Trigger

        regla_trigger = self.getRulTrigger()

        if regla_trigger !="":
            self.setTrigger(regla_trigger)

        #- Compresion

        regla_compress = self.getRulCompress()
   
        if regla_compress !="":
            self.setCompress(regla_compress)
    
       
        #- Regla Destfilename
        regla_destfilename = \
            self.runRuleDestinationFileName()

        self.__Log("Aplicando regla DestFileName"   ,
                  regla_destfilename                , 
                  mth                               ,
                  "simple_simple"                   )

        #-------------------------------------++++++
        log_level       = self.__log_level
        log_class_level = self.__log_class_level
        log_show        = self.__log_show
        log_file        = self.__log_file
        log_file_err    = self.__log_file_err
        log_size        = self.get_log_size()


        if regla_destfilename !="":
            #- Puede ser una variable de etiquetas


            self.__Log( "Regla a parsear"           ,
                        regla_destfilename          , 
                        mth                         ,
                        "simple_simple"             )

            oparse = Parse(
                regla_destfilename      ,
                sourcename              ,
                destname                ,
                correl_id               ,
                sender                  ,
                descripcion             ,    
                regla_compress          ,
                regla_trigger           ,
                log_level               ,
                log_class_level         ,
                log_show                ,
                log_file                ,
                log_file_err            ,
                log_size                )

##            oparse.runParse()

            regla_destfilename_parseada= oparse.getResultado()

            self.setDestinationFileName(regla_destfilename_parseada)
                
            self.__Log("DestFileName aplicada la regla"     ,
                  regla_destfilename_parseada               , 
                  mth                                       ,
                  "simple_simple"                           )

 
        #- Regla Directory
        regla_directory = \
            self.runRuleDirectory()

        if regla_directory !="":
            self.setDirectory(regla_directory)

        #- Regla Sobrescritura
        regla_sobrescritura = \
            self.runRuleSobrescritura()

        if regla_sobrescritura !="":
            self.setSobrescritura(regla_sobrescritura)

        #- Regla Caracteres - Mayus / Minus
        regla_caracteres = \
            self.runRuleCaracteres(self.getDestinationFileName())

        if regla_caracteres !="":
            self.setDestinationFileName(regla_caracteres)

        #- Regla Extraccion - -mIn
        regla_extraccion = \
            self.runRuleExtraccion()

        self.__Log("Antes de regla extraccion"      ,
                   regla_extraccion                 , 
                   mth                              )

        if regla_extraccion !="":
            self.setExtraccion(regla_extraccion)
            
        #- Gestion de duplicados
        #- 130606 - Llega copydup a regla_dup

        regla_dup = \
            self.runRuleCopyDup()


        self.setCopyDup(regla_dup)


        #-La comprobacion esta tiene sentido si no hay compresion

        #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
        # N O    H A Y    C O M P R E S I O N
        #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

        if regla_compress =="":
        #- En este nivel solo podemos aplicar el timestamp si no hay 
        #  compresion

            if regla_dup!="":
                #- Indica que hay que verificar los duplicados
                #- Si la ruta existe hay que crear un timestamp
    
    
                self.__Log("Regla Duplicados activada"                 ,
                           regla_dup                                   , 
                           mth                                         ,
                           "simple_simple"                             )
    
    
                destination_filename    = self.getDestinationFileName()
                directory               = self.getDirectory()
                slash                   = self.slash            
                
                full_df = directory + slash + destination_filename            
                
                file_df = File(full_df)
    
                open_file_code = file_df.getOpenFileCode()
                str_open_file_code = str(open_file_code)
    
    
                self.__Log("Codigo retorno del fichero"         ,
                           str_open_file_code                   , 
                           mth                                  ,
                           "simple_simple"                      )
   
        
                if open_file_code == 0:
                    #- El fichero existe
                    self.__Log("Fichero existe"                 ,
                               full_df                          , 
                               mth                              ,
                               "double_alt"                     )
    
    
                    fecha_actual = datetime.datetime.now()        
                    timestamp = fecha_actual.strftime('%Y%m%d%H%M%S')
    
                    df_timestamp = destination_filename + timestamp
    
                    self.setDestinationFileName(df_timestamp)


                    self.__Log("Establecemos directorio destino Copydup"    ,
                               full_df                                      , 
                               mth                                          ,
                               "double_alt"                                 )

                    #- No se comprueba si existe el directorio        
                    # Si el directorio que se indica en COPYDUP no existe el 
                    # postproceso de extracción debe:
                    # Reportar un error de ejecución, esto generará una alarma 
                    # que hará que operaciones se ocupe de esta incidencia y 
                    # la resuelva.
                    # Extraer el fichero recibido de la cola a un directorio 
                    # temporal $SPAZIO/temp y borrarlo después de la extracción, 
                    # de otra manera generaría una alarma de fichero no extraído.    

   
                    directory_dup = File(regla_dup)
        
                    dup_open_file_code      = directory_dup.getOpenFileCode()
                    str_dup_open_file_code  = str(dup_open_file_code)
    
                    if dup_open_file_code == 0:
                        #- El fichero existe
                        self.__Log("Ruta duplicados existe"             ,
                                   regla_dup                            , 
                                   mth                                  ,
                                   "double_alt"                         )

                        #-Debe establecerse el directorio si no hay compresion
                        self.setDirectory(regla_dup)

                        print("acq - Ruta duplicados existe")                                   

                    else:
                        
                        self.__ErrLog("Ruta duplicados no existe"       ,
                                      regla_dup                         , 
                                      mth                               ,
                                      "double_double"                   )

                        print("acq - Ruta duplicados no existe")   
                        #- Hay que borrar el fichero una vez se extraiga
                        
                        self.setDeleteFile()
                                    
    
        else:    
        #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
        #  H A Y    C O M P R E S I O N
        #--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

            if regla_dup!="":
                #- Indica que hay que verificar los duplicados
                #- Si la ruta existe hay que crear un timestamp

                self.__Log("Regla Duplicados activada con compresion"  ,
                           regla_dup                                   , 
                           mth                                         ,
                           "simple_simple"                             )

                #- En este punto sabemos que hay compresion y duplicados
                #  pero no sabemos el fichero destino ni si existe el 
                #  mismo. Hay que preparar otra estructura
    
        #- Post Proceso

        regla_post_process = self.getRulPostProcess()
   
        if regla_post_process !="":
            self.setPostProcess(regla_post_process)

        regla_post_process_args = self.getRulPostProcessArgs()
            
        if regla_post_process_args !="":
            self.setPostProcessArgs(regla_post_process_args)


        self.LogEndMethod(self.__cls)
        

    def createRunStr(self):
        """ Genera la cadena para llamar al sistema
        """        
        mth = "createRunStr"
        self.LogInitMethod(self.__cls)


        self.__Log("Entrando en RunStr"             ,
                   self.bline                       ,   
                   mth                              ,
                   "simple_simple"                  )


        qmname          = self.getQmName()
        queue           = self.getQueue()
        numint          = self.getNumInt()
        dest_filename   = self.getDestinationFileName()
        directory       = self.getDirectory()

        # Si existe copydup se debe extraer a la ruta indicada

        copydup         = self.getCopyDup()
        

        self.__Log("Generando directorio"           ,
                   directory                        ,   
                   mth                              ,
                   "double_simple"                  )

        extraccion      = self.getExtraccion()
        sobrescritura   = self.getSobrescritura()

        usuario         = self.getUser()
        passwd          = self.getPasswd()

        if usuario  != "":
            c_usuario   = "-u " + usuario 

        if passwd   != "":
            c_passwd    = "-p " + passwd


        #-- Falta encontrar por que extraccion llega vacio

        self.__Log("Resultado Acq"                      , 
                   self.bline                           , 
                   mth                                  ,
                   "double_alt"                         )   

        self.__Log("FileName"                           , 
                   self.getRulesFileName()              , 
                    mth                                 ,
                    "simple_simple"                     )     

        self.__Log("Sobrescritura"                      , 
                   self.getSobrescritura()              , 
                    mth                                 ,
                    "simple_simple"                     )

##        self.__Log("Caracteres"               , self.getCaracteres()        )

        self.__Log("Extraccion"                         , 
                   self.getExtraccion()                 , 
                    mth                                 ,
                    "simple_simple"                     )    

        self.__Log("Post Proceso"                       , 
                   self.getPostProcess()                , 
                    mth                                 ,
                    "simple_simple"                     )

        self.__Log("Post Args"                          , 
                   self.getPostProcessArgs()            ,     
                    mth                                 ,
                    "simple_simple"                     )

        self.__Log("Compression"                        , 
                   self.getCompress()                   , 
                   mth                                  ,
                   "simple_simple"                      )

        self.__Log("Trigger"                            , 
                   self.getTrigger()                    , 
                   mth                                  ,
                   "simple_simple"                      )

        self.__Log("Source FileName"                    , 
                   self.getSourceFileName()             , 
                   mth                                  ,
                   "simple_simple"                      )

        self.__Log("Destination FileName"               , 
                   self.getDestinationFileName()        , 
                   mth                                  ,
                   "simple_alt"                         )


        self.__Log("Extraccion"                         ,
                   extraccion                           , 
                   mth                                  ,
                   "simple_simple"                      )


##        self.sep = " "


        if extraccion == 20:
            extraccion = ""
        #-Hay que gestionar el separador

        cadena_fileacq = "filetacq"     + self.sep + qmname 
        cadena_fileacq = cadena_fileacq + self.sep + queue 
##        cadena_fileacq = cadena_fileacq + self.sep + c_usuario
##        cadena_fileacq = cadena_fileacq + self.sep + c_passwd
        cadena_fileacq = cadena_fileacq + self.sep + \
                         self.pmt_ind + "i" + numint 
        cadena_fileacq = cadena_fileacq + self.sep + \
                         self.pmt_ind + "f" + dest_filename
        cadena_fileacq = cadena_fileacq + self.sep + \
                         self.pmt_ind + "d" + directory
        cadena_fileacq = cadena_fileacq + self.sep + \
                         self.pmt_ind + "oSES"
        cadena_fileacq = cadena_fileacq + self.sep + \
                         self.pmt_ind + "v"
        cadena_fileacq = cadena_fileacq + self.sep + extraccion
        cadena_fileacq = cadena_fileacq + self.sep + sobrescritura        


        self.__Log("Creada la cadena acq"       , 
                   cadena_fileacq               , 
                   mth                          ,
                   "double_alt"                 )        

        #- 130606 - La cadena ACQ se genera bien
        
        self.runstr = cadena_fileacq

        self.LogEndMethod(self.__cls)
    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

## qm = "QM"
## q = "QM"
## n = "QM"
## ci = "CORRELID"
## se = "SENDER"
## df = "dest.dat"
## rt = "/tmp"
## ls = "screen"
## ll = int(sys.argv[1])


## ae = FileAcq(qm, q, n , df , ci , se, rt, ls, re, ll)

## print ae.getRunStr()

## print ae.getSysOutStr()

### ej = Rules(tupla_correlid, fichero_reglas)

### print ej.getDestinationFileName()
### print ej.getDirectorio()

