#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
@pythonver: 3.3
-----------------------------------------------------------
+ Clases definidas      : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- RulesMsg          - Clase de gestion de mensajes de reglas
-----------------------------------------------------------
-+ Clases heredadas     : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- getsetGen         - Clase de get y sets
-----------------------------------------------------------
-+ Metodos definidos    : 
-----------------------------------------------------------
- init_msg_rules        - Inicializa mensajes para reglas
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- Ninguna
===========================================================
+ Process Status  : [130605]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [3] [_] [5]
===========================================================
"""

#- Importacion de clases

from oo_getsetgen import getsetGen


class RulesMsg(getsetGen):

    #-Variable estatica para indicar el nombre de la clase
    __cls                           = "RulesMsg"
    __mth                           = ""    
    __log_level                     = 0
    __log_class_level               = 0

    __log_show                      = "screen"
    __log_file                      = ""    # Log file por defecto
    __log_file_alt                  = ""    # Log file alterno

    #-Literales para impresion de log genericos
    msg_rul                         = "Lanzando Regla"
    msg_rul_fich                    = "desde fichero de reglas"


    #-Atributos post proceso

    msg_rul_correlid                = "Correlid" 
    msg_rul_sender                  = "Sender"
    msg_rul_source_filename         = "Source FileName"         
    msg_rul_destination_filename    = "Destination FileName"    
    msg_rul_directorio              = "Directorio"
    msg_rul_sobreescritura          = "Sobrescritura"           
    msg_rul_caracteres              = "Caracteres"              
    msg_rul_extraccion              = "Extraccion"              
    msg_rul_postproceso             = "Postproceso"             
    msg_rul_postargs                = "Argumentos Postproceso"  
    msg_rul_compresion              = "Compresion en Acq - Recepcion"    
    msg_rul_trigger                 = "Trigger o Bandera"       
    msg_rul_copydup                 = "CopyDup - Gestion de duplicados"       


    #-Atributos pre proceso

    msg_rul_queue_manager           = "Queue Manager" 
    msg_rul_queue                   = "Queue" 
    msg_rul_user_class              = "Clase de Usuario" 
    msg_rul_description             = "Description" 
    msg_rul_standard                = "Standard" 
    msg_rul_compressor              = "Compressor en Dsp - Envio" 
    msg_rul_backup_dir              = "Directoro Backup" 
    msg_rul_user                    = "User" 
    msg_rul_passwd                  = "Passwd" 

    #- Atributos generales

    msg_rul_file_name               = "Nombre fichero de reglas" 
    msg_rul_correl_id_tuple         = "Tupla Correlid. Clave de filtro." 
    

    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                       , 
                 log_level              =   0               ,
                 log_class_level        =   0               ,
                 log_show               =   "screen"        ,
                 log_file               =   ""              ,
                 log_size               =   1000000         ):

        """ Constructor de mensajes de reglas
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


        getsetGen.__init__(self                 , 
                           log_level            ,
                           log_class_level      ,
                           log_show             ,
                           log_file             ,
                           log_size             )

        #- Acciones constructor
        
        self.init_msg_rules()


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
              texto         =   ""          ,
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


    def init_msg_rules(self):
        """ Inicializa las variables de reglas
        """
        #- Variables post proceso

        self.msg_rul_correlid           = \
            self.msg_rul_correlid               + self.sep + self.msg_rul_fich
        self.msg_rul_sender             = \
            self.msg_rul_sender                 + self.sep + self.msg_rul_fich
        self.msg_rul_destfilename       = \
            self.msg_rul_destination_filename   + self.sep + self.msg_rul_fich
        self.msg_rul_directorio         = \
            self.msg_rul_directorio             + self.sep + self.msg_rul_fich
        self.msg_rul_sobreescritura     = \
            self.msg_rul_sobreescritura         + self.sep + self.msg_rul_fich
        self.msg_rul_caracteres         = \
            self.msg_rul_caracteres             + self.sep + self.msg_rul_fich
        self.msg_rul_extraccion         = \
            self.msg_rul_extraccion             + self.sep + self.msg_rul_fich
        self.msg_rul_postproceso        = \
            self.msg_rul_postproceso            + self.sep +  self.msg_rul_fich
        self.msg_rul_postargs           = \
            self.msg_rul_postargs               + self.sep + self.msg_rul_fich
        self.msg_rul_compresion         = \
            self.msg_rul_compresion             + self.sep + self.msg_rul_fich
        self.msg_rul_trigger            = \
            self.msg_rul_trigger                + self.sep + self.msg_rul_fich

        #- Variables pre proceso    
        #-- no se si es necesario esto

        self.msg_queue_manager            = \
            self.msg_rul_queue_manager  + self.sep + self.msg_rul_fich


#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=



