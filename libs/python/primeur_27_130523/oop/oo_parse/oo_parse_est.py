#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- ParseEst   : Clase de estructura para el parseo
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- ParseMsg   : Clase de mensajeria para el parseo
-----------------------------------------------------------
-+ Clases utilizadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- Split      : Clase de gestion de subcadenas
-----------------------------------------------------------
-+ Metodos definidos : 
-----------------------------------------------------------
- Pendiente  (init, gets y sets)
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- Ninguna
===========================================================
+ Process Status : [130509]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [3] [_] [5]
===========================================================
"""

#- Importacion de clases heredadas

from oo_parse_msg import ParseMsg


#- Importacion de clases utilizadas

from oo_split import Split


class ParseEst(ParseMsg):

    #-Variable estatica para indicar el nombre de la clase
    __cls               = "ParseEst"
    __mth               = ""    
    __log_level         = 0
    __log_class_level   = 0


    #- Atributos privados principales

    __parse_cadena                      = ""    #- Cadena a parsear
    __parse_resultado                   = ""    #- Cadena parseada    


    #- Atributos privados
    __parse_source_filename             = ""
    __parse_destination_filename        = ""
    __parse_source_filename_no_ext      = ""
    __parse_destination_filename_no_est = ""
    __parse_correl_id                   = ""
    __parse_sender                      = ""
    __parse_description                 = ""


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                               , 
                 cadena_a_parsear   =   ""          ,
                 sourcename         =   ""          ,
                 destname           =   ""          ,
                 correl_id          =   ""          ,
                 sender             =   ""          ,
                 description        =   ""          ,
                 log_level          =   0           ,
                 log_class_level    =   0           ,
                 log_show           =   "screen"    ):
        """ Clase de estructura del parseo
        """


        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level


        ParseMsg.__init__(  self                        ,
                            log_level                   ,
                            log_class_level             ,
                            log_show                    )
  
                   
        ## Metodos constructor

        self.setParseString                     (cadena_a_parsear   )
        self.setParseSourceFileName             (sourcename         )
        self.setParseDestinationFileName        (destname           )
        self.setParseSourceFileNameNoExt        ()
        self.setParseDestinationFileNameNoExt   ()
        self.setParseCorrelId                   (correl_id          )
        self.setParseSender                     (sender             )
        self.setParseDescription                (description        )


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


    def getParseString(self):
        """ Retorno de la cadena
        """    

        valor_a_devolver = self.__parse_cadena
        self.logGet(valor_a_devolver, self.msg_parse_cadena)
        return valor_a_devolver
    
    
    def setParseString(self, argumento):
        """ Establecimiento de la Cadena
        """    

        variable_a_establecer = self.__parse_cadena

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_parse_cadena)

        self.__parse_cadena = argumento



    def getParseSourceFileName(self):
        """ Retorno del Fichero Origen
        """    

        valor_a_devolver = self.__parse_source_filename
        self.logGet(valor_a_devolver, self.msg_parse_source_filename)
        return valor_a_devolver

    
    def setParseSourceFileName(self, argumento):
        """ Establecimiento del Fichero Origen
        """    

        variable_a_establecer = self.__parse_source_filename

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_parse_source_filename)

        self.__parse_source_filename = argumento


    def getParseDestinationFileName(self):
        """ Retorno del Nombre Fichero Destino
        """    

        valor_a_devolver = self.__parse_destination_filename
        self.logGet(valor_a_devolver, self.msg_parse_destination_filename)
        return valor_a_devolver

    
    def setParseDestinationFileName(self, argumento):
        """ Establecimiento del Fichero Destino
        """    

        variable_a_establecer = self.__parse_destination_filename

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_parse_destination_filename)

        self.__parse_destination_filename = argumento


    def getParseDestinationFileNameNoExt(self):
        """ Retorno del Nombre Fichero Destino sin extension
        """    

        valor_a_devolver = self.__parse_destination_filename_no_ext
        self.logGet(valor_a_devolver, 
                    self.msg_parse_destination_filename_no_ext)
        return valor_a_devolver

    
    def setParseDestinationFileNameNoExt(self):
        """ Establecimiento nombre del fichero destino sin extension
        """    
        #- Hay que quitarle la extension

        argumento = self.getParseDestinationFileName()

        splited_car  = Split(argumento)
        cadena_sin_extension= splited_car.getFileNameNoExt()

        variable_a_establecer = cadena_sin_extension

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_parse_destination_filename_no_ext)

        self.__parse_destination_filename_no_ext = \
            variable_a_establecer
            

    def getParseSourceFileNameNoExt(self):
        """ Retorno del Nombre Fichero Destino sin extension
        """    

        valor_a_devolver = self.__parse_source_filename_no_ext
        self.logGet(valor_a_devolver, 
                    self.msg_parse_source_filename_no_ext)
        return valor_a_devolver

    
    def setParseSourceFileNameNoExt(self):
        """ Establecimiento del Nombre del Fichero destino sin extension
        """    

        argumento = self.getParseSourceFileName()

        splited_car  = Split(argumento)
        cadena_sin_extension= splited_car.getFileNameNoExt()
        
        variable_a_establecer = cadena_sin_extension

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_parse_source_filename_no_ext)

        self.__parse_source_filename_no_ext = variable_a_establecer
            

    def getParseDescription(self):
        """ Retorno de la Descripcion
        """    

        valor_a_devolver = self.__parse_description
        self.logGet(valor_a_devolver, self.msg_parse_description)
        return valor_a_devolver

    
    def setParseDescription(self, argumento):
        """ Establecimiento de la Descripcion
        """    

        variable_a_establecer = self.__parse_description

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_parse_description)

        self.__parse_description = argumento


    def getParseQmName(self):
        """ Retorno del Gestor de Colas
        """    

        valor_a_devolver = self.__parse_qmname
        self.logGet(valor_a_devolver, self.msg_parse_qmname)
        return valor_a_devolver

    
    def setParseQmName(self, argumento):
        """ Establecimiento Gestor de Colas
        """    

        variable_a_establecer = self.__parse_qmname

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_parse_qmname)

        self.__parse_qmname = argumento


    def getParseQueue(self):
        """ Retorno de la cola
        """    

        valor_a_devolver = self.__parse_queue
        self.logGet(valor_a_devolver, self.msg_parse_queue)
        return valor_a_devolver

    
    def setParseQueue(self, argumento):
        """ Establecimiento de la cola
        """    

        variable_a_establecer = self.__parse_queue

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_parse_queue)

        self.__parse_queue = argumento


    def getParseNumInt(self):
        """ Retorno del NumInt
        """    

        valor_a_devolver = self.__parse_numint
        self.logGet(valor_a_devolver, self.msg_parse_numint)
        return valor_a_devolver

    
    def setParseNumInt(self, argumento):
        """ Establecimiento del NumInt
        """    

        variable_a_establecer = self.__parse_numint

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_parse_numint)

        self.__parse_numint = argumento


    def getParseCorrelId(self):
        """ Retorno del Correl Id
        """    

        valor_a_devolver = self.__parse_correl_id
        self.logGet(valor_a_devolver, self.msg_parse_correl_id)
        return valor_a_devolver

    
    def setParseCorrelId(self, argumento):
        """ Establecimiento del Correl Id
        """    

        variable_a_establecer = self.__parse_correl_id

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_parse_correl_id)

        self.__parse_correl_id = argumento


    def getParseSender(self):
        """ Retorno del Sender
        """    

        valor_a_devolver = self.__parse_sender
        self.logGet(valor_a_devolver, self.msg_parse_sender)
        return valor_a_devolver

    
    def setParseSender(self, argumento):
        """ Establecimiento del Sender
        """    

        variable_a_establecer = self.__parse_sender

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_parse_sender)

        self.__parse_sender = argumento


    def getParseDirectory(self):
        """ Retorno del Directorio
        """    

        valor_a_devolver = self.__parse_directory
        self.logGet(valor_a_devolver, self.msg_parse_directory)
        return valor_a_devolver

    
    def setParseDirectory(self, argumento):
        """ Establecimiento del Directorio
        """    

        variable_a_establecer = self.__parse_directory

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_parse_directory)

        self.__parse_directory = argumento

    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

