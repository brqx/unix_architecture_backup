#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.5
@pythonver: 3.3
-----------------------------------------------------------
+ Clases definidas              : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- PostProcesoEst      - Clase de estructura de post proceso
-----------------------------------------------------------
-+ Clases heredadas             : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- PostProcesoMsg      - Clase de mensajes de post proceso
-----------------------------------------------------------
-+ Clases utilizadas            : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- Split               - Clase de subcadenas
-----------------------------------------------------------
-+ Metodos definidos            : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- runSys                                - Ejecuta la oren de sistema
-----------------------------------------------------------
- get/setPostProcess                    - Post Proceso
-----------------------------------------------------------
- get/setPostArgs                       - Argumentos post proceso
-----------------------------------------------------------
- get/setPostTrigger                    - Bandera
-----------------------------------------------------------
- get/setPostCompress                   - Compresion
-----------------------------------------------------------
- get/setPostCopyDup                    - Duplicados
-----------------------------------------------------------
- get/setPostDestinationFileName        - Destination FileName
-----------------------------------------------------------
- get/setPostDestinationFileNameNoExt   - DF sin ext
-----------------------------------------------------------
- get/setPostFullPathFileName           - Full Path Filename
-----------------------------------------------------------
- get/setPostExt                        - Extension
-----------------------------------------------------------
- get/setPostDirectory                  - Directorio
-----------------------------------------------------------
- get/setPostDeleteFile                 - Borrado de ficheros
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
--=----=----=----=----=----=----=----=----=----=----=----=-
- Ninguna
===========================================================
+ Process Status  : [130701]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [3] [4] [_]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [3] [_] [5]
===========================================================
"""


#- Importacion de clases heredadas

from oo_postproceso_msg import PostProcesoMsg

#- Importacion de clases utilizadas

from oo_split import Split


class PostProcesoEst(PostProcesoMsg):

    #-Variable estatica para indicar el nombre de la clase
    __cls                               = "PostProcesoEst"
    __mth                               = ""    
    __log_level                         = 0
    __log_class_level                   = 0

    __log_show                          = "screen"
    __log_file                          = ""    # Log file por defecto
    __log_file_alt                      = ""    # Log file alterno
    __log_file_err                      = ""    # Log file de errores

    #-Atributos internas propias de Spazio
    __post_destination_filename         = ""
    __post_destination_filename_no_ext  = ""
    __post_ext                          = ""
  
    __post_directory                    = ""

    __post_process                      = ""
    __post_trigger                      = ""
    __post_compress                     = ""
    __post_args                         = ""
    __post_copydup                      = ""    # Control de duplicados

    __post_delete_file                  = ""    # Opcion de borrado del fichero
                                                # extraido

    __post_delete_trigger              = ""     # Opcion de borrado de la bandera
                                                # generada


    __post_full_path_filename           = ""    # Ruta completa del archivo

    __post_full_path_trigger           = ""    # Ruta completa de la bandera

    #-Atributos gestion de mensajes de salida

    msg                                 = ""
    __post_exit_code                    = 0
    __post_exit_str                     = ""

    
    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                       , 
                 dest_filename          =   ""              ,
                 directory              =   ""              ,
                 proceso                =   ""              ,  
                 compress               =   "gz"            , 
                 trigger                =   "TRG"           ,
                 copydup                =   ""              ,
                 deletefile             =   ""              ,
                 log_level              =   0               ,
                 log_class_level        =   0               ,
                 log_show               =   "screen"        ,
                 log_file               =   ""              ,
                 log_file_err           =   ""              ,
                 log_size               =   1000000         ):
        """ Constructor estructura del postproceso
        """

        mth = "init"
        
        #- Establecimiento nivel de log
        self.__log_level = log_level

        self.LogInitConstructor(log_level           , 
                                log_class_level     , 
                                log_show            )

        log_class_level = log_class_level + 1        

        self.__log_class_level  = log_class_level

        #-Estableciendo fichero de log
        self.__log_show             =   log_show

        self.__log_file             =   log_file
        self.__log_file_err         =   log_file_err  

        #-Establecemos codigo y mensaje por defecto

        self.__post_exit_code       =   0
        self.__post_exit_str        =   self.msg_exit_str_ok


        PostProcesoMsg.__init__(self                , 
                                log_level           ,
                                log_class_level     ,
                                log_show            ,
                                log_file            ,
                                log_size            )

        
        #-- Acciones constructor
        #   Debemos construir el objeto
        self.setPostDestinationFileName(dest_filename)
        self.setPostDestinationFileNameNoExt()
        self.setPostExt()

        self.setPostDirectory(directory)

        self.setPostProcess(proceso)
        self.setPostTrigger(trigger)
        self.setPostCompress(compress)
        self.setPostCopyDup(copydup)
        self.setPostDeleteFile(deletefile)

        #-Establecemos la configuracion del fichero completo si no hay compresion
        
        full_path_filename = directory + self.slash +  dest_filename

        self.setPostFullPathFileName(full_path_filename)

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


    #-Clase de log de error
    def __ErrLog(self                          ,
                 texto                         ,
                 valor         =   ""          ,
                 mth           =   "init"      ,
                 dec           =   "normal"    ):
        """ Log de la clase para error
        """        

        self.__log_file_alt  = self.__log_file_err

        self.__LogAlt(texto                 ,
                      valor                 ,
                      mth                   ,
                      dec                   )

    
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


    def getPostCopyDup(self):
        """ Retorno del control de duplicados
        """    

        valor_a_devolver = self.__post_copydup
        self.logGet(
            valor_a_devolver        , 
            self.msg_copydup        ,
            self.log_level          )

        return valor_a_devolver


    def setPostCopyDup(self            , 
                        argumento       ):
        """ Establecimiento el control de duplicados
        """    

        variable_a_establecer = self.__post_copydup
        self.logSet(
            variable_a_establecer   , 
            argumento               , 
            self.msg_copydup        ,
            self.log_level          )
            
        self.__post_copydup = argumento


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

        split_separator     = "\."
        output_separator    = "."
        log_level       = self.__log_level
        log_class_level = self.__log_class_level
        log_show        = self.__log_show
        log_file        = self.__log_file


        splited_car             = Split(argumento           ,
                                        split_separator     ,
                                        output_separator    ,
                                        log_level           ,
                                        log_class_level     ,
                                        log_show            ,
                                        log_file            )

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

        split_separator     = "\."
        output_separator    = "."
        log_level       = self.__log_level
        log_class_level = self.__log_class_level
        log_show        = self.__log_show
        log_file        = self.__log_file


        splited_car             = Split(argumento           ,
                                        split_separator     ,
                                        output_separator    ,
                                        log_level           ,
                                        log_class_level     ,
                                        log_show            ,
                                        log_file            )

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


    def getPostFullPathFileName(self):
        """ Retorno del Destination FileName
        """    

        valor_a_devolver = self.__post_full_path_filename
        self.logGet(
            valor_a_devolver, 
            self.msg_full_path_filename,
            self.log_level)
            
        return valor_a_devolver


    def setPostFullPathFileName(self, argumento):
        """ Establecimiento del destination filename
        """    

        variable_a_establecer = self.__post_full_path_filename
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_full_path_filename,
            self.log_level)

        self.__post_full_path_filename = argumento


    def getPostDeleteFile(self):
        """ Retorno de la opcion de borrado una vez extraido el archivo
        """    

        valor_a_devolver = self.__post_delete_file
        self.logGet(
            valor_a_devolver, 
            self.msg_delete_file,
            self.log_level)
            
        return valor_a_devolver


    def setPostDeleteFile(self                          , 
                          argumento     =   "Borrar"    ):
        """ Establecimiendo la opcion borrado una vez extraido el archivo
        """    

        variable_a_establecer = self.__post_delete_file

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_delete_file,
            self.log_level)

        self.__post_delete_file = argumento


    def getPostFullPathTrigger(self):
        """ Retorno del Trigger con path absoluto
        """    

        valor_a_devolver = self.__post_full_path_trigger
        self.logGet(
            valor_a_devolver, 
            self.msg_full_path_trigger,
            self.log_level)
            
        return valor_a_devolver


    def setPostFullPathTrigger(self, argumento):
        """ Establecimiento del trigger con path absoluto
        """    

        variable_a_establecer = self.__post_full_path_trigger
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_full_path_trigger,
            self.log_level)

        self.__post_full_path_trigger = argumento


    def getPostDeleteTrigger(self):
        """ Retorno de la opcion de borrado una vez extraido el archivo
        """    

        valor_a_devolver = self.__post_delete_trigger
        self.logGet(
            valor_a_devolver, 
            self.msg_delete_trigger,
            self.log_level)
            
        return valor_a_devolver


    def setPostDeleteTrigger(self                          , 
                          argumento     =   "Borrar"    ):
        """ Establecimiendo la opcion borrado una vez extraido el archivo
        """    

        variable_a_establecer = self.__post_delete_trigger

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_delete_trigger,
            self.log_level)

        self.__post_delete_trigger = argumento


    def getPostExitCode(self):
        """ Retorno del codigo de retorno de la funcion
        """    

        valor_a_devolver = self.__post_exit_code
        self.logGet(
            valor_a_devolver, 
            self.msg_exit_code,
            self.log_level)
            
        return valor_a_devolver


    def setPostExitCode(self                       , 
                        argumento         =   0    ):
        """ Establecimiendo el codigo de retorno de la funcion
        """    

        codigo_defecto = 0
        if argumento != codigo_defecto:
        
            variable_a_establecer = self.__post_exit_code
    
            self.logSet(
                variable_a_establecer , 
                argumento , 
                self.msg_exit_code,
                self.log_level)
    
            self.__post_exit_code = argumento


    def getPostExitStr(self):
        """ Retorno del codigo de retorno de la funcion
        """    

        valor_a_devolver = self.__post_exit_str
        self.logGet(
            valor_a_devolver, 
            self.msg_exit_str,
            self.log_level)
            
        return valor_a_devolver


    def setPostExitStr(self                       , 
                       argumento         =   "Proceso correcto"   ):
        """ Establecimiendo el codigo de retorno de la funcion
            Debe sobrescribir siempre que no tenga algo distinto
        """    

        mensaje_defecto = "Proceso correcto"
        if argumento != mensaje_defecto:

            variable_a_establecer = self.__post_exit_str
    
            self.logSet(
                variable_a_establecer , 
                argumento , 
                self.msg_exit_str,
                self.log_level)
    
            self.__post_exit_str = argumento



#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
