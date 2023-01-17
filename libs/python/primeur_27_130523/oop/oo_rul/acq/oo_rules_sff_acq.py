#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- RulesSffAcq   : Clase de reglas para el proceso de acq
-----------------------------------------------------------
+- Clases heredadas  :
--=----=----=----=----=----=----=----=----=----=----=----=-
- RulesSffEst : Clase Search From File de estructuras
-----------------------------------------------------------
+- Scripts, Funciones , Clases llamantes:
--=----=----=----=----=----=----=----=----=----=----=----=-
- Pendiente
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
#- Quality        : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [_] [3] [4] [5]
===========================================================
"""

#- Importacion de Clases Heredadas

from oo_rules_sff_est import RulesSffEst



class RulesSffAcq(RulesSffEst):


    #-Variable estatica para indicar el nombre de la clase
    __cls                   = "RulesSffAcq"
    __mth                   = ""    
    __log_level             = 0
    __log_class_level       = 0


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                           , 
                 correl_id_tuple    = ""        , 
                 rules_file         = ""        , 
                 comment            = "#"       ,
                 log_level          = 0         ,
                 log_class_level    = 0         ,
                 log_show           = "screen"  ):
        """ Proceso de fichero de reglas para Acq
        """

        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level

       
        RulesSffEst.__init__  (self         , 
                               rules_file      ,
                               comment         ,
                               log_level       ,
                               log_class_level ,
                               log_show        )        


        if log_level > log_class_level:
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
##        self.sffRulCopyDup()


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
                    mth                             )

        self.__Log("Rules Caracteres"               , 
                   self.getRulCaracteres()          , 
                    mth                             )

        self.__Log("Rules Extraccion"               , 
                   self.getRulExtraccion()          , mth  )
        self.__Log("Rules Post Proceso"             , 
                   self.getRulPostProcess()         , mth  )
        self.__Log("Rules Post Args"                , 
                   self.getRulPostProcessArgs()     , mth  )   
        self.__Log("Rules Compression"              , 
                   self.getRulCompress()            , mth  )
        self.__Log("Rules Trigger"                  , 
                   self.getRulTrigger()             , mth  )
##        self.__Log("Rules CopyDup"               , self.getRulCopyDup()           )
        self.__Log("Rules Source FileName"          , 
                   self.getRulSourceFileName()      , mth  )
        self.__Log("Rules Destination FileName"     , 
                 self.getRulDestinationFileName()   , mth  )


        self.LogEndMethod(self.__cls)
   
    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=


### clave = "CorrelID1.Sender1"
### fichero = "pruebas.dat"

### ej = Rules(clave, fichero)

### print (ej.getDestinationFileName())
### print (ej.getDirectorio())


