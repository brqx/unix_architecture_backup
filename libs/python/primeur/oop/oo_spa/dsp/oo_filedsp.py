#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.4
@pythonver: 3.3
-----------------------------------------------------------
+ Clases definidas   : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- FileDsp   : Clase spazio del proceso de envio - Dsp
-----------------------------------------------------------
+- Clases heredadas  :
--=----=----=----=----=----=----=----=----=----=----=----=-
- SpazioDsp : Clase generica de Spazio enfocada en Dsp
-----------------------------------------------------------
- RulesDsp  : Clase de reglas de Spazio orientada al envio
-----------------------------------------------------------
- Sys       : Clase de ejecucion de comandos
-----------------------------------------------------------
+- Clases utilizadas :
--=----=----=----=----=----=----=----=----=----=----=----=-
- File      : Clase utilizada para gestionar ficheros
-----------------------------------------------------------
-+ Metodos definidos            : 
-----------------------------------------------------------
- processDspTime            - Pre proceso por tiempo
-----------------------------------------------------------
- processDspTrg             - Pre proceso por bandera
-----------------------------------------------------------
- runRulesDsp               - Ejecuta Reglas Pre Proceso
-----------------------------------------------------------
- runRuleDspDestinationFileName - Lanza regla DF
-----------------------------------------------------------
- runRuleDspSourceFileName      - Lanza regla SF
-----------------------------------------------------------
- createRunStr                  - Genera cadena del comando
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- Ninguna
===========================================================
+ Process Statuss : [130524]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [_] [4] [5]
===========================================================
"""

#- Importacion de librerias del sistema

##import sys

#- Importacion de clases heredadas
from oo_sys import Sys

from oo_rules_dsp import RulesDsp

from oo_spdsp import SpazioDsp

#- Importacion de clases utilizadas

from oo_file import File

from oo_rules_sff_est   import RulesSffEst


class FileDsp(SpazioDsp, RulesDsp, Sys):
    
    #-Variable estatica para indicar el nombre de la clase
    __cls           = "FileDsp"
    __mth           = ""    
    __log_level             = 0
    __log_class_level       = 0

    __log_show              = "screen"
    __log_file              = ""    # Log file por defecto
    __log_file_alt          = ""    # Log file alterno

    
    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                   , 
                 source_filename        = ""            , 
                 preprocess_type        = ""            ,
                 preprocess_args        = ""            ,
                 rules_file             = ""            ,
                 log_level              = 0             ,
                 log_class_level        = 0             ,
                 log_show               = "screen"      ,
                 log_file               = ""            ,
                 log_file_err           =   ""          ,
                 log_size               =   1000000     ):
        """ filetdsp QueueManager SourceFile[QueueName|DQLName d DQL] 
            u UserId p ConnPsw c CorrelationId s Sender 
            n UserClass xDescription’(Description)’ o Data 
            [o ZCOmp  o BYRec] xBackupDir’(DirBackup)’
        
            QueueManager, QueueName 
            CorrelationId, Sender, UserClass, Description, 
            Standard, Compressor, DirBackup        
            UserId, ConnPsw

            filedsp QMCORNER EVENTO /home/spazio/spazio/spazio.ini  
            cCORRELID sEMISOR xDescription'(DESCRIPCION)' 
            f/home/spazio/spazio/temp/Destfilename.dat oSES 
            v u sospadm p sospadm
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
        self.__log_file     =   log_file

    

        self.__Log("Fichero Fuente"                 ,   
                   source_filename                  , 
                   mth                              ,   
                   "simple_simple"                  )

        self.__Log("Tipo Preproceso"                ,   
                   preprocess_type                  ,
                   mth                              ,
                   "simple_simple"                  )

        self.__Log("Argumentos Tipo Preproceso"     ,   
                   preprocess_args                  ,
                   mth                              ,
                   "simple_simple"                  )

        self.__Log("Fichero Reglas"                 ,   
                   rules_file                       ,
                   mth                              ,   
                   "simple_alt"                     )
       



        config_comment  = ";"
        rules_comment   = "#"
    
    
        #-Leemos la configuracion
        rulsff = RulesSffEst(rules_file         ,
                             config_comment     ,
                             log_level          ,
                             log_class_level    ,
                             log_show           ,
                             log_file           )    


