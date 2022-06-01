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
- PostProceso   - Clase de Post Proceso
-----------------------------------------------------------
-+ Clases heredadas     : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- PostProcesoProcess     - Clase de postproceso dentro del Post
-----------------------------------------------------------
- Sys                    - Acceso al sistema - Estructuras de salida
-----------------------------------------------------------
-+ Clases utilizadas    : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- Sys               - Clase de parseo
-----------------------------------------------------------
- File              - Clase de acceso a ficheros de reglas
-----------------------------------------------------------
-+ Metodos definidos    : 
-----------------------------------------------------------
- processPost       - Lanzador de post proceso
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- Ninguna
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


##from oo_rules_sff_est           import RulesSffEst


#- Importacion de clases heredadas


from oo_postproceso_process        import PostProcesoProcess

class PostProceso(PostProcesoProcess    ):

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

   
        PostProcesoProcess.__init__(self    ,
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


    def processPost(self):
        """ Procesa la recepcion del archivo
        """        
        mth = "processPost"
        self.LogInitMethod(self.__cls)


        trigger     = self.getPostTrigger()        
        compress    = self.getPostCompress()        
        process     = self.getPostProcess()        

            
        #-- Crear la bandera



        if trigger != "":

            self.__Log("Evaluando Trigger"          , 
                       trigger                      , 
                       mth                          ,
                       "square_alt"                 )

            self.runTrigger()
   
           

        
        #-- Comprimir
        if compress != "":

            self.__Log("Evaluando Compresion"       , 
                       compress                     , 
                       mth                          ,
                       "square_alt"                 )
 
            self.runCompress()


        #-- Ejecutar comando post proceso
        if process != "":
            self.__Log("Evaluando Post Proceso"     , 
                       compress                     , 
                       mth                          ,
                       "square_alt"                 )

##            self.runProcess()


        #-- Se elimina el fichero una vez extraido si procede
        #-- Tambien se puede eliminar la bandera
        self.runDeleteFile()
        self.runDeleteTrigger()


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

