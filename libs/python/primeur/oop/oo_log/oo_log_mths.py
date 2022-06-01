#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.5
-----------------------------------------------------------
+ Clases definidas          : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- LogMths             - Clase de metodos generales de logs
-----------------------------------------------------------
-+ Clases heredadas         : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- LogEst              - Clase de estructura de los logs
-----------------------------------------------------------
-+ Metodos definidos        : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- sInfoConstructor    - Prepara el mensaje del constructor      
-----------------------------------------------------------
- LogInitConstructor  - Mensaje de inicio del constructor      
-----------------------------------------------------------
- LogEndConstructor   - Mensaje de fin del constructor      
-----------------------------------------------------------
- LogInitMethod       - Mensaje de inicio del metodo      
-----------------------------------------------------------
- LogEndMethod        - Mensaje de fin del metodo      
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- Ninguna
===========================================================
+ Process Status  : [130624]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [3] [4] [_]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [4] [_]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [3] [4] [_]
-----------------------------------------------------------
#- Just           : [0] [1] [3] [3] [4] [_]
===========================================================
"""


#- Importacion de clases heradadas

from oo_log_est import LogEst


class LogMths(LogEst):

    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------

    def __init__(self                           , 
                 log_level          = 0         ,
                 log_class_level    = 0         ,
                 log_show           = ""        ,
                 log_file           = ""        ,
                 log_size           = 1000000   ):
        """ Constructor de la clase de logs de Metodos
        """

        LogEst.__init__(self                    , 
                        log_level               ,
                        log_class_level         ,
                        log_show                ,
                        log_file                ,
                        log_size                )                


    def sInfoConstructor(self           ,
                         cls        = ""):
        """ Prepara el mensaje de constructor
        """

        self.msg =  self.msg_literal_clase  + self.sep +    \
                    cls                     + self.sep +    \
                    self.msg_literal_init
       

    
    def LogInitConstructor(self                             ,          
                           log_level            =   0       ,
                           log_class_level      =   0       ,
                           log_show             = "file"    ):
        """ Metodo para presentar el inicio del constructor
            Nivel de log superior a 60        
        """
        cls = self.dlines
        mth = self.lines

        dec = "simple_simple"

        log_level = self.get_log_level()
        
        if log_level > 60:
            self.log(self.s_cls                     , 
                     self.bline                     ,
                     cls                            ,
                     mth                            ,
                     dec                            ,
                     log_level                      ,
                     log_class_level                ,
                     log_show                       )        


    def LogEndConstructor(self):
        """ Metodo para presentar el final del constructor
            Nivel de log superior a 60        
        """
        cls = self.dlines
        mth = self.lines

        log_level = self.get_log_level()
        
        if log_level > 60:
            self.log(self.e_cls                     , 
                     self.bline                     ,
                     cls                            ,
                     mth                            )        


    def LogInitMethod(self                          ,
                      cls       =   "init"          ):
        """ Mensaje de inicio de metodo
            Nivel de log superior a 70        
        """
        mth = self.lines

        log_level = self.get_log_level()
        
        if log_level > 70:
            self.log(self.s_mth                     , 
                     self.bline                     ,
                     cls                            ,
                     mth                            )        


    def LogEndMethod(self                           ,
                     cls        = "init"            ):
        """ Mensaje de final de metodo
            Nivel de log superior a 70        
        """
        mth = self.lines

        log_level = self.get_log_level()
        
        if log_level > 70:
            self.log(self.e_mth                     , 
                     self.bline                     ,
                     cls                            ,
                     mth                            )        

            
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

