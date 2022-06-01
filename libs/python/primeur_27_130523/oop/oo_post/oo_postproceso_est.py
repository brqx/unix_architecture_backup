#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- PostProcesoEst      : Clase de estructura de post proceso
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- PostProcesoMsg      : Clase de mensajes de post proceso
-----------------------------------------------------------
-+ Clases utilizadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- Split               : Clase de subcadenas
-----------------------------------------------------------
-+ Metodos definidos : 
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
+ Process Status  : [130520]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Just           : [0] [_] [2] [3] [4] [5]
===========================================================
"""


#- Importacion de clases heredadas

from oo_postproceso_msg import PostProcesoMsg

#- Importacion de clases utilizadas

from oo_split import Split


class PostProcesoEst(PostProcesoMsg):

    #-Variable estatica para indicar el nombre de la clase
    __cls                       = "PostProcesoEst"
    __mth                       = ""    
    __log_level                 = 0
    __log_class_level           = 0


    #-Atributos internas propias de Spazio
    __post_destination_filename         = ""
    __post_destination_filename_no_ext  = ""
    __post_ext                          = ""
  
    __post_directory                    = ""

    __post_process                      = ""
    __post_trigger                      = ""
    __post_compress                     = ""
    __post_args                         = ""
   
    
    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                               , 
                 dest_filename          = ""        ,
                 directory              = ""        ,
                 proceso                = ""        ,  
                 compress               = "gz"      , 
                 trigger                = "TRG"     ,
                 log_level              = 0         ,
                 log_class_level        = 0         ,
                 log_show               = "screen"  ):
        """ Constructor estructura del postproceso
        """

        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level

        PostProcesoMsg.__init__(self                , 
                                log_level           ,
                                log_class_level     ,
                                log_show            )

        
        #-- Acciones constructor
        #   Debemos construir el objeto
        self.setPostDestinationFileName(dest_filename)
        self.setPostDestinationFileNameNoExt()
        self.setPostExt()

        self.setPostDirectory(directory)

        self.setPostProcess(proceso)
        self.setPostTrigger(trigger)
        self.setPostCompress(compress)


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


    
    def getPostProcess(self         , 
                       log_level = 0):
        """ Retorno del QmName - Nombre del Gestor de Colas
        """    

        valor_a_devolver = self.__post_process

        self.logGet(
            valor_a_devolver, 
            self.msg_process,
            self.log_level)

        return valor_a_devolver


    def setPostProcess(self         , 
                       argumento    ):
        """ Establecimiento del nombre del gestor de colas
        """    

        variable_a_establecer = self.__post_process

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_process,
            self.log_level)
            
        self.__post_process = argumento


    def getPostTrigger(self):
        """ Retorno del Queue - Nombre del la cola
        """    

        valor_a_devolver = self.__post_trigger
        self.logGet(
            valor_a_devolver, 
            self.msg_trigger,
            self.log_level)
        return valor_a_devolver

        
    def setPostTrigger(self, argumento):
        """ Establecimiento del nombre de la cola
        """    

        variable_a_establecer = self.__post_trigger
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_trigger,
            self.log_level)

        self.__post_trigger = argumento


    def getPostCompress(self):
        """ Retorno del NumInt - Identificador del mensaje
        """    

        valor_a_devolver = self.__post_compress
        self.logGet(
            valor_a_devolver, 
            self.msg_compress,
            self.log_level)

        return valor_a_devolver


    def setPostCompress(self            , 
                        argumento       ):
        """ Establecimiento el Identificador del mensaje
        """    

        variable_a_establecer = self.__post_compress
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_compress,
            self.log_level)
            
        self.__post_compress = argumento


    def getPostArgs(self):
        """ Retorno del Destination FileName
        """    

        valor_a_devolver = self.__post_args
        self.logGet(
            valor_a_devolver, 
            self.msg_post_args,
            self.log_level)
            
        return valor_a_devolver


    def setPostArgs(self            , 
                    argumento       ):
        """ Establecimiento del destination filename
        """    

        variable_a_establecer = self.__post_args
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_post_args,
            self.log_level)

        self.__post_args = argumento


    def getPostDestinationFileName(self):
        """ Retorno del Destination FileName
        """    

        valor_a_devolver = self.__post_destination_filename
        self.logGet(
            valor_a_devolver, 
            self.msg_destination_filename,
            self.log_level)
            
        return valor_a_devolver


    def setPostDestinationFileName(self, argumento):
        """ Establecimiento del destination filename
        """    

        variable_a_establecer = self.__post_destination_filename
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_destination_filename,
            self.log_level)

        self.__post_destination_filename = argumento


    def getPostDestinationFileNameNoExt(self):
        """ Retorno del Destination FileName sin extension
        """    

        valor_a_devolver = self.__post_destination_filename_no_ext
        self.logGet(
            valor_a_devolver, 
            self.msg_destination_filename_no_ext,
            self.log_level)
            
        return valor_a_devolver


    def setPostDestinationFileNameNoExt(self):
        """ Establecimiento del destination FileName sin extension
        """    

        argumento               = self.getPostDestinationFileName()

        splited_car             = Split(argumento)
        cadena_sin_extension    = splited_car.getFileNameNoExt()

        variable_a_establecer   = cadena_sin_extension

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_destination_filename_no_ext,
            self.log_level)

        self.__post_destination_filename_no_ext = \
            variable_a_establecer
    

    def getPostExt(self):
        """ Retorno del Destination FileName sin extension
        """    

        valor_a_devolver = self.__post_ext
        self.logGet(
            valor_a_devolver, 
            self.msg_destination_filename_no_ext,
            self.log_level)
            
        return valor_a_devolver


    def setPostExt(self):
        """ Establecimiento del destination FileName sin extension
        """    

        argumento               = self.getPostDestinationFileName()

        splited_car             = Split(argumento)
        cadena_sin_extension    = splited_car.getExt()

        variable_a_establecer   = cadena_sin_extension

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_destination_filename_no_ext,
            self.log_level)

        self.__post_ext = \
            variable_a_establecer

    
    def getPostDirectory(self):
        """ Retorno del Directorio - Directorio temporal
        """    

        valor_a_devolver = self.__post_directory
        self.logGet(
            valor_a_devolver, 
            self.msg_directory,
            self.log_level)
            
        return valor_a_devolver


    def setPostDirectory(self           , 
                         argumento      ):
        """ Establecimiendo el directorio del nombre del gestor de colas
        """    

        variable_a_establecer = self.__post_directory
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_directory,
            self.log_level)

        self.__post_directory = argumento

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
