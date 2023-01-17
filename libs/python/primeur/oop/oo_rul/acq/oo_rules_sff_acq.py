#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.4
@pythonver: 3.3
-----------------------------------------------------------
+ Clases definidas      : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- RulesSffAcq       - Clase de reglas para el proceso de acq
-----------------------------------------------------------
+- Clases heredadas     :
--=----=----=----=----=----=----=----=----=----=----=----=-
- RulesSffEst       - Clase Search From File de estructuras
-----------------------------------------------------------
+- Scripts - Funciones - Clases llamantes:
--=----=----=----=----=----=----=----=----=----=----=----=-
- Pendiente
-----------------------------------------------------------
-+ Metodos definidos            : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- sffAcqInit                - Inicializa las reglas Sff Acq
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
===========================================================
+ Process Status  : [130531]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [4] [_] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [3] [_] [5]
===========================================================
"""

#- Importacion de Clases Heredadas

from oo_rules_sff_est import RulesSffEst


class RulesSffAcq(RulesSffEst):


    #-Variable estatica para indicar el nombre de la clase
    __cls                   =   "RulesSffAcq"
    __mth                   =   ""    
    __log_level             =   0
    __log_class_level       =   0
    __log_show              =   "screen"

    __log_file              =   ""    # Log file por defecto
    __log_file_err          =   ""    # Log file de error

    __log_file_alt          =   ""    # Log file por defecto


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                   , 
                 correl_id_tuple        =   ""          , 
                 rules_file             =   ""          , 
                 comment                =   "#"         ,
                 log_level              =   0           ,
                 log_class_level        =   0           ,
                 log_show               =   "screen"    ,
                 log_file               =   ""          ,
                 log_file_err           =   ""          ,
                 log_size               =   1000000     ):
        """ Proceso de fichero de reglas para Acq
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

       
        RulesSffEst.__init__  ( self                , 
                                rules_file          ,
                                comment             ,
                                log_level           ,
                                log_class_level     ,
                                log_show            ,
                                log_file            ,
                                log_file_err        ,
                                log_size            )


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


    def sffAcqInit(self                         ,
                   correl_id_tuple      = ""    ,                    
                   rules_file           = ""    ):
        """ Inicializador de Acq
            Ejecuta todas las reglas
        """

        mth = "sffAcqInit"
        self.LogInitMethod(self.__cls)

        #-Antes de nada establece fichero de reglas y clave de filtro
        self.setRulesFileName(rules_file)
        self.setCorrelIdTuple(correl_id_tuple)

        #-- Construimos el objeto con todos los datos        

        self.sffRulDestinationFileName()

        self.sffRulDirectory()
        
        self.sffRulSobrescritura()
        self.sffRulCaracteres()
        self.sffRulExtraccion()
        self.sffRulPostProceso()
##        self.sffRulPostArgs()
        self.sffRulTrigger()
        self.sffRulCompresion()
        self.sffRulCopyDup()


        #-- Comprobacion de que todo llega bien.        

        self.__Log("Resultado Reglas"               , 
                   "-"                              , 
                   mth                              ,
                   "double_alt"                     )   

        self.__Log("Rules FileName"                 , 
                   self.getRulesFileName()          , 
                   mth                              )     

        self.__Log("Rules Sobrescritura"            , 
                   self.getRulSobrescritura()       , 
                   mth                              )

        self.__Log("Rules Caracteres"               , 
                   self.getRulCaracteres()          , 
                   mth                              )

        self.__Log("Rules Extraccion"               , 
                   self.getRulExtraccion()          , 
                   mth                              )

        self.__Log("Rules Post Proceso"             , 
                   self.getRulPostProcess()         , 
                   mth                              )

        self.__Log("Rules Post Args"                , 
                   self.getRulPostProcessArgs()     , 
                   mth                              )   

        self.__Log("Rules Compression"              , 
                   self.getRulCompress()            , 
                   mth                              )

        self.__Log("Rules Trigger"                  , 
                   self.getRulTrigger()             , 
                   mth                              )

        self.__Log("Rules Source FileName"          , 
                   self.getRulSourceFileName()      , 
                   mth                              )
                   
        self.__Log("Rules Destination FileName"         , 
                   self.getRulDestinationFileName()     , 
                   mth                                  )


        self.__Log("Rules CopyDup"                      , 
                   self.getRulCopyDup()                 ,
                   mth                                  ,
                   "simple_simple"                      )


        self.LogEndMethod(self.__cls)
   
    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=


### clave = "CorrelID1.Sender1"
### fichero = "pruebas.dat"

### ej = Rules(clave, fichero)

### print (ej.getDestinationFileName())
### print (ej.getDirectorio())