##        self.cfg = rulsff.cfg
        self.cfg_path = rulsff.cfg_path
        self.tmp_path = rulsff.tmp_path
        self.log_path = rulsff.log_path
        self.pmt_ind    = rulsff.pmt_ind

        self.__Log("Ruta configuracion"                         , 
                self.cfg_path                                   ,
                "simple_simple"                                 )                    

        self.__Log("Ruta temporal"                              , 
                self.tmp_path                                   ,
                "simple_simple"                                 )                    

        self.__Log("Ruta logs"                                  , 
                self.log_path                                   ,
                "simple_simple"                                 )                   

        self.__Log("Indicador parametros"                       , 
                self.pmt_ind                                    ,
                "simple_simple"                                 )                   



        preprocess_time     = self.pmt_ind + "t"
        preprocess_trigger  = self.pmt_ind + "r"


        if preprocess_type == preprocess_trigger:
            self.__Log("Entrada por Trigger", self.bline)

            RulesDsp.__init__(self              , 
                              preprocess_args   ,
                              rules_file        ,
                              log_level         ,
                              log_class_level   ,
                              log_show          ,
                              log_file          ,
                              log_file_err      ,
                              log_size          )

        #-La idea es cargar la clase spazio con los valores del 
        # fichero de reglas

            self.setSourceFileName         (source_filename                  )

            self.runRuleDspDestinationFileName()
            self.runRuleDspSourceFileName()


            destination_filename    = self.getDestinationFileName()


        #- En este caso el CorrelId coincide con la tupla de busqueda
            self.setCorrelIdTuple       (preprocess_args                  )
            self.setCorrelId            (preprocess_args                  )

    
            qmname                  =   self.getRulQueueManager()
            queue                   =   self.getRulQueue()
            sender                  =   self.getRulSender()
            user_class              =   self.getRulUserClass()
            description             =   self.getRulDescription()
            standard                =   self.getRulStandard()
            compressor              =   self.getRulCompressor()
            backup_dir              =   self.getRulBackupDir()
            user                    =   self.getRulUser()
            passwd                  =   self.getRulPasswd()

            SpazioDsp.__init__(  self                       ,
                                 qmname                     ,
                                 queue                      ,
                                 destination_filename       , 
                                 source_filename            , 
                                 sender                     ,
                                 user_class                 ,
                                 description                ,
                                 standard                   ,
                                 compressor                 ,
                                 backup_dir                 ,
                                 user                       ,
                                 passwd                     ,
                                 log_level                  ,
                                 log_class_level            ,
                                 log_show                   ,
                                 log_file                   ,
                                 log_file_err               ,
                                 log_size                   )

            command                 =       ""

            Sys.__init__(self                               ,
                         command                            ,
                         log_level                          ,
                         log_class_level                    ,
                         log_show                           ,
                         log_file                           ,
                         log_file_err                       ,
                         log_size                           )



            self.processDspTrg()


        elif preprocess_type == preprocess_time:

            self.__Log("Entrada por Time" ,   self.bline          )
            self.__Log("Time (seg)"       ,   preprocess_args     )


            #- Paso de segundos a minutos
            #- Int trunca entonces si es menos de un minuto da cero
            preprocess_min = str ( int(preprocess_args) / 60    )

            self.__Log("Time (min)"       ,   preprocess_min      )

            self.setSourceFileName      (source_filename                )
            self.setModificationTime    (preprocess_min                )

            self.processDspTime()

            
        if log_level > log_class_level:
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

    def processDsp(self):
        """ Pre Proceso - Funcion independiente
            De momento no hace nada
        """        



    def processDspTime(self):
        """ Pre Proceso por tiempo
        """        
        mth ="processDspTime"
        self.LogInitMethod(self.__cls)

        oo = File()
        fichero = self.getSourceFileName()        
        tiempo  = self.getModificationTime()
        
        self.__Log("Fichero Fuente"             ,   
                   fichero                      , mth)
        self.__Log("Tiempo modificacion"        ,   
                   tiempo                       , mth)
       
        resultado = oo.checkTimeFile(fichero,tiempo)

        self.setResult(resultado)
        
        self.setResultStr(resultado)

        self.LogEndMethod(self.__cls)


    def processDspTrg(self):
        """ Pre Proceso por bandera
        """        
        mth ="processDspTrg"

        self.__Log("Preproceso por bandera"     ,   
                   self.bline                   , 
                   mth                          ,
                   "simple_simple"              )        
        
        #- Fase 1
        #-Debe : 
        #-1. Hacer el dsp del fichero relacionado
        #-- Borrar la bandera
        #-2. Hacer un backup del fichero relacionado
        #~3. Devolver 1 para que la agenda estatica de fallo


        #- Fase 2
        #-Debe : 
        #-1. Hacer el dsp del fichero relacionado
        #-- Obtener fichero relacionado
        #-- Comprobar si existe dicho fichero
        #-2. Hacer un backup del fichero relacionado
        #~3. Devolver 1 para que la agenda estatica de fallo
      
        #-- Habria que indicar que se lanzan las reglas
        #-Como minimo debe generarse el fichero sin extension
        self.runRulesDsp()
        
        #-- Tendriamos que indicar que generamos lacadena
        self.createRunStr()
        
        #-- Tendriamos que indicar que ejecutamos lacadena
        self.runSys()


    def runRulesDsp(self):
        """ Procesa la recepcion del archivo
        """        
        mth = "runRulesDsp"
        self.LogInitMethod(self.__cls)


        regla_destfilename      = ""
        destination_filename    = self.getDestinationFileName()
        sourcename_ext          = self.getSourceFileName()
        #- Hay que quitarle la extension        
        correl_id               = ""
        sender                  = self.getSender()
        descripcion             = self.getDescription()

