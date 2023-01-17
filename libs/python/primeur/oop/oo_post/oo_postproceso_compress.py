#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.5
-----------------------------------------------------------
+ Clases definidas      : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- PostProceso   - Clase de Post Proceso
-----------------------------------------------------------
-+ Clases heredadas     : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- PostProcesoTrg        - Post proceso - Gestion de la bandera
-----------------------------------------------------------
-+ Clases utilizadas    : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- Compress              - Clase de compresion
-----------------------------------------------------------
- CompressUtl           - Clase de utilidades de compresion
-----------------------------------------------------------
- File                  - Clase de acceso a ficheros de reglas
-----------------------------------------------------------
-+ Metodos definidos    : 
-----------------------------------------------------------
- runCompress       - Procesador de la compresion
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- datetime
===========================================================
+ Process Status  : [130701]
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

#- Importacion de librerias del sistema

##import sys

#- Python 3.3


import datetime

#- Importacion de clases heredadas

from oo_postproceso_trg         import PostProcesoTrg

#- Importacion de clases utilizadas

from oo_file                    import File
from oo_compress                import Compress

from oo_compress_utils          import CompressUtl


class PostProcesoCompress(PostProcesoTrg):

    #-Variable estatica para indicar el nombre de la clase
    __cls                           =   "PostProcesoCompress"
    __mth                           =   ""    
    __log_level                     =   0
    __log_class_level               =   0
    __log_show                      =   "screen"

    __log_file                      =   ""    # Log file por defecto
    __log_file_err                  =   ""    # Log file de error

    __log_file_alt                  =   ""    # Log file por defecto

    
    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                       , 
                 dest_filename          =   ""              ,
                 directory              =   ""              ,
                 proceso                =   ""              ,  
                 compresion             =   "gz"            , 
                 trigger                =   "TRG"           ,
                 copydup                =   ""              ,
                 deletefile             =   ""              ,
                 log_level              =   0               ,
                 log_class_level        =   0               ,
                 log_show               =   "screen"        ,
                 log_file               =   ""              ,
                 log_file_err           =   ""              ,
                 log_size               =   1000000         ):
        """ Constructur del postproceso
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

   
        PostProcesoTrg.__init__(self    ,
                                dest_filename               ,
                                directory                   ,
                                proceso                     ,
                                compresion                  , 
                                trigger                     , 
                                copydup                     ,
                                deletefile                  ,
                                log_level                   ,
                                log_class_level             ,
                                log_show                    ,
                                log_file                    ,
                                log_file_err                ,
                                log_size                    )
  
        if log_level >log_class_level:
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


    def runCompress(self):
        """ Procesa la recepcion del archivo
            Comprime usando metodos de python
        """        
        mth = "runCompress"
        self.LogInitMethod(self.__cls)

        #-Establecemos codigo y mensaje de salida por defecto
        self.setPostExitCode()           
        self.setPostExitStr()           


        #-Informacion del fichero
        fich_destino        =  self.getPostDestinationFileName()
        fich_destino_no_ext =  self.getPostDestinationFileNameNoExt()
        extension_fich      =  self.getPostExt()
        directorio          =  self.getPostDirectory()

        #-Informacion del tipo de compresion    
        format_file         =  self.getPostCompress()
        up_format_file      =  format_file.upper()

        self.__Log("Formato Compresion"       , 
                   format_file         , mth)
        self.__Log("Fichero Destino"          , 
                   fich_destino        , mth)
        self.__Log("Fichero Destino no ext"   , 
                   fich_destino_no_ext , mth)
        self.__Log("Extension Fichero"        , 
                   extension_fich      , mth)

        self.__Log("Directorio"               , 
                   directorio          , mth)

               
        #-Fichero a componer en comando
        fich_name_no_ext = self.getPostDirectory()    + self.slash + \
                           fich_destino_no_ext 

    
        #-Fichero real extraido por filetdsp
        fich_name = self.getPostDirectory()     + self.slash + \
                    fich_destino 


        #-Preparamos el fichero por si hay duplicados
        fich_name_dup = self.getPostCopyDup()   + self.slash + \
                    fich_destino 

        self.__Log("Formato compresion pasado"                      , 
                   format_file                                      , 
                   mth                                              ,
                   "simple_simple"                                  )


        self.__Log("Nombre_fichero_destino con ruta absooluta"      , 
                   fich_name                                        , 
                   mth                                              ,
                   "double_alt"                                     )


        #-Establece el nombre completo del fichero
        self.setPostFullPathFileName(fich_name)


        utl_comp = CompressUtl()
        utl_comp.processDotExt(up_format_file)
        up_format_file_sin_punto = utl_comp.ext_without
              

        self.__Log("Formato compresion ajustado"        , 
                   up_format_file_sin_punto             , 
                   mth                                  ,
                   "simple_simple"                      )

        compress_file = ""
        log_level       = self.__log_level
        log_class_level = self.__log_class_level        
        log_show        = self.__log_show        
        log_file        = self.__log_file
        log_size        = self.get_log_size()

        #-Creamos la clase de compresion
        compress = Compress(fich_name                    , 
                            compress_file                ,
                            up_format_file_sin_punto     ,
                            log_level                    ,
                            log_class_level              ,
                            log_show                     ,
                            log_file                     ,
                            log_size                     )


        #- Procesa extension fichero comprimido
        compress_file = compress.processExtCompress(fich_name                   ,
                                                    up_format_file_sin_punto    )
        

        compress.setCompressFileName(compress_file)


        self.__Log("Nombre fichero comprimido"          , 
                   compress_file                        , 
                   mth                                  ,
                   "square_alt"                         )



        #-Aqui tenemos que tener en cuenta los duplicados
        
        regla_dup      =  self.getPostCopyDup()    
  
   
        if regla_dup    !=  "":
        #---=------=------=------=------=------=------=------=------=---            
        #   I N I C I O   Z O N A   D U P L I C A D O S
        #---=------=------=------=------=------=------=------=------=---            
            #- Indica que hay que verificar los duplicados
            #- Si la ruta existe hay que crear un timestamp

            self.__Log("Regla Duplicados activada"                 ,
                       regla_dup                                   , 
                       mth                                         ,
                       "simple_simple"                             )

            file_df = File(compress_file)
    
            dup_open_file_code      = file_df.getOpenFileCode()
            str_dup_open_file_code  = str(dup_open_file_code)
    
    
            self.__Log("Codigo retorno del fichero"         ,
                       str_dup_open_file_code               , 
                       mth                                  ,
                       "simple_simple"                      )

        
            if dup_open_file_code == 0:
                #- El fichero existe
                self.__Log("Fichero existente"                      ,
                           compress_file                            , 
                           mth                                      ,
                           "double_alt"                             )
    
    
                fecha_actual = datetime.datetime.now()        
                timestamp = fecha_actual.strftime('%Y%m%d%H%M%S')
    
                #-El timestamp hay que ponerlo antes de la extension de 
                # compresion
                #
                #- Ejemplo : fich_uno20130514031144.gz


                #- No se comprueba si existe el directorio        
                # Si el directorio que se indica en COPYDUP no existe el 
                # postproceso de extracción debe:
                # Reportar un error de ejecución, esto generará una alarma 
                # que hará que operaciones se ocupe de esta incidencia y 
                # la resuelva.
                # Extraer el fichero recibido de la cola a un directorio 
                # temporal $SPAZIO/temp y borrarlo después de la extracción, 
                # de otra manera generaría una alarma de fichero no extraído.    

                #- Implementacion : 
                #  Si el fichero existe se genera con timestamp y se copia a
                #  la ruta de duplicados o a la temporal                    
                

                self.setPostDirectory(regla_dup)
    
                directory_dup = File(regla_dup)
        
                dup_open_file_code      = directory_dup.getOpenFileCode()
                str_dup_open_file_code  = str(dup_open_file_code)
    
                if dup_open_file_code == 0:
                    #- El directorio existe
                    self.__Log("Ruta duplicados existe"         ,
                               regla_dup                        , 
                               mth                              ,
                               "double_alt"                     )


                    df_timestamp = fich_name_dup + timestamp
    
    
                    #- Generamos la extension correcta del fichero comprimido
                    compress_file = compress.processExtCompress(
                                        df_timestamp                ,
                                        up_format_file_sin_punto    )
        
    
                    self.__Log("Fichero con timestamp a generar"                ,
                               compress_file                                    , 
                               mth                                              ,    
                               "double_alt"                                     )
    
    
    
                    compress.setCompressFileName(compress_file)


                else:
                    self.msg = "Error. Ruta duplicados no existe"
                        
                    self.__ErrLog(self.msg                                  ,
                                  regla_dup                                 , 
                                  mth                                       ,
                                  "double_double"                           )

                    self.setPostExitCode(2)           


                    #- no debe comprimir
                                                      
                    self.setPostDeleteFile()                                                          
                    
                    #- No se debe generar fichero bandera
                    
                    self.setPostDeleteTrigger()                                                          
                    
                    #- Si es 2 es que la ruta no existe
                    compress.open_file_code = 2

            else:
                self.__Log("Fichero no existe. No se necesita duplicado"    ,
                           compress_file                                    , 
                           mth                                              ,
                           "double_alt"                                     )


        else:
            self.__Log("Regla Duplicados desactivada"              ,
                       self.bline                                  , 
                       mth                                         ,
                       "simple_simple"                             )


        #---=------=------=------=------=------=------=------=------=---            
        #   F I N    Z O N A   D U P L I C A D O S
        #---=------=------=------=------=------=------=------=------=---            


        #- Entra si existe el fichero origen que queremos comprimir            
        #  y si la ruta si hay duplicados existe
        if compress.open_file_code == 0: 
          
            self.__Log("Llamada Compresion"                                 ,   
                       "-"                                                  ,   
                       mth                                                  ,
                       "double_simple"                                      )


            self.__Log("Fichero origen a comprimir"                         ,
                       compress.getSourceFileName()                         , 
                       mth                                                  ,    
                       "simple_simple"                                      )


            self.__Log("Nombre del fichero comprimido"                      ,
                       compress.getCompressFileName()                       , 
                       mth                                                  ,    
                       "simple_simple"                                      )


            self.__Log("Formato de compresion pasado"                       ,
                       up_format_file_sin_punto                             , 
                       mth                                                  ,    
                       "simple_simple"                                      )

            #- En principio si llega a este punto si tiene permisos
            compress.processCompress()

            #-- Borrar fichero origen    
            #   Falta gestionar si se ha comprimido bien o no
            self.setPostDeleteFile()                                                          


        elif compress.open_file_code == 2: 

            self.__ErrLog("Ruta duplicados no existe. No comprimimos "      ,
                          regla_dup                                         , 
                          mth                                               ,
                          "double_double"                                   )

            
            
        else:            
            self.msg = "Error al abrir fichero origen"
            self.__ErrLog(self.msg      ,   
                          fich_name                            , 
                          mth                                  ,
                          "simple_double"                      )

            self.setPostExitCode(1)           
            self.setPostExitStr(self.msg)
    

        self.LogEndMethod(self.__cls)

    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

