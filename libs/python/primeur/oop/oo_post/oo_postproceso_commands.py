#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.4
@pythonver: 3.3
-----------------------------------------------------------
+ Clases definidas              : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- PostProcesoCmd            - Clase de comandos de post proceso
-----------------------------------------------------------
-+ Clases heredadas             : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- getsetGen                 - Clase de get y sets
-----------------------------------------------------------
-+ Clases utilizadas            : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- LightFile                 - Clase de get y sets
-----------------------------------------------------------
-+ Metodos definidos            : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- createCompressCommandGzip     - Genera fichero Gzip
-----------------------------------------------------------
- createCompressCommandZip      - Genera fichero Zip
-----------------------------------------------------------
- createCompressCommandTarGz    - Genera fichero Tar.gz
-----------------------------------------------------------
- deleteFileCheck               - Check de borrado
-----------------------------------------------------------
- createTrigger                 - Genera bandera
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- Ninguna
===========================================================
+ Process Status  : [130621]
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

#- Importacion de clases utilizadas
from oo_lightfile import LightFile


#- Importacion de clases heredadas

from oo_getsetgen import getsetGen

#- Importacion de librerias del sistema

##import os

class PostProcesoCmd(getsetGen):

    #-Variable estatica para indicar el nombre de la clase
    __cls                   = "PostProcesoCmd"
    __mth                   = ""    
    __log_level             = 0
    __log_class_level       = 0

    __log_show              = "screen"
    __log_file              = ""    # Log file por defecto
    __log_file_alt          = ""    # Log file alterno
    __log_file_err          = ""    # Log file de error

    
    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                       , 
                 log_level              =   0               ,
                 log_class_level        =   0               ,
                 log_show               =   "screen"        ,
                 log_file               =   ""              ,
                 log_file_err           =   ""              ,
                 log_size               =   1000000         ):
        """ Constructor de comandos de postproceso
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
        self.__log_show         =   log_show

        self.__log_file         =   log_file
        self.__log_file_err     =   log_file_err

    
        getsetGen.__init__(self                     ,
                           log_level                ,
                           log_class_level          ,
                           log_show                 ,
                           log_file                 ,
                           log_size                 )


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


    def createCompressCommandGzip(self,
                              fich_name         = ""    , 
                              fich_name_no_ext  = ""    ):
        """ Genera el comando para comprimir gzip
        """        

        mth = "createCompressCommandGzip"
        self.LogInitMethod(self.__cls)

        up_format_file_sin_punto = "gz"
        up_format_file_con_punto = ".gz"

        sep_commands = " "
        fich_compress = ""
        full_command = ""

        command         = "gzip"


        #-Si la extension del fichero ya es GZ no hacemos nada
            #-Entonces hay que comprimir 
            #-gzip automaticamente cambia la extension por gz

        fich_compress = fich_name + up_format_file_con_punto
    
        full_command = command + sep_commands +   \
                       fich_name

        self.__Log("Fichero compresion", fich_compress  , mth)
        self.__Log("Orden comando"     , full_command   , mth)

        
        self.LogEndMethod(self.__cls)

        return full_command


    def createCompressCommandZip(self,
                              fich_name         = ""    , 
                              fich_name_no_ext  = ""    ):
        """ Genera el comando Zip
        """        
        mth = "createCompressCommandZip"
        self.LogInitMethod(self.__cls)

        up_format_file_sin_punto = "zip"
        up_format_file_con_punto = ".zip"

        sep_commands = " "
        fich_compress = ""
        full_command = ""

        command         = "zip -D"

        #- Si se ha comprimido en origen 
        #  no podemos hacer nada, comprimimos de nuevo

        #-Ojo que hay que poner la ruta larga
        #- zip -D /brqx/arqui... nDO.dat.zip /brqx/arquitectura/unix/libs/python/primeur/oop/oo_post/COManDO.dat PostProcesoCmd_creatCompressCommandZip-

        #-Necesitamso el basename del fichero


        #-- NoHay que ir a la ruta y comprimir alli y volver
##        ruta_fichero = os.path.dirname (fich_name)    
##        ruta_actual  = os.getcwd()
        

##        fich_sin_ruta = os.path.basename(fich_name)
            
        fich_compress = fich_name + up_format_file_con_punto
   
    
        full_command = command          + sep_commands  +   \
                       fich_compress    + sep_commands  +   \
                       fich_name
            
        self.__Log("Fichero compresion"   , fich_compress   , mth)
        self.__Log("Orden comando"        , full_command    , mth)
            

        self.LogEndMethod(self.__cls)
        return full_command


    def createCompressCommandTarGz(self                 ,
                                   fich_name = ""       ):
        """ Genera el comando Tar.Gz
        """        
        sep_files       = "."
        sep_commands    = " "
        fich_compress   = ""
        full_command    = ""
            
        command         = "tar zcpvf"
        ext_compress    = "tar.gz"

        fich_compress = fich_name + sep_files + ext_compress
    
        full_command = command          + sep_commands  +    \
                       fich_compress    + sep_commands  +    \
                       fich_name

        
        return full_command


    def deleteFileCheck(self                    , 
                        format_file = "zip"     ):
        """ Informa si borra el archvio
        """        
        borrado = ""

        if format_file.upper()      == "ZIP":
            borrado = "zip"
        elif format_file.upper()    == "GZ":
            #- No se borra
            borrado = ""

        elif format_file.upper()    == "TAR.GZ":
            borrado = ""

        return borrado


    def createTrigger(self, fich_name):
        """ Genera el trigger
        """        

        mth="createTrigger"
        self.LogInitMethod(self.__cls)

        fich = LightFile()

        self.__Log("Creando trigger" , fich_name    , mth)
        fich.createFile(fich_name)       

##      Logear que ha creado la bandera
        
##        print fich_name

        self.LogEndMethod(self.__cls)

    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