##        oparse = Parse(
##            regla_destfilename,
##            sourcename_ext,
##            destination_filename,
##            correl_id,
##            sender,
##            descripcion
##        )

##        sourcename = oparse.getParseSourceFileNameNoExt()

        #-Establecemos tanto el fuente como el destino iguales por defecto
      
        self.setSourceFileNameNoExt      ()
        self.setDestinationFileNameNoExt ()



        self.LogEndMethod(self.__cls)
    
    
    def runRuleDspDestinationFileName(self):
        """ Regla destination filename 
            - se pone el nombre del fichero fuente
            - si se especifica algo en fichero de reglas se cambia
        """

        fichero_fuente  = self.getSourceFileName()
        fichero_en_regla= self.getRulDestinationFileName()

        if fichero_en_regla != "":
            self.setDestinationFileName(fichero_en_regla)
        else:
            #-Establecemos fichero sin extension solo si se lo pasamos
            self.setDestinationFileName(fichero_fuente)
            self.setDestinationFileNameNoExt()        

    def runRuleDspSourceFileName(self):
        """ Regla destination filename 
            - si se especifica algo en fichero de reglas se cambia
        """

        fichero_fuente  = self.getSourceFileName()
        fichero_en_regla= self.getRulSourceFileName()

        if fichero_en_regla != "":
            self.setSourceFileName(fichero_en_regla)
        else:
            #-Establecemos fichero sin extension solo si se lo pasamos
            self.setSourceFileName(fichero_fuente)
            self.setSourceFileNameNoExt()        


    def createRunStr(self):
        """ Genera la cadena para llamar al sistema
            En principio se le pasan banderas
        """        
        mth = "createRunStr"
        self.LogInitMethod(self.__cls)


        qmname                  = self.getQmName()
        queue                   = self.getQueue()
        dest_filename_no_ext    = self.getDestinationFileNameNoExt()
        source_filename_no_ext  = self.getSourceFileNameNoExt()

        #- Necesitamos parsear la cadena

        correl_id               = self.getCorrelId()

        userclass               = self.getUserClass()
        description             = self.getDescription()
        standard                = self.getStandard()
        compressor              = self.getCompressor()
        backupdir               = self.getBackupDir()


