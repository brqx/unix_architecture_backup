#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- RulesEst   : Clase de estructura para las reglas
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- RulesMsg   : Clase de mensajeria para las reglas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
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
#- Just           : [0] [1] [2] [_] [4] [5]
===========================================================
"""


#- Importacion de clases
from oo_rules_msg import RulesMsg

#- Prueba OOP

class RulesEst(RulesMsg):

    #-Variable estatica para indicar el nombre de la clase
    __cls                           = "RulesEst"
    __mth                           = ""    
    __log_level                     = 0
    __log_class_level               = 0



    #- Atributos privados post proceso
    __rul_correlid                  = ""
    __rul_sender                    = ""
    __rul_destination_filename      = ""    #- Fichero destino
    __rul_source_filename           = ""    #- Fichero destino
    __rul_directorio                = ""
    __rul_sobreescritura            = ""    #- Y/N 
    __rul_caracteres                = ""    #- MAYUS/MINUS
    __rul_extraccion                = ""    #- INPUT/BROWSE
    __rul_postproceso               = ""    #- Script de postproceso
    __rul_postargs                  = ""    #- Argumentos scripts de postproceso
    __rul_compresion                = ""    #- Indica el formato en el que se comprime
    __rul_trigger                   = ""    #- Extensino Fichero bandera que se genera

    #- Atributos privados pre proceso

    __rul_queue_manager             = ""
    __rul_queue                     = ""
    __rul_user_class                = ""
    __rul_description               = ""
    __rul_standard                  = ""
    __rul_compressor                = ""
    __rul_backup_dir                = ""
    __rul_user                      = ""
    __rul_passwd                    = ""


    #- Atributos preproceso de regals

    __rul_correl_id_tuple       = ""    #- Tupla Correl Id
    __rules_file_name       = ""    #- Nombre del fichero de reglas


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                               , 
                 comment                = "#"       ,                 
                 log_level              = 0         ,
                 log_class_level        = 0         ,
                 log_show               = "screen"  ):
        """ Constructor estructura de reglas
        """

        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level

        RulesMsg.__init__(self              , 
                          log_level         ,
                          log_class_level   ,
                          log_show          )

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


#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#       METODOS RULES EST
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=


    def getRulCorrelId(self):
        """ Retorno del CorrelId - Identificador - pendiente - 
        """    

        valor_a_devolver = self.__rul_correlid
        self.logGet(valor_a_devolver, self.msg_rul_correlid)
        return valor_a_devolver

    
    def setRulCorrelId(self, argumento):
        """ Establecimiento del CorrelId
        """    

        variable_a_establecer = self.__rul_correlid
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_correlid)

        self.__rul_correlid = argumento


    def getRulSender(self):
        """ Retorno del Sender
        """    

        valor_a_devolver = self.__rul_sender
        self.logGet(valor_a_devolver, self.msg_rul_sender)
        return valor_a_devolver

    
    def setRulSender(self, argumento):
        """ Establecimiento del Sender
        """    

        variable_a_establecer = self.__rul_sender

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_sender)

        self.__rul_sender = argumento


    def getRulDestinationFileName(self):
        """ Retorno del Fichero destino
        """    

        valor_a_devolver = self.__rul_destination_filename
        self.logGet(valor_a_devolver, self.msg_rul_destination_filename)
        return valor_a_devolver

    
    def setRulDestinationFileName(self, argumento):
        """ Establecimient del fichero destino
        """    

        variable_a_establecer = self.__rul_destination_filename
        
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_destination_filename)

        self.__rul_destination_filename = argumento


    def getRulSourceFileName(self):
        """ Retorno del Fichero origen
        """    

        valor_a_devolver = self.__rul_source_filename
        self.logGet(valor_a_devolver, self.msg_rul_source_filename)
        return valor_a_devolver

    
    def setRulSourceFileName(self, argumento):
        """ Establecimient del fichero origen
        """    

        variable_a_establecer = self.__rul_source_filename
        
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_source_filename)

        self.__rul_source_filename = argumento


    def getRulDirectory(self):
        """ Retorno del directorio temporal
        """    

        valor_a_devolver = self.__rul_directorio
        self.logGet(valor_a_devolver, self.msg_rul_directorio)
        return valor_a_devolver

    
    def setRulDirectory(self, argumento):
        """ Establecimiento del directorio temporal
        """    

        variable_a_establecer = self.__rul_directorio
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_directorio)

        self.__rul_directorio = argumento


    def getRulSobrescritura(self):
        """ Retorno de la Sobrescritura
        """    

        valor_a_devolver = self.__rul_sobreescritura
        self.logGet(valor_a_devolver, self.msg_rul_sobreescritura)
        return valor_a_devolver

    
    def setRulSobrescritura(self, argumento):
        """ Establecimiento de la sobrescritura
        """    

        variable_a_establecer = self.__rul_sobreescritura

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_sobreescritura)

        self.__rul_sobreescritura = argumento


    def getRulCaracteres(self):
        """ Retorno de los caracteres
        """    

        valor_a_devolver = self.__rul_caracteres
        self.logGet(valor_a_devolver, self.msg_rul_caracteres)
        return valor_a_devolver

    
    def setRulCaracteres(self, argumento):
        """ Establecimiento de los caracteres
        """    

        variable_a_establecer = self.__rul_caracteres
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_caracteres)

        self.__rul_caracteres = argumento


    def getRulExtraccion(self):
        """ Retorno del parametro extraccion
        """    

        valor_a_devolver = self.__rul_extraccion
        self.logGet(valor_a_devolver, self.msg_rul_extraccion)
        return valor_a_devolver
        

    def setRulExtraccion(self, argumento):
        """ Establecimiento del parametro extraccion
        """    

        variable_a_establecer = self.__rul_extraccion

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_extraccion)

        self.__rul_extraccion = argumento


    def getRulPostProcess(self):
        """ Retorno del Postproceso
        """    

        valor_a_devolver = self.__rul_postproceso
        self.logGet(valor_a_devolver, self.msg_rul_postproceso)
        return valor_a_devolver

        
    def setRulPostProcess(self, argumento):
        """ Establecimiento del Postproceso
        """    

        variable_a_establecer = self.__rul_postproceso
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_postproceso)

        self.__rul_postproceso = argumento


    def getRulPostProcessArgs(self):
        """ Retorno del los argumentos del postproceso
        """    

        valor_a_devolver = self.__rul_postargs
        self.logGet(valor_a_devolver, self.msg_rul_postargs)
        return valor_a_devolver
    

    def setRulPostProcessArgs(self, argumento):
        """ Establecimiento de los argumentos de postproceso
        """    

        variable_a_establecer = self.__rul_postargs
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_postargs)

        self.__rul_postargs = argumento


    def getRulCompress(self):
        """ Retorno de la compresion en recepcion
        """    

        valor_a_devolver = self.__rul_compresion
        self.logGet(valor_a_devolver, self.msg_rul_compresion)
        return valor_a_devolver

    
    def setRulCompress(self, argumento):
        """ Establecimiento del la compresion en recepcion
        """    

        variable_a_establecer = self.__rul_compresion
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_compresion)

        self.__rul_compresion = argumento


    def getRulTrigger(self):
        """ Retorno del Trigger o bandera
        """    

        valor_a_devolver = self.__rul_trigger
        self.logGet(valor_a_devolver, self.msg_rul_trigger)
        return valor_a_devolver
    

    def setRulTrigger(self, argumento):
        """ Establecimiento del trigger o bandera
        """    

        variable_a_establecer = self.__rul_trigger
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_trigger)

        self.__rul_trigger = argumento

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#       METODOS GENERALES
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=


    def getRulesFileName(self):
        """ Retorno del fichero de reglas
        """    

        valor_a_devolver = self.__rules_file_name
        self.logGet(valor_a_devolver, self.msg_rul_file_name)
        return valor_a_devolver
    

    def setRulesFileName(self, argumento):
        """ Establecimiento del fichero de reglas
        """    

        variable_a_establecer = self.__rules_file_name
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_file_name)

        self.__rules_file_name= argumento


    def getRulCorrelIdTuple(self):
        """ Retorno de la tupla Correl Id
        """    

        valor_a_devolver = self.__rul_correl_id_tuple
        self.logGet(valor_a_devolver, self.msg_rul_correl_id_tuple)
        return valor_a_devolver
    

    def setRulCorrelIdTuple(self, argumento):
        """ Establecimiento de la tupla Correl Id
        """    

        variable_a_establecer = self.__rul_correl_id_tuple
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_correl_id_tuple)

        self.__rul_correl_id_tuple = argumento


#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#       METODOS PRE PROCESO
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=


    def getRulQueueManager(self):
        """ Retorno del Gestor de Colas
        """    

        valor_a_devolver = self.__rul_queue_manager
        self.logGet(valor_a_devolver, self.msg_rul_queue_manager)
        return valor_a_devolver

    
    def setRulQueueManager(self, argumento):
        """ Establecimiento del Gestor de Colas
        """    

        variable_a_establecer = self.__rul_queue_manager
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_queue_manager)

        self.__rul_queue_manager = argumento


    def getRulQueue(self):
        """ Retorno de la cola
        """    

        valor_a_devolver = self.__rul_queue
        self.logGet(valor_a_devolver, self.msg_rul_queue)
        return valor_a_devolver

    
    def setRulQueue(self, argumento):
        """ Establecimiento de la cola
        """    

        variable_a_establecer = self.__rul_queue
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_queue)

        self.__rul_queue = argumento


    def getRulUserClass(self):
        """ Retorno de la clase de usuario
        """    

        valor_a_devolver = self.__rul_user_class
        self.logGet(valor_a_devolver, self.msg_rul_user_class)
        return valor_a_devolver

    
    def setRulUserClass(self, argumento):
        """ Establecimiento de la clase de usuario
        """    

        variable_a_establecer = self.__rul_user_class
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_user_class)

        self.__rul_user_class = argumento


    def getRulDescription(self):
        """ Retorno de la description
        """    

        valor_a_devolver = self.__rul_description
        self.logGet(valor_a_devolver, self.msg_rul_description)
        return valor_a_devolver

    
    def setRulDescription(self, argumento):
        """ Establecimiento de la descripcion
        """    

        variable_a_establecer = self.__rul_description
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_description)

        self.__rul_description = argumento


    def getRulStandard(self):
        """ Retorno del standard
        """    

        valor_a_devolver = self.__rul_standard
        self.logGet(valor_a_devolver, self.msg_rul_standard)
        return valor_a_devolver

    
    def setRulStandard(self, argumento):
        """ Establecimiento del standard
        """    

        variable_a_establecer = self.__rul_standard
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_standard)

        self.__rul_standard = argumento


    def getRulCompressor(self):
        """ Retorno del metodo de compresion
        """    

        valor_a_devolver = self.__rul_compressor
        self.logGet(valor_a_devolver, self.msg_rul_compressor)
        return valor_a_devolver

    
    def setRulCompressor(self, argumento):
        """ Establecimiento del metodo de compresion
        """    

        variable_a_establecer = self.__rul_compressor
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_compressor)

        self.__rul_compressor = argumento


    def getRulBackupDir(self):
        """ Retorno del directorio de backup
        """    

        valor_a_devolver = self.__rul_backup_dir
        self.logGet(valor_a_devolver, self.msg_rul_backup_dir)
        return valor_a_devolver

    
    def setRulBackupDir(self, argumento):
        """ Establecimiento del directorio de backup
        """    

        variable_a_establecer = self.__rul_backup_dir
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_backup_dir)

        self.__rul_backup_dir = argumento


    def getRulUser(self):
        """ Retorno del Usuario
        """    

        valor_a_devolver = self.__rul_user
        self.logGet(valor_a_devolver, self.msg_rul_user)
        return valor_a_devolver

    
    def setRulUser(self, argumento):
        """ Establecimiento del Usuario
        """    

        variable_a_establecer = self.__rul_user
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_user)

        self.__rul_user = argumento


    def getRulPasswd(self):
        """ Retorno de la clave de usuario
        """    

        valor_a_devolver = self.__rul_passwd
        self.logGet(valor_a_devolver, self.msg_rul_passwd)
        return valor_a_devolver

    
    def setRulPasswd(self, argumento):
        """ Establecimiento de la clave de usuario
        """    

        variable_a_establecer = self.__rul_passwd
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rul_passwd)

        self.__rul_passwd = argumento


#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=



