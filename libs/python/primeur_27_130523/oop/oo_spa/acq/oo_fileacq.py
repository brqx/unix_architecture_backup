#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas      : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- FileAcq       - Clase de spazio para recepcion - Fileacq 
-----------------------------------------------------------
-+ Clases heredadas     : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- SpazioAcq     - Clase de Spazio para Acq
-----------------------------------------------------------
- RulesAcq      - Clase de reglas para Acq
-----------------------------------------------------------
- Sys           - Clase de comandos de ejecuccion
-----------------------------------------------------------
-+ Clases utilizadas    : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- Parse         - Clase de parseo
-----------------------------------------------------------
-+ Metodos definidos    : 
-----------------------------------------------------------
- Pendiente  (init, gets y sets)
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- Ninguna
===========================================================
+ Process Status  : [130517]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [_] [4] [5]
===========================================================
"""

#- Importacion de librerias del sistema

import os

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
    
    __cls               = "FileAcq"
    __mth               = ""    
    __log_level         = 0
    __log_class_level   = 0
    __log_show          = "screen"

    
    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                           , 
                 qmname                         , 
                 queue                          , 
                 numint                         , 
                 destination_filename           , 
                 source_filename                , 
                 correl_id                      ,
                 sender                         ,
                 ruta_temporal                  ,
                 rules_file         = ""        ,
                 log_level          = 0         ,
                 log_class_level    = 0         ,
                 log_show           = "screen"  ):
        """ Constructor Filetacq
        """
        mth = "init"
        
        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level

       
        SpazioAcq.__init__(self         ,
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
            log_show                    )


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

        RulesAcq.__init__(self                  , 
                          correl_id_tuple       , 
                          rules_file            ,
                          rules_comment         ,
                          log_level             ,
                          log_class_level       ,
                          log_show              )

        command         =       ""


        Sys.__init__(self               ,
                     command            ,
                     log_level          ,
                     log_class_level    ,
                     log_show           )


  
        if log_level >log_class_level:
            self.sInfoConstructor(self.__cls)
            self.__Log(self.msg)

        self.LogEndConstructor()


                    
    def __Log(self                          ,
              texto                         ,
              valor         =   ""          ,
              mth           =   "init"      ,
              dec           =   "normal"    ):
        """ Log de la clase
        """        
        if mth == "":
            mth = self.__mth

        cls = self.__cls

        log_level       = self.__log_level
        log_class_level = self.__log_class_level

           
        self.log(texto      , 
                 valor      ,
                 cls                ,
                 mth                ,        
                 dec                ,
                 log_level          ,
                 log_class_level    )        


    def processAcqWithRules(self):
        """ Procesa la recepcion del archivo
        """        

        print "RUUUUUUL - antes de rulesssssss"        

        correl_id_tuple = self.getCorrelIdTuple()
        rules_file      = self.getRulesFileName()


        
    
        self.sffAcqInit(
                          correl_id_tuple       , 
                          rules_file        
                          )

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

        self.__Log("Directorio"                 ,
                    directorio                  ,
                    mth                         ,
                    "simple_alt"                )


        self.__Log("Fichero a evaluar"          ,
                    fichero_a_evaluar           ,
                    mth                         ,
                    "double_alt"                )

        self.setDirectory(directorio)
        #-Aqui habria que invocar las reglas

        #- Puede ser una variable de etiquetas
        destname    =   ""  
        sourcename  =   ""
        correl_id   =   self.getCorrelId()
        sender      =   self.getSender()
        description =   self.getDescription()


        self.__Log("Correl Id"       ,
                    correl_id        ,
                    mth                         ,
                    "simple_simple"             )

        self.__Log("Sender"       ,
                    sender        ,
                    mth                         ,
                    "simple_simple"             )

        self.__Log("Description"       ,
                    description        ,
                    mth                         ,
                    "simple_simple"             )


        #-Falta gestionar los los en parse
        #-------------------------------------++++++
        log_level       = self.__log_level
        log_class_level = self.__log_class_level
        log_show        = "screen"

        compress    = ""
        trigger     = ""

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
                 log_show                   )


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
                self.__Log("Permisos correctos en directorio"                   ,
                           directorio                                           ,
                           mth                                                  ,
                           "double_alt"                                         )
    
    
                #-- Generar cadena del sistema
                self.createRunStr()
                
                #-- Ejecuccion de la cadena
                self.runSys()
    
            else:
                
                self.__Log("Error de permisos en directorio. O bien no existe"  ,
                           directorio                                           ,
                           mth                                                  ,
                           "double_double"                                      )

                self.setSysCode(1)

        else:
            self.__Log("El directorio no se ha indicado en la ruta"  ,
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
                   sourcename                   , mth   )
        self.__Log("Destination Name"           ,   
                   destname                     , mth   )
        self.__Log("Correl Id"                  ,   
                   correl_id                    , mth   )
        self.__Log("Sender"                     ,   
                   sender                       , mth   )
        self.__Log("Description"                ,   
                   descripcion                  , mth   )

    
        #- Log Code
        #  print "oo_fileacq:runRules:sourcename="+ sourcename


        #- Trigger

        regla_trigger = self.getRulTrigger()
        print "TRIGGERRRRRR" + regla_trigger

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

        #-Falta gestionar los los en parse
        #-------------------------------------++++++
        log_level       = self.__log_level
        log_class_level = self.__log_class_level
        log_show        = "screen"


        if regla_destfilename !="":
            #- Puede ser una variable de etiquetas
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
                log_show                )

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
                   regla_extraccion                 , mth   )


        if regla_extraccion !="":
            self.setExtraccion(regla_extraccion)
       
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
                   self.bline                       ,   mth)


        qmname          = self.getQmName()
        queue           = self.getQueue()
        numint          = self.getNumInt()
        dest_filename   = self.getDestinationFileName()
        directory       = self.getDirectory()

        self.__Log("Generando directorio"           ,
                   directory                        ,   mth)

        extraccion      = self.getExtraccion()
        sobrescritura   = self.getSobrescritura()

        usuario         = self.getUser()
        passwd          = self.getPasswd()

        if usuario  != "":
            c_usuario   = "-u " + usuario 

        if passwd   != "":
            c_passwd    = "-p " + passwd


        #-- Falta encontrar por que extraccion llega vacio

        self.__Log(self.lines                 , 
                   self.lines                 , mth    )
        self.__Log("Resultado Acq"            , 
                   self.bline                 , mth    )   
        self.__Log(self.dlines                , 
                   self.dlines                , mth    )
        self.__Log("FileName"                 , 
                   self.getRulesFileName()    , mth    )     
        self.__Log("Sobrescritura"            , 
                   self.getSobrescritura()    , mth    )
##        self.__Log("Caracteres"               , self.getCaracteres()        )
        self.__Log("Extraccion"               , 
                   self.getExtraccion()       , mth    )
        self.__Log("Post Proceso"             , 
                   self.getPostProcess()      , mth    )
        self.__Log("Post Args"                , 
                   self.getPostProcessArgs()  , mth    )   
        self.__Log("Compression"              , 
                   self.getCompress()         , mth    )
        self.__Log("Trigger"                  , 
                   self.getTrigger()          , mth    )
        self.__Log("Source FileName"          , 
                   self.getSourceFileName()   , mth    )
        self.__Log("Destination FileName"     , 
                 self.getDestinationFileName(), mth    )
        self.__Log(self.lines                 , 
                   self.lines                 , mth    )


        self.__Log("Generando cadena"           ,
                   str(extraccion)              , mth    )

        #-Esto lo he puesto porque no se de donde sale el 20

        self.__Log(self.ascline                 , 
                   self.lines                   , mth    )
        self.__Log(extraccion                   ,
                   self.bline                   , mth    )
        self.__Log(self.ascline                 , 
                   self.lines                   , mth    )

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


        self.__Log(self.ascline                 , 
                   self.bline                   , mth    )        
        self.__Log("Creada la cadena acq"       , 
                   cadena_fileacq               , mth    )        
        self.__Log(self.ascline                 , 
                   self.bline                   , mth    )        
        
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

