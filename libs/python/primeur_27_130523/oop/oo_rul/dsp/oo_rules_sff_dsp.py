#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- RulesSffDsp   : Clase de extracion de reglas en Dsp
-----------------------------------------------------------
+- Clases heredadas: 
--=----=----=----=----=----=----=----=----=----=----=----=-
- RulesSffEst
-----------------------------------------------------------
+- Clases utlizadas: 
--=----=----=----=----=----=----=----=----=----=----=----=-
- Ninguna
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- pendiente        : pendiente
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- Ninguna
===========================================================
+ Process Status  : [130516]
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


#- Importacion de clases heredadas

from oo_rules_sff_est import RulesSffEst


class RulesSffDsp(RulesSffEst):

    #-Variable estatica para indicar el nombre de la clase
    __cls           = "RulesSffDsp"
    __mth           = ""    
    __log_level             = 0
    __log_class_level       = 0


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                               , 
                 correl_id              = ""        , 
                 rules_file             = ""        , 
                 log_level              = 0         ,
                 log_class_level        = 0         ,
                 log_show               = "screen"  ):
        """ Constructor Rules SSF
        """

        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level

        
        RulesSffEst.__init__  ( self                , 
                                log_level           ,
                                log_class_level     ,
                                log_show            )        

        self.initRulesSffDsp()
        


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



    def initRulesSffDsp(self        ,
                        correl_id   , 
                        rules_file   ):
        """ Inicializar todas las reglas SFF
        """

        #-Antes de nada establece fichero de reglas y clave de filtro
        self.setRulCorrelIdTuple(correl_id)
        self.setRulesFileName(rules_file)

        self.sffRulQueueManager()
        self.sffRulQueue()
        self.sffRulSender()
        self.sffRulUserClass()
        self.sffRulDescription()
        self.sffRulStandard()
        self.sffRulCompressor()
        self.sffRulBackupDir()
        self.sffRulUser()
        self.sffRulPasswd()
        self.sffRulSourceFileName()
        self.sffRulDestinationFileName()


    def sffRulQueueManager (self):
        """ Establece el Gestor de colas desde fichero de reglas
        """
        argumento = "QMANAGER"
        valor_clave =  self.getKeyValue (argumento)
        self.setRulQueueManager(valor_clave)


    def sffRulQueue (self):
        """ Establece la Cola desde fichero de reglas
        """
        argumento = "QUEUE"
        valor_clave =  self.getKeyValue (argumento)
        self.setRulQueue(valor_clave)


    def sffRulSender (self):
        """ Establece el Emisor desde fichero de reglas
        """
        argumento = "SENDER"
        valor_clave =  self.getKeyValue (argumento)
        self.setRulSender(valor_clave)


    def sffRulUserClass (self):
        """ Establece la clase de usuario desde fichero de reglas
        """
        argumento = "UCLASS"
        valor_clave =  self.getKeyValue (argumento)
        self.setRulUserClass(valor_clave)


    def sffRulDescription (self):
        """ Establece la descripcion desde fichero de reglas
        """
        argumento = "DESCRIPTION"
        valor_clave =  self.getKeyValue (argumento)
        self.setRulDescription(valor_clave)


    def sffRulStandard (self):
        """ Establece el atributo Standard desde fichero de reglas
        """
        argumento = "STANDARD"
        valor_clave =  self.getKeyValue (argumento)
        self.setRulStandard(valor_clave)


    def sffRulCompressor (self):
        """ Establece la compresion desde fichero de reglas
        """
        argumento = "COMPRESSOR"
        valor_clave =  self.getKeyValue (argumento)
        self.setRulCompressor(valor_clave)


    def sffRulBackupDir (self):
        """ Establece la ruta de Backup desde fichero de reglas
        """
        argumento = "DIRBACKUP"
        valor_clave =  self.getKeyValue (argumento)
        self.setRulBackupDir(valor_clave)


    def sffRulUser (self):
        """ Establece el Usuario desde fichero de reglas
        """
        argumento = "USER"
        valor_clave =  self.getKeyValue (argumento)
        self.setRulUser(valor_clave)


    def sffRulPasswd (self):
        """ Establece la clave de usuario desde fichero de reglas
        """
        argumento = "PASSWD"
        valor_clave =  self.getKeyValue (argumento)
        self.setRulPasswd(valor_clave)


    def sffRulSourceFileName (self):
        """ Establece el Nombre Origen desde fichero de reglas
        """
        argumento = "SOURCEFILENAME"
        valor_clave =  self.getKeyValue (argumento)
        self.setRulSourceFileName(valor_clave)


    def sffRulDestinationFileName (self):
        """ Establece el Destination Filename desde fichero de reglas
        """
        argumento = "DESTINATIONFILENAME"
        valor_clave =  self.getKeyValue (argumento)
        self.setRulDestinationFileName(valor_clave)
  
    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=


### clave = "CorrelID1.Sender1"
### fichero = "pruebas.dat"

### ej = Rules(clave, fichero)

### print (ej.getDestinationFileName())
### print (ej.getDirectorio())


