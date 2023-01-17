#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.4
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- SpazioEst   : Clase de estructuras de Spazio
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- SpazioMsg   : Clase de mensajeria para Spazio
-----------------------------------------------------------
-+ Clases utilizadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- Split       : Clase de parseo de subcadenas
-----------------------------------------------------------
-+ Metodos definidos            : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- get/setQmName                 - Gestor de colas
-----------------------------------------------------------
- get/setQueue                  - Cola
-----------------------------------------------------------
- get/setNumInt                 - Numint
-----------------------------------------------------------
- get/setDestinationFileName    - Destination FileName
-----------------------------------------------------------
- get/setDestinationFileNameNoExt
-----------------------------------------------------------
- get/setCleanDestinationFileName
-----------------------------------------------------------
- ge/settSourceFileName         - Source FileName
-----------------------------------------------------------
- get/setSourceFileNameNoExt
-----------------------------------------------------------
- get/setRulesFileName          - Fichero de reglas
-----------------------------------------------------------
- get/setExistRulesFile         - Existencia fichero de reglas
-----------------------------------------------------------
- get/setCorrelId               - Correlation Id
-----------------------------------------------------------
- get/setSender                 - Emisor
-----------------------------------------------------------
- get/setDirectory              - Directorio
-----------------------------------------------------------
- get/setDescription            - Descripcion
-----------------------------------------------------------
- Faltan
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- Ninguna
===========================================================
+ Process Statuss : [130605]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [3] [_] [5]
===========================================================
"""

#- Importacion de clases Heredadas

from oo_spazio_msg import SpazioMsg

#- Importacion de clases Utilizadas

from oo_split import Split


class SpazioEst(SpazioMsg):

    #-Variable estatica para indicar el nombre de la clase
    __cls                           = "SpazioEst"
    __mth                           = ""    
    __log_level                     = 0
    __log_class_level               = 0


    __log_show                      = "screen"
    __log_file                      = ""    # Log file por defecto
    __log_file_alt                  = ""    # Log file alterno
    __log_file_err          = ""    # Log file de error

    #-Atributos internas propias de Spazio
    __destination_filename          = ""
    __source_filename               = ""
    __destination_filename_no_ext   = ""
    __source_filename_no_ext        = ""

    __clean_destination_filename    = ""    # DF limpio - antes de lanzar reglas

    __qmname                        = ""
    __queue                         = ""
    __numint                        = ""
    __correl_id                     = ""
    __sender                        = ""
    __directory                     = ""
    __modality                      = ""
        
    
    __extraccion                    = ""
    __sobrescritura                 = ""
    __compress                      = ""
    __description                   = ""
    __trigger                       = ""

    #-Atributos duplicados

    __copydup                       = ""
    __delete_file                   = ""    #- Indica si se debe borrar el 
                                            #  fichero una vez extraido
    __post_process                  = ""
    __post_process_args             = ""

    __correl_id_tuple               = ""
    __rules_file                    = ""
    __exist_rules_file              = False

    #-Atributos publicos FileList
    __nod                           = ""
    __csv                           = ""
    __banner                        = ""

    #-Atributos pre proceso
    __user                          = ""
    __passwd                        = ""
    __config_file                   = ""
    __user_class                    = ""
    __standard                      = ""
    __compressor                    = ""
    __backup_dir                    = ""

    __modification_time             = ""    
    __result                        = ""
    __result_str                    = ""

    #-Atributos Spev

    __sess_id                       = ""
    __spev_type                     = ""



    
    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                   , 
                 qmname                 =   ""          , 
                 queue                  =   ""          , 
                 numint                 =   ""          , 
                 log_level              =   0           ,
                 log_class_level        =   0           ,
                 log_show               =   "screen"    ,
                 log_file               =   ""          ,
                 log_file_err           =   ""          ,
                 log_size               =   1000000     ):
        """ Inicializa las estructuras para Spazio
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


        SpazioMsg.__init__(self                 , 
                           log_level            ,
                           log_class_level      ,
                           log_show             ,
                           log_file             ,
                           log_size             )


        #-- Acciones constructor
        #   Debemos construir el objeto
        self.setQmName  (   qmname  )
        self.setQueue   (   queue   )
        self.setNumInt  (   numint  )
