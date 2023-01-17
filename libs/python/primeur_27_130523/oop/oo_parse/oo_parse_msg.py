#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- ParseMsg   : Clase de mensajeria para el parseo
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- getsetGen  : Clase generica de get y set
-----------------------------------------------------------
-+ Clases utilizadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- Ninguna
-----------------------------------------------------------
-+ Metodos implemantados : 
-----------------------------------------------------------
- Init
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
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
#- Quality        : [0] [1] [2] [3] [4] [_]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [3] [4] [_]
===========================================================
"""

#- Importacion de clases

from oo_getsetgen import getsetGen


class ParseMsg(getsetGen):

    #-Variable estatica para indicar el nombre de la clase
    __cls               = "ParseEst"
    __mth               = ""    
    __log_level         = 0
    __log_class_level   = 0


    #-Atributos publicos principales
    msg_parse_cadena                        = "Cadena a parsear"

    #-Atributos publicos secundarios
    msg_parse_fecha                         = "Fecha del sistema"
    msg_parse_fecha_hora                    = "Fecha y hora del sistema"
    msg_parse_mascara_fecha                 = "Mascara de fecha"
    msg_parse_source_filename               = "Nombre origen"
    msg_parse_destination_filename          = "Nombre destino"
    msg_parse_source_filename_no_ext        = "No poner extension en nombre origen"
    msg_parse_destination_filename_no_ext   = "No poner extension en nombre destino"
    msg_parse_description                   = "Descripcion"

    msg_parse_qmname                        = "Gestor de Colas"
    msg_parse_queue                         = "Cola"
    msg_parse_numint                        = "Numint"
    msg_parse_correl_id                     = "Correl Id"
    msg_parse_sender                        = "Sender"
    msg_parse_directory                     = "Directorio destino"

    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                               , 
                 log_level          =   0           ,
                 log_class_level    =   0           ,
                 log_show           =   "screen"    ):
        """ Constructor de mensajes para el parseo
        """

        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level
        
        getsetGen.__init__(self, 
                           log_level, 
                           log_class_level)


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
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

