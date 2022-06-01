#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.4
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Compress          - Clase de Ficheros
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- CompressEst       - Clase de estructura de compresion
-----------------------------------------------------------
- CompressUtl       - Clase de utilidades de compresion
-----------------------------------------------------------
- LightFile         - Clase agil de gestion de ficheros
-----------------------------------------------------------
-+ Metodos definidos : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- gzip                  - Comprime en formato GZ
-----------------------------------------------------------
- zzip                  - Comprime en formato ZIP
-----------------------------------------------------------
- processCompress       - Ejecuta la compresion
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
--=----=----=----=----=----=----=----=----=----=----=----=-
- shutil
-----------------------------------------------------------
- os
-----------------------------------------------------------
- datetime
-----------------------------------------------------------
- gzip
-----------------------------------------------------------
- zipfile
===========================================================
+ Process Status  : [130621]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [3] [4] [_]
===========================================================
"""

#- Importacion de librerias del sistema

import os 
import shutil

import gzip

import zipfile

#- Importacion de clases heredadas

from oo_compress_est import CompressEst

from oo_compress_utils import CompressUtl

from oo_lightfile import LightFile



class Compress(CompressEst          , 
               CompressUtl          , 
               LightFile            ):

    #-Variable estatica para indicar el nombre de la clase
    __cls                   = "Compress"
    __mth                   = ""    
    __log_level             = 0
    __log_class_level       = 0

    __log_show              = "screen"
    __log_file              = ""    # Log file por defecto
    __log_file_alt          = ""    # Log file alterno

    __log_file_err          = ""    # Log file de error


    #- Python 2.7
    ##    __f                     = file    # Fichero

    #- Python 3.3
    __f_in                  = ""    #-- Fichero de entrada
    __f_out                 = ""    #-- Fichero de Salida

    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------

    def __init__(self                                   , 
                 source_filename        =   ""          ,
                 compress_filename      =   ""          ,
                 compress_format        =   ""          ,
                 log_level              =   0           ,
                 log_class_level        =   0           ,
                 log_show               =   "screen"    ,
                 log_file               =   ""          ,
                 log_file_err           =   ""          ,
                 log_size               =   1000000     ):
        """ Constructor de compresion
        """

        mth = "init"
        
        #- Establecimiento nivel de log
        self.__log_level        =   log_level

        self.LogInitConstructor(log_level           , 
                                log_class_level     , 
                                log_show            )

        log_class_level         =   log_class_level + 1        

        self.__log_class_level  = log_class_level

        #-Estableciendo fichero de log
        self.__log_show         =   log_show

        self.__log_file         =   log_file
        self.__log_file_err     =   log_file_err  


        CompressEst.__init__(self                   , 
                            source_filename         ,
                            compress_filename       ,
                            compress_format         ,
                            log_level               , 
                            log_class_level         ,
                            log_show                ,
                            log_file                ,
                            log_file_err            ,
                            log_size                )


        CompressUtl.__init__(self                   , 
                            log_level               , 
                            log_class_level         ,
                            log_show                ,
                            log_file                ,
                            log_size                )

       
        self.checkFile(source_filename)


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
    def __Log(self                              ,
              texto                             ,
              valor         =   ""              ,
              mth           =   "init"          ,
              dec           =   "normal"        ):
        """ Log de la clase para traza
        """        

        self.__log_file_alt  = self.__log_file

        self.__LogAlt(texto                     ,
                      valor                     ,
                      mth                       ,
                      dec                       )


    #-Clase de log de error
    def __ErrLog(self                           ,
              texto                             ,
              valor         =   ""              ,
              mth           =   "init"          ,
              dec           =   "normal"        ):
        """ Log de la clase para error
        """        
        self.__log_file_alt  = self.__log_file_err

        self.__LogAlt(texto                     ,
                      valor                     ,
                      mth                       ,
                      dec                       )


    def gzip(self                           ,
             nombre_fichero     = ""        ,
             nombre_gzip        = ""        ):
        """ Comprime un fichero con gzip
        """
        mth = "gzip"

        if nombre_fichero   == "":
            nombre_fichero  = self.getSourceFileName()

        if nombre_gzip      == "":
            nombre_gzip     = self.getCompressFileName()

        self.__Log("Fichero a comprimir"            ,
                   nombre_fichero                   ,
                   mth                              ,
                   "simple_simple"                  )

        self.__Log("Nombre Fichero comprimido"      ,
                   nombre_gzip                   ,
                   mth                              ,
                   "simple_simple"                  )

        #-Comprueba si existe el fichero origen
        if self.open_file_code == 0:

           
    
            self.__f_in     =  open (nombre_fichero , 'rb')
    
            self.__f_out    =  gzip.open(nombre_gzip, 'wb')
        
            self.__f_out.writelines(self.__f_in)
            code_out = str(self.__f_out)
            ##         print ("Codigo " + code_out)
    
            self.__f_out.close()
            self.__f_in.close()
            shutil.copystat(nombre_fichero, nombre_gzip)   
   

#-- Compress zip

    def zzip(self                           ,
             nombre_fichero     = ""        ,
             nombre_gzip        = ""        ):
        """ Comprime un fichero con gzip

        """
        mth = "gzip"

        if nombre_fichero == "":
            nombre_fichero = self.getSourceFileName()

        if nombre_gzip == "":
            nombre_gzip = self.getCompressFileName()

        self.__Log("Fichero a comprimir"            ,
                   nombre_fichero                   ,
                   mth                              ,
                   "simple_simple"                  )

        self.__Log("Nombre Fichero comprimido"      ,
                   nombre_gzip                   ,
                   mth                              ,
                   "simple_simple"                  )

        #-Comprueba si existe el fichero origen
        if self.open_file_code == 0:

            self.__f_out    =  zipfile.ZipFile(nombre_gzip, 'w')
        
            zip_path = os.path.dirname(nombre_fichero)
            zip_file = os.path.basename(nombre_fichero)

            self.__Log("Path del fichero a comprimir"   ,
                       zip_path                         ,
                       mth                              ,
                       "double_simple"                  )

            self.__Log("Fichero a comprimir"            ,
                       zip_file                         ,
                       mth                              ,
                       "simple_simple"                  )


#            print ("Zip/path" + zip_path)
#            print ("Zip/path" + zip_file)
    
            current_path = os.getcwd()
    
            os.chdir(zip_path)

#            print ("Change paht" + os.getcwd() )
    
            self.__f_out.write(zip_file)
    
            self.__f_out.close()
    
            os.chdir(current_path)

            shutil.copystat(nombre_fichero, nombre_gzip)   


    def processCompress(self):
        """ Comprime un fichero con la extension definida
        """
        mth = "processCompress"

        source_filename     = self.getSourceFileName()
        compress_filename   = self.getCompressFileName()
        compress_format     = self.getCompressFormat()

        if source_filename != "":
            self.__Log("Fichero a comprimir"                                ,
                       source_filename                                      ,
                       mth                                                  ,
                       "simple_simple"                                      )

            if compress_filename != "":
                self.__Log("Nombre Fichero comprimido"                      ,
                           compress_filename                                ,
                           mth                                              ,
                           "simple_simple"                                  )

                if compress_format      == "ZIP":
                    self.zzip()
                elif compress_format    == "GZ":
                    self.gzip()                
                elif compress_format    == "GZIP":
                    self.gzip()                
                else:
                    self.__ErrLog("Formato no soportado"                    ,
                                  compress_format                           ,
                                  mth                                       ,
                                  "simple_simple"                           )

            else:
                self.__ErrLog("Nombre de fichero comprimido no pasado"      ,
                              compress_filename                             ,
                              mth                                           ,
                              "simple_simple"                               )
           
        else:
            self.__ErrLog("Error en fichero origen"                         ,
                          source_filename                                   ,
                          mth                                               ,
                          "simple_simple"                                   )

                       
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

## log_level = 30
## log_class_level = 0
## log_show = "screen"
## log_file = ""

## nombre_fichero     = "/brqx/arquitectura/unix/libs/python/primeur/" + \
##                      "oop/oo_compress/comandos.log"

## nombre_gzip        = "/brqx/arquitectura/unix/libs/python/primeur/" + \
##                      "oop/oo_compress/comandos.log.gz"


## nombre_zzip        = "/brqx/arquitectura/unix/libs/python/primeur/" + \
##                      "oop/oo_compress/comandos.log.zip"

## formato     = "gz"


## with open(nombre_fichero, 'rb') as f_in:
##     with gzip.open(nombre_gzip, 'wb') as f_out:
##         f_out.writelines(f_in)


## com = Compress(nombre_fichero   ,
##                nombre_gzip      ,
##                formato          ,
##                log_level        ,
##                log_class_level  ,
##                log_show         ,
##                log_file         )


## com2 = Compress(nombre_fichero   ,
##                nombre_zzip      ,
##                formato          ,
##                log_level        ,
##                log_class_level  ,
##                log_show         ,
##                log_file         )

## com.gzip()
## com2.zzip()

