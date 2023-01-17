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
- PostProcesoProcess   - Clase de Post Proceso de postproceso
-----------------------------------------------------------
-+ Clases heredadas     : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- PostProcesoSysCompress     - Clase de compresion de sistema
-----------------------------------------------------------
-+ Clases utilizadas    : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- Sys               - Clase de parseo
-----------------------------------------------------------
- File              - Clase de acceso a ficheros de reglas
-----------------------------------------------------------
-+ Metodos definidos    : 
-----------------------------------------------------------
- runDelete         - Procesador de la borrado
-----------------------------------------------------------
- runProcess        - Procesador del Post Proceso
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
#- Quality        : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [3] [_] [5]
===========================================================
"""

import os

#- Importacion de clases utilizadas

from oo_sys                         import Sys
from oo_file                        import File

#- Importacion de clases heredadas


from oo_postproceso_syscompress        import PostProcesoSysCompress

class PostProcesoProcess(PostProcesoSysCompress):

    #-Variable estatica para indicar el nombre de la clase
    __cls                           =   "PostProcesoProcess"
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

   
        PostProcesoSysCompress.__init__(self    ,
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



    def runProcess(self):
        """ Procesa la recepcion del archivo
        """        

        mth = "runProcess"
        self.LogInitMethod(self.__cls)

        process = self.getPostProcess()
        post_args = self.getPostArgs()

        full_command = process + self.slash + post_args

        self.__Log("Comando Post Proceso"   , 
                   full_command             , 
                   mth                      ,
                   "simple_simple"          )
   
   
        if full_command != "":

   
            csys = Sys(full_command)

            syscall_post = csys.getRunStr()

            self.__Log("Llamada Post Proceso"       ,   
                       syscall_post                 ,   
                       mth                          ,
                       "simple_simple"              )
      
            csys.runSys()

            syscode_post        = csys.getSysCode()
            str_syscode_post    = str(syscode_post)

            sysstr_post         = csys.getSysOutStr()


            self.__Log("Resultado Post"             ,   
                       str_syscode_post             , 
                       mth                          ,
                       "simple_simple"              ) 

            self.__Log("Salida Post"                ,   
                       sysstr_post                  ,   
                       mth                          ,
                       "double_alt"                 )

                
            if syscode_post == 0:
                self.__Log("Post proceso correcto"      ,   
                           self.bline                   , 
                           mth                          ,
                           "square_alt"                 )
            else:
                self.__ErrLog("Error en Post proceso"   ,   
                              str_syscode_post          , 
                              mth                       ,
                              "square_double"           )
                
        self.LogEndMethod(self.__cls)
        

    def runDeleteFile(self):
        """ Elimina el archivo extraido
            - Tanto si hay que eliminarlo porque se ha comprimdo
            - Como si se elimina por ser un erro en extraccion
        """        
   
        mth = "runDelete"   
   
        delete_file_option  = self.getPostDeleteFile()
        full_path_filename  = self.getPostFullPathFileName()

        self.__Log("Fichero origen con opcion de borrado"     ,
                   full_path_filename                         , 
                   mth                                        ,    
                   "double_simple"                            )


        self.__Log("Opcion de borrado de ficheros"            ,
                   delete_file_option                         , 
                   mth                                        ,    
                   "simple_simple"                            )

       
        if delete_file_option != "":
            self.__Log("Fichero a eliminar"                       ,
                       full_path_filename                         , 
                       mth                                        ,    
                       "double_simple"                            )

            fich = File()
            fich.deleteFile(full_path_filename)        


    def runDeleteTrigger(self):
        """ Elimina el archivo bandera generadi
            - Tanto si hay que eliminarlo porque se ha comprimdo
            - Como si se elimina por ser un erro en extraccion
        """        
   
        mth = "runDelete"   
   
        delete_file_option  = self.getPostDeleteTrigger()
        full_path_filename  = self.getPostFullPathTrigger()

        self.__Log("Fichero trigger con opcion de borrado"          ,
                   full_path_filename                               , 
                   mth                                              ,    
                   "double_simple"                                  )


        self.__Log("Opcion de borrado de ficheros"                  ,
                   delete_file_option                               , 
                   mth                                              ,    
                   "simple_simple"                                  )

       
        if delete_file_option != "":
            self.__Log("Fichero trigger a eliminar"                 ,
                       full_path_filename                           , 
                       mth                                          ,    
                       "double_simple"                              )

            fich = File()
            if os.path.exists(full_path_filename):
                fich.deleteFile(full_path_filename)        


    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

