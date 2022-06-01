#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.5
@pythonver: 3.3
-----------------------------------------------------------
+ Clases definidas      : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- PostProcesoTrg   - Clase de Post Proceso de Banderas
-----------------------------------------------------------
-+ Clases heredadas     : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- PostProcesoEst     - Clase de estructura de postproceso
-----------------------------------------------------------
- PostProcesoCmd     - Clase de comando de postproceso
-----------------------------------------------------------
-+ Clases utilizadas    : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- File              - Clase de acceso a ficheros de reglas
-----------------------------------------------------------
-+ Metodos definidos    : 
-----------------------------------------------------------
- runTrigger        - Procesador de la bandera
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- re
===========================================================
+ Process Status  : [130621]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [_] [4] [5]
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

import re

#- Importacion de clases heredadas

from oo_postproceso_est         import PostProcesoEst
from oo_postproceso_commands    import PostProcesoCmd
##from oo_rules_sff_est           import RulesSffEst

#- Importacion de clases utilizadas

from oo_file                    import File


class PostProcesoTrg(PostProcesoEst        , 
                     PostProcesoCmd        ):

    #-Variable estatica para indicar el nombre de la clase
    __cls                           =   "PostProceso"
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

   
        PostProcesoEst.__init__(self                        ,
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


        PostProcesoCmd.__init__(self                        ,
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


    def runTrigger(self):
        """ Procesa la generacion del trigger
            Dos casos :
            Normal  : .trg
            Omitido : (dat).trg
        """        
        mth = "runTrigger"
        self.LogInitMethod(self.__cls)

        #-Establecemos codigo y mensaje de salida por defecto
        self.setPostExitCode()           
        self.setPostExitStr()           


        #- Tenemos este caso
        # spazio.ini20130520165242    
        

        fich_destino        =  self.getPostDestinationFileName()
        fich_destino_no_ext =  self.getPostDestinationFileNameNoExt()

        #-De momento no le veo sentido
##        clean_df            =  self.getPostCleanDestinationFilename()  
        extension           =  self.getPostExt()

        directorio          =  self.getPostDirectory()
    
        trigger             =  self.getPostTrigger()
        
        compress            =  self.getPostCompress()
        

        self.__Log("Trigger"                        , 
                   trigger                          , 
                   mth                              ,
                   "simple_simple"                  )
                   
        self.__Log("Compress"                       , 
                   compress                         , 
                   mth                              ,
                   "simple_simple"                  )

        self.__Log("Fichero Destino"                , 
                   fich_destino                     , 
                   mth                              ,
                   "simple_simple"                  )

        self.__Log("Fichero Destino no ext"         , 
                   fich_destino_no_ext              , 
                   mth                              ,
                   "simple_simple"                  )

        self.__Log("Directorio"                     , 
                   directorio                       , 
                   mth                              ,
                   "simple_simple"                  )

        self.__Log("Extension"                      , 
                   extension                        , 
                   mth                              ,
                   "simple_simple"                  )

        low_compress = ""
        if compress != "":
            low_compress = "." + compress.lower()


        if low_compress == ".gzip":
            low_compress = ".gz"


        # Caso 1 .trg
        # Caso 2 (gz).trg
        #-Este split falla si no tiene la cadena


        linea_trg = re.split('\)',trigger)


        len_linea_trg = len(linea_trg)     

        if len_linea_trg == 1:
            #-Trigger normal
            #-Formato .trg
   
            fich_name = directorio    + self.slash      +   \
                        fich_destino  + low_compress    +   \
                        trigger

        elif len_linea_trg ==2:
            #-Trigger cambiado
            #-Formato (ext).trg
            trigger_final = linea_trg[1]
            trigger_first = linea_trg[0]
            #- Tenemos (gz
            linea_trg_first = re.split("\(", trigger_first)
            trigger_first_clean = linea_trg_first[1]

            #- Si es igual que la extension entonces la quitamos
            if trigger_first_clean.upper() == extension.upper():
                #-Este caso es .gz con trigger (gz).trg
                fich_name = directorio    + self.slash +  \
                            fich_destino_no_ext + trigger_final
            else:
                #-Este caso es .zip con trigger (gz).trg
                #-Ignoramos el gz
                fich_name = directorio    + self.slash +  \
                            fich_destino +  trigger_final


        self.__Log("Trigger a generar"              , 
                   fich_name                        , 
                   mth                              ,
                   "simple_simple"                  )

        #-- Falta gestionar si no se crea bien
        #-- Si la ruta del duplicado no existe no debe crear bandera

        regla_dup      =  self.getPostCopyDup()    

        #---=------=------=------=------=------=------=------=------=---            
        #   I N I C I O   Z O N A   D U P L I C A D O S
        #---=------=------=------=------=------=------=------=------=---            

        if regla_dup    !=  "":

            self.__Log("Regla Duplicados activada"                      ,
                       regla_dup                                        , 
                       mth                                              ,
                       "simple_simple"                                  )

            directory_dup = File(regla_dup)
        
            dup_open_file_code      = directory_dup.getOpenFileCode()
            str_dup_open_file_code  = str(dup_open_file_code)
    
            if dup_open_file_code == 0:
                #- El directorio existe
                self.__Log("Ruta duplicados existe"                     ,
                           regla_dup                                    , 
                           mth                                          ,
                           "double_alt"                                 )

                #-Creamos la bandera solo si la ruta existe    
                #- No hay forma de tratar aqui el nombre de la bandera
                #  Estamos perdiendo el control del codigo .-()
                
                self.createTrigger(fich_name)            

            else:
                #-Debemos indicar que la ruta no existe
                self.msg = "Error. Ruta duplicados no existe"
                self.__ErrLog(self.msg                                  ,
                              regla_dup                                 , 
                              mth                                       ,
                              "double_double"                           )

                self.setPostExitCode(2)           
                self.setPostExitStr(self.msg)


        else:
            #- No se gestionan duplicados

            self.createTrigger(fich_name)
##      Logear que ha creado la bandera

        self.__Log("Establecemos ruta completa para posible borrado"    ,
                   fich_name                                            , 
                   mth                                                  ,
                   "double_alt"                                         )
        
        self.setPostFullPathTrigger(fich_name)


        self.LogEndMethod(self.__cls)



    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

## df = "COManDO.dat"
## d  = "/brqx/arquitectura/unix/libs/python/primeur/oop/oo_post"
## p  = "/opt/scripts/caso_1.ksh"
## comp = ".ZIP"
## trg = ".trg"
## args = "argum1 argun2 argun3"

## op = PostProceso(df, d, p ,comp, trg)

## op.createCompressCommandGzip(df,"dat")