##        self.setUser(user)
##        self.setPasswd(passwd)


        
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

    
    def getQmName(self, log_level = 0):
        """ Retorno del QmName - Nombre del Gestor de Colas
        """    

        valor_a_devolver = self.__qmname

        self.logGet(
            valor_a_devolver, 
            self.msg_qmname,
            self.log_level)

        return valor_a_devolver

    def setQmName(self, argumento):
        """ Establecimiento del nombre del gestor de colas
        """    

        variable_a_establecer = self.__qmname

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_qmname,
            self.log_level)
            
        self.__qmname = argumento


    def getQueue(self):
        """ Retorno del Queue - Nombre del la cola
        """    

        valor_a_devolver = self.__queue
        self.logGet(
            valor_a_devolver, 
            self.msg_queue,
            self.log_level)
        return valor_a_devolver

        
    def setQueue(self, argumento):
        """ Establecimiento del nombre de la cola
        """    

        variable_a_establecer = self.__queue
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_queue,
            self.log_level)

        self.__queue = argumento

    def getNumInt(self):
        """ Retorno del NumInt - Identificador del mensaje
        """    

        valor_a_devolver = self.__numint
        self.logGet(
            valor_a_devolver, 
            self.msg_numint,
            self.log_level)

        return valor_a_devolver


    def setNumInt(self, argumento):
        """ Establecimiento el Identificador del mensaje
        """    

        variable_a_establecer = self.__numint
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_numint,
            self.log_level)
            
        self.__numint = argumento

    def getDestinationFileName(self):
        """ Retorno del Destination FileName
        """    

        valor_a_devolver = self.__destination_filename
        self.logGet(
            valor_a_devolver, 
            self.msg_destination_filename,
            self.log_level)
            
        return valor_a_devolver


    def setDestinationFileName(self, argumento):
        """ Establecimiento del destination FileName
        """    

        variable_a_establecer = self.__destination_filename
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_destination_filename,
            self.log_level)

        self.__destination_filename = argumento


    def getCleanDestinationFileName(self):
        """ Retorno del Destination FileName
        """    

        valor_a_devolver = self.__clean_destination_filename
        self.logGet(
            valor_a_devolver, 
            self.msg_destination_filename,
            self.log_level)
            
        return valor_a_devolver


    def setCleanDestinationFileName(self, argumento):
        """ Establecimiento del destination FileName
        """    

        variable_a_establecer = self.__clean_destination_filename
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_destination_filename,
            self.log_level)

        self.__clean_destination_filename = argumento


    def getSourceFileName(self):
        """ Retorno del Source FileName
        """    

        valor_a_devolver = self.__source_filename
        self.logGet(
            valor_a_devolver, 
            self.msg_source_filename,
            self.log_level)
            
        return valor_a_devolver


    def setSourceFileName(self, argumento):
        """ Establecimiento del Source FileName
        """    

        variable_a_establecer = self.__source_filename
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_source_filename,
            self.log_level)

        self.__source_filename = argumento


    def getDestinationFileNameNoExt(self):
        """ Retorno del Destination FileName sin extension
        """    

        valor_a_devolver = self.__destination_filename_no_ext
        self.logGet(
            valor_a_devolver, 
            self.msg_destination_filename_no_ext,
            self.log_level)
            
        return valor_a_devolver


    def setDestinationFileNameNoExt(self):
        """ Establecimiento del destination FileName sin extension
        """    

        argumento               = self.getDestinationFileName()

        split_separator         = "\."
        output_separator        = "."
        log_level               = self.__log_level
        log_class_level         = self.__log_class_level
        log_show                = self.__log_show
        log_file                = self.__log_file


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

        self.__destination_filename_no_ext = \
            variable_a_establecer


    def getSourceFileNameNoExt(self):
        """ Retorno del Source FileName sin extension
        """    

        valor_a_devolver = self.__source_filename_no_ext
        self.logGet(
            valor_a_devolver, 
            self.msg_source_filename_no_ext,
            self.log_level)
            
        return valor_a_devolver


    def setSourceFileNameNoExt(self):
        """ Establecimiento del Source FileName sin extension
        """    

        argumento = self.getSourceFileName()

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

        cadena_sin_extension= splited_car.getFileNameNoExt()

        variable_a_establecer = cadena_sin_extension
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_source_filename_no_ext,
            self.log_level)

        self.__source_filename_no_ext = \
            variable_a_establecer


    def getRulesFileName(self):
        """ Retorno del fichero de reglas
        """    

        valor_a_devolver = self.__rules_file
        self.logGet(
            valor_a_devolver, 
            self.msg_rules_file,
            self.log_level)
            
        return valor_a_devolver


    def setRulesFileName(self, argumento):
        """ Establecimiento del fichero de reglas
        """    

        variable_a_establecer = self.__rules_file
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rules_file,
            self.log_level)

        self.__rules_file = argumento


    def getExistRulesFile(self):
        """ Retorno de la existencia del fichero de reglas
        """    

        valor_a_devolver = self.__exist_rules_file
        self.logGet(
            valor_a_devolver, 
            self.msg_rules_file,
            self.log_level)
            
        return valor_a_devolver


    def setExistRulesFile(self, argumento):
        """ Establecimiento de la existencia de fichero de reglas
        """    

        variable_a_establecer = self.__exist_rules_file
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_rules_file,
            self.log_level)

        self.__exist_rules_file = argumento



    def getCorrelId(self):
        """ Retorno del CorrelId - Identificador - pendiente - 
        """    

        valor_a_devolver = self.__correl_id
        self.logGet(
            valor_a_devolver, 
            self.msg_correl_id,
            self.log_level)
            
        return valor_a_devolver


    def setCorrelId(self, argumento):
        """ Establecimiento del correl id
        """    

        variable_a_establecer = self.__correl_id

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_correl_id,
            self.log_level)

        self.__correl_id = argumento

    def getSender(self):
        """ Retorno del Sender - Emisor
        """    

        valor_a_devolver = self.__sender

        self.logGet(
            valor_a_devolver, 
            self.msg_sender,
            self.log_level)

        return valor_a_devolver


    def setSender(self, argumento):
        """ Establecimiento del Sender
        """    


        variable_a_establecer = self.__sender
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_sender,
            self.log_level)

        self.__sender = argumento


    def getDirectory(self):
        """ Retorno del Directorio - Directorio temporal
        """    

        valor_a_devolver = self.__directory
        self.logGet(
            valor_a_devolver, 
            self.msg_directory,
            self.log_level)
            
        return valor_a_devolver


    def setDirectory(self, argumento):
        """ Establecimiendo el directorio del nombre del gestor de colas
        """    

        variable_a_establecer = self.__directory
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_directory,
            self.log_level)

        self.__directory = argumento

    def getDescription(self):
        """ Retorno del Directorio - Directorio temporal
        """    

        valor_a_devolver = self.__description
        self.logGet(
            valor_a_devolver, 
            self.msg_description,
            self.log_level)
            
        return valor_a_devolver


    def setDescription(self, argumento):
        """ Establecimiendo el directorio del nombre del gestor de colas
        """    

        variable_a_establecer = self.__description
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_description,
            self.log_level)

        self.__description = argumento


    def getModality(self):
        """ Retorno del Directorio - Directorio temporal
        """    

        valor_a_devolver = self.__modality
        self.logGet(
            valor_a_devolver, 
            self.msg_modality,
            self.log_level)
            
        return valor_a_devolver


    def setModality(self, argumento):
        """ Establecimiendo el directorio del nombre del gestor de colas
        """    

        variable_a_establecer = self.__modality
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_modality,
            self.log_level)

        self.__modality = argumento


    def getUserClass(self):
        """ Retorno de la clase de usuario
        """    

        valor_a_devolver = self.__user_class
        self.logGet(
            valor_a_devolver, 
            self.msg_user_class,
            self.log_level)
            
        return valor_a_devolver


    def setUserClass(self, argumento):
        """ Establecimiendo la clase de usuario
        """    

        variable_a_establecer = self.__user_class
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_user_class,
            self.log_level)

        self.__user_class = argumento



    def getCompressor(self):
        """ Retorno de la compreosion en origen
        """    

        valor_a_devolver = self.__compressor
        self.logGet(
            valor_a_devolver, 
            self.msg_compressor,
            self.log_level)
            
        return valor_a_devolver


    def setCompressor(self, argumento):
        """ Establecimiendo la compresion en origen
        """    

        variable_a_establecer = self.__compressor
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_compressor,
            self.log_level)

        self.__compressor = argumento



    def getStandard(self):
        """ Retorno del Directorio - Directorio temporal
        """    

        valor_a_devolver = self.__standard
        self.logGet(
            valor_a_devolver, 
            self.msg_standard,
            self.log_level)
            
        return valor_a_devolver


    def setStandard(self, argumento):
        """ Establecimiendo el directorio del nombre del gestor de colas
        """    

        variable_a_establecer = self.__standard
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_standard,
            self.log_level)

        self.__standard = argumento


    def getBackupDir(self):
        """ Retorno del Directorio - Directorio de backup
        """    

        valor_a_devolver = self.__backup_dir
        self.logGet(
            valor_a_devolver, 
            self.msg_backup_dir,
            self.log_level)
            
        return valor_a_devolver


    def setBackupDir(self, argumento):
        """ Establecimiendo el directorio de backup
        """    

        variable_a_establecer = self.__backup_dir
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_backup_dir,
            self.log_level)

        self.__backup_dir = argumento


    def getModificationTime(self):
        """ Retorno del tiempo de modificacion de archivos
        """    

        valor_a_devolver = self.__modification_time
        self.logGet(
            valor_a_devolver, 
            self.msg_modification_time,
            self.log_level)
            
        return valor_a_devolver


    def setModificationTime(self, argumento):
        """ Establecimiendo el tiempo de modificacion de archivos
        """    

        variable_a_establecer = self.__modification_time
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_modification_time,
            self.log_level)

        self.__modification_time = argumento


    def getResult(self):
        """ Retorno del resultado del proceso
        """    

        valor_a_devolver = self.__result
        self.logGet(
            valor_a_devolver, 
            self.msg_result,
            self.log_level)
            
        return valor_a_devolver


    def setResult(self, argumento):
        """ Establecimiendo el resultado del proceso
        """    

        variable_a_establecer = self.__result
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_result,
            self.log_level)

        self.__result = argumento



    def getResultStr(self):
        """ Retorno del resultado del proceso
        """    

        valor_a_devolver = self.__result_str
        self.logGet(
            valor_a_devolver, 
            self.msg_result,
            self.log_level)
            
        return valor_a_devolver


    def setResultStr(self, resultado = 0):
        """ Establecimiendo el resultado del proceso
        """    
        Fich_Modif="Fichero modificado en tiempo"
        Fich_NoModif="Fichero no modificado en tiempo"

        if resultado == 0:
            argumento = Fich_Modif
        else:
            argumento = Fich_NoModif

        variable_a_establecer = self.__result_str
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_result,
            self.log_level)

        self.__result_str = argumento

    def getUser(self):
        """ Retorno del Usuario
        """    

        valor_a_devolver = self.__user
        self.logGet(
            valor_a_devolver, 
            self.msg_user,
            self.log_level)
            
        return valor_a_devolver


    def setUser(self, argumento):
        """ Establecimiendo el usuario
        """    

        variable_a_establecer = self.__user
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_user,
            self.log_level)

        self.__user = argumento


    def getPasswd(self):
        """ Retorno de la clave
        """    

        valor_a_devolver = self.__passwd
        self.logGet(
            valor_a_devolver, 
            self.msg_passwd,
            self.log_level)
            
        return valor_a_devolver


    def setPasswd(self, argumento):
        """ Establecimiendo la clave
        """    

        variable_a_establecer = self.__passwd
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_passwd,
            self.log_level)

        self.__passwd = argumento


    def getConfigFile(self):
        """ Retorno del Fichero de configuracion
        """    

        valor_a_devolver = self.__config_file
        self.logGet(
            valor_a_devolver, 
            self.msg_config_file,
            self.log_level)
            
        return valor_a_devolver


    def setConfigFile(self, argumento):
        """ Establecimiendo el fichero de configuracion
        """    

        variable_a_establecer = self.__config_file
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_modality,
            self.log_level)

        self.__config_file = argumento


    def getPostProcess(self):
        """ Retorno del post proceso
        """    

        valor_a_devolver = self.__post_process
        self.logGet(
            valor_a_devolver, 
            self.msg_post_process,
            self.log_level)
            
        return valor_a_devolver


    def setPostProcess(self, argumento):
        """ Establecimiendo el post proceso
        """    

        variable_a_establecer = self.__post_process
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_post_process,
            self.log_level)

        self.__post_process = argumento


    def getPostProcessArgs(self):
        """ Retorno de los argumentos del post proceso
        """    

        valor_a_devolver = self.__post_process_args
        self.logGet(
            valor_a_devolver, 
            self.msg_post_process_args,
            self.log_level)
            
        return valor_a_devolver


    def setPostProcessArgs(self, argumento):
        """ Establecimiendo los argumentos del post proceso
        """    

        variable_a_establecer = self.__post_process_args
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_post_process_args,
            self.log_level)

        self.__post_process_args = argumento


    def getTrigger(self):
        """ Retorno del la bandera
        """    

        valor_a_devolver = self.__trigger
        self.logGet(
            valor_a_devolver, 
            self.msg_trigger,
            self.log_level)
            
        return valor_a_devolver


    def setTrigger(self, argumento):
        """ Establecimiendo la bandera
        """    

        variable_a_establecer = self.__trigger
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_trigger,
            self.log_level)

        self.__trigger = argumento


    def getCompress(self):
        """ Retorno del metodo de compresion en recepcion - ack
        """    

        valor_a_devolver = self.__compress
        self.logGet(
            valor_a_devolver, 
            self.msg_compress,
            self.log_level)
            
        return valor_a_devolver


    def setCompress(self, argumento):
        """ Establecimiendo el metodo de compresion en recepcion - ack
        """    

        variable_a_establecer = self.__compress
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_compress,
            self.log_level)

        self.__compress = argumento

    
    def getCorrelIdTuple(self):
        """ Retorno de la tupla Correl Id usada para filtrar las reglas
        """    

        valor_a_devolver = self.__correl_id_tuple

        self.logGet(
            valor_a_devolver, 
            self.msg_tuple_correl_id,
            self.log_level)
            
        return valor_a_devolver


    def setCorrelIdTuple(self, argumento):
        """ Establecimiento de la tupla Correl Id
        """    

        variable_a_establecer = self.__correl_id_tuple
        
        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_tuple_correl_id,
            self.log_level)

        self.__correl_id_tuple = argumento

    def getExtraccion(self):
        """ Retorno del metodo de Extraccion
        """    

        valor_a_devolver = self.__extraccion
        self.logGet(
            valor_a_devolver, 
            self.msg_extraccion,
            self.log_level)
            
        return valor_a_devolver

    def setExtraccion(self, argumento):
        """ Establecimiendo metodo de Extraccion
        """    
        variable_a_establecer = self.__extraccion 

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_extraccion,
            self.log_level)

        self.__extraccion = argumento


    def getSobrescritura(self):
        """ Retorno de la sobrescritura
        """    

        valor_a_devolver = self.__sobrescritura
        self.logGet(
            valor_a_devolver, 
            self.msg_sobrescritura,
            self.log_level)
            
        return valor_a_devolver


    def setSobrescritura(self, argumento):
        """ Establecimiendo la sobrescritura
        """    

        variable_a_establecer = self.__sobrescritura 

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_sobrescritura,
            self.log_level)

        self.__sobrescritura = argumento


    def getCopyDup(self):
        """ Retorno de la opcion de duplicado
        """    

        valor_a_devolver = self.__copydup
        self.logGet(
            valor_a_devolver, 
            self.msg_copydup,
            self.log_level)
            
        return valor_a_devolver


    def setCopyDup(self, argumento):
        """ Establecimiendo la opcion de duplicado
        """    

        variable_a_establecer = self.__copydup

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_copydup,
            self.log_level)

        self.__copydup = argumento


    def getDeleteFile(self):
        """ Retorno de la opcion de borrado una vez extraido el archivo
        """    

        valor_a_devolver = self.__delete_file
        self.logGet(
            valor_a_devolver, 
            self.msg_delete_file,
            self.log_level)
            
        return valor_a_devolver


    def setDeleteFile(self                      , 
                      argumento = "Delete"      ):
        """ Establecimiendo la opcion borrado una vez extraido el archivo
        """    

        variable_a_establecer = self.__delete_file

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_delete_file,
            self.log_level)

        self.__delete_file = argumento


    def getNod(self):
        """ Retorno del Nod
        """    

        valor_a_devolver = self.__nod
        self.logGet(
            valor_a_devolver, 
            self.msg_nod,
            self.log_level)
            
        return valor_a_devolver

    def setNod(self, argumento):
        """ Establecimiendo el Nod
        """    

        variable_a_establecer = self.__nod 

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_nod,
            self.log_level)

        self.__nod = argumento

    def getCsv(self):
        """ Retorno del Csv
        """    

        valor_a_devolver = self.__csv
        self.logGet(
            valor_a_devolver, 
            self.msg_csv,
            self.log_level)
            
        return valor_a_devolver

    def setCsv(self, argumento):
        """ Establecimiento Csv
        """    

        variable_a_establecer = self.__csv 


        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_csv,
            self.log_level)

        self.__csv = argumento


    def getBanner(self):
        """ Retorno de Banner - Filelist
        """    

        valor_a_devolver = self.__banner
        self.logGet(
            valor_a_devolver, 
            self.msg_banner,
            self.log_level)
            
        return valor_a_devolver

    def setBanner(self, argumento):
        """ Establecimiento de Banner
        """    

        variable_a_establecer = self.__banner

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_banner,
            self.log_level)

        self.__banner = argumento

    #---=------=------=------=------=------=------=------=------=------=---
    #  F U N C I O N E S   S P E V 
    #---=------=------=------=------=------=------=------=------=------=---


    def getSessId(self):
        """ Retorno de SessId - Spev
        """    

        valor_a_devolver = self.__sess_id
        self.logGet(
            valor_a_devolver, 
            self.msg_sess_id,
            self.log_level)
            
        return valor_a_devolver

    def setSessId(self, argumento):
        """ Establecimiento de Banner
        """    

        variable_a_establecer = self.__sess_id

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_sess_id,
            self.log_level)

        self.__sess_id = argumento


    def getSpevType(self):
        """ Retorno de SessId - Spev
        """    

        valor_a_devolver = self.__spev_type
        self.logGet(
            valor_a_devolver        , 
            self.msg_spev_type      ,
            self.log_level          )
            
        return valor_a_devolver


    def setSpevType(self, argumento):
        """ Establecimiento de Banner
        """    

        variable_a_establecer = self.__spev_type

        self.logSet(
            variable_a_establecer   , 
            argumento               , 
            self.msg_spev_type      ,
            self.log_level          )

        self.__spev_type = argumento


    def getLogShow(self):
        """ Retorno del metodo de Extraccion
        """    

        valor_a_devolver = self.__log_show
        
        self.logGet(
            valor_a_devolver, 
            self.msg_log_show,
            self.log_level)
            
        return valor_a_devolver

    def setLogShow(self, argumento):
        """ Establecimiendo metodo de Extraccion
        """    

        variable_a_establecer = self.__log_show 

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_log_show,
            self.log_level)

        self.__log_show = argumento

    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

## qm = "Gestor"
## q  = "Cola"
## n  = "numint"
## df = "destination_filename_brqx"
## co = "correl_id"
## se = "sender"
## rt = "ruta_temporal"
## L  = "LOG_SHOW"
## ll = 30

## ej = Spazio(qm,q,n,
##             df,co,se,rt,L , re, ll)

## ej.setQmName("Pepe")
## print (ej.getDestinationFileName()	)