##        usuario = self.getUser()
##        passwd = self.getPasswd()

##        if usuario != "":
##            c_usuario = "-u " + usuario 

##        if passwd != "":
##            c_passwd = "-p " + passwd


        cadena_filedsp = "filedsp"      + self.sep + qmname 
        cadena_filedsp = cadena_filedsp + self.sep + queue 
##        cadena_fileacq = cadena_fileacq + self.sep + c_usuario
##        cadena_fileacq = cadena_fileacq + self.sep + c_passwd
        cadena_filedsp = cadena_filedsp + self.sep + source_filename_no_ext
        cadena_filedsp = cadena_filedsp + self.sep + \
                         self.pmt_ind + "c" + correl_id
        cadena_filedsp = cadena_filedsp + self.sep + \
                         self.pmt_ind + "xDescription'(" + \
                         description + ")'"
        cadena_filedsp = cadena_filedsp + self.sep + \
                         self.pmt_ind + "f" + dest_filename_no_ext
        cadena_filedsp = cadena_filedsp + self.sep + \
                         self.pmt_ind + "oSES"
        cadena_filedsp = cadena_filedsp + self.sep + \
                         self.pmt_ind + "v"


        self.__Log(self.ascline, self.bline)        
        self.__Log("Creada la cadena dsp", cadena_filedsp)        
        self.__Log(self.ascline, self.bline)        
        
        self.runstr = cadena_filedsp

        self.LogEndMethod(self.__cls)

    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

## log_level = 30
## log_class_level = 0
## log_show = "screen"
## log_file = ""


#-Debe hacer un dsp del comandos.log
## nombre_fichero = "comandos.log.trg"
## tipo_preproceso = "-t"
## param_preproceso = "20"
##  
## fichero_reglas = ""

## ae = FileDsp(nombre_fichero     , 
##              tipo_preproceso    ,
##              param_preproceso   ,
##              fichero_reglas     ,
##              log_level          ,
##              log_class_level    ,
##              log_show           ,
##              log_file)


## print ae.getRunStr()

## print "Destination FileName Reglas:" + ae.getRulDestinationFileName()
## print "Source FileName      Reglas:" + ae.getRulSourceFileName()
## print "Sender              " + ae.getRulSender()
## print "User Class          " + ae.getRulUserClass()
## print "Description         " + ae.getRulDescription()
## print "Standard            " + ae.getRulStandard()
## print "Compress            " + ae.getRulCompressor()
## print "Backup Dir          " + ae.getRulBackupDir()
## print "Usuario             " + ae.getRulUser()
## print "Clave               " + ae.getRulPasswd()

## print "----------------------------------"
## print "Destination        " + ae.getDestinationFileName()
## print "Source             " + ae.getSourceFileName()
## print "Destination no ext " + ae.getDestinationFileNameNoExt()
## print "Source  no ext     " + ae.getSourceFileNameNoExt()

## print ae.getSender()
## print ae.getUserClass()
## print ae.getDescription()
## print ae.getStandard()
## print ae.getCompressor()
## print ae.getBackupDir()
## print ae.getUser()
## print ae.getPasswd()

## print ae.getCorrelId()

## print ae.getRunStr()
## print ae.getSysOutStr()
