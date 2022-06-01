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
- PostProcesoProcess    - Clase de Post Proceso de postproceso
-----------------------------------------------------------
-+ Clases heredadas     : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- PostProcesoCompress   - Clase de postproceso de compresion
-----------------------------------------------------------
-+ Clases utilizadas    : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- Sys                   - Clase de parseo
-----------------------------------------------------------
- CompressUtl           - Clase de utilidades de compresion
-----------------------------------------------------------
-+ Metodos definidos    : 
-----------------------------------------------------------
- runSystemCompress        - Compresion a nivel de sistema
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


#- Importacion de clases utilizadas

from oo_sys                         import Sys

from oo_compress_utils              import CompressUtl

#- Importacion de clases heredadas

from oo_postproceso_compress        import PostProcesoCompress

class PostProcesoSysCompress(PostProcesoCompress):

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

   
        PostProcesoCompress.__init__(self    ,
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


    def runSystemCompress(self):
        """ Procesa la recepcion del archivo
        """        
        mth = "runCompress"
        self.LogInitMethod(self.__cls)

        #-Informacion del fichero
        fich_destino        =  self.getPostDestinationFileName()
        fich_destino_no_ext =  self.getPostDestinationFileNameNoExt()
        extension_fich      =  self.getPostExt()
        directorio          =  self.getPostDirectory()

        #-Informacion del tipo de compresion    
        format_file         =  self.getPostCompress()
        up_format_file      =  format_file.upper()

        self.__Log("Formato Compresion"             , 
                   format_file                      , 
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

        self.__Log("Extension Fichero"              , 
                   extension_fich                   , 
                   mth                              ,
                   "simple_simple"                  )

        self.__Log("Directorio"                     , 
                   directorio                       , 
                   mth                              ,
                   "simple_simple"                  )

       
        csys = Sys()

        
        #-Fichero a componer en comando
        fich_name_no_ext = self.getPostDirectory()    + self.slash + \
                           fich_destino_no_ext 

    
        #-Fichero real extraido por filetdsp
        fich_name = self.getPostDirectory()    + self.slash + \
                    fich_destino 

        self.__Log("Formato compresion pasado"          , 
                   format_file                          , 
                   mth                                  ,
                   "simple_simple"                      )

        self.__Log("Nombre_fichero_destino"             , 
                   fich_name                            , 
                   mth                                  ,
                   "double_alt"                         )


        #- Gestiona la extension
        utl_comp = CompressUtl()
        utl_comp.processDotExt(up_format_file)
        up_format_file_sin_punto = utl_comp.ext_without

                

        self.__Log("Formato compresion ajustado"        , 
                   up_format_file_sin_punto             , 
                   mth                                  ,
                   "simple_simple"                      )


        full_command = ""
        
        if up_format_file_sin_punto     == "GZ":
            full_command = \
            self.createCompressCommandGzip(
                fich_name                   , 
                fich_name_no_ext            )
        elif up_format_file_sin_punto     == "GZIP":
            full_command = \
            self.createCompressCommandGzip(
                fich_name                   , 
                fich_name_no_ext            )

        elif up_format_file_sin_punto   == "ZIP":
            #- Le pasamos 
            # - el fichero con extension extraido
            # - el fichero sin extension a componer
            # - el formato a usar
            full_command = \
            self.createCompressCommandZip(
                fich_name                   , 
                fich_name_no_ext            )
        

        self.__Log("Comando compresion"     , 
                   full_command             ,
                   mth                      ,
                   "simple_alt"             )

            
        if full_command != "":

            csys.setRunStr(full_command)

            syscall_comp = csys.getRunStr()
    
            self.__Log("Llamada Compresion"         ,   
                       syscall_comp                 ,   
                       mth                          ,
                       "simple_simple"              )
    
            csys.runSys()

            syscode_comp        = csys.getSysCode()
            str_syscode_comp    = str(syscode_comp)

            sysstr_comp         = csys.getSysOutStr()


            self.__Log("Resultado Compresion"       ,   
                       str_syscode_comp             , 
                       mth                          ,
                       "simple_simple"              ) 

            self.__Log("Salida Compresion"          ,   
                       sysstr_comp                  ,   
                       mth                          ,
                       "square_alt"                 )


            #--- Hay que revisar este proceso            
            if syscode_comp == 0:

                self.__Log("Compresion Correcta"            ,   
                           self.bline                       , 
                           mth                              ,
                           "simple_simple"                  )

                #-Estamos creando la bandera o un fichero
##                fich = File()
##                fich.createFile(fich_name)        
                # depende del que se haya usado para comprimir
                #-- Si es zip debemos borrar el archivo
                if up_format_file_sin_punto == "ZIP":
                    self.setPostDeleteFile()

            else:
                #- Eror al comprimir
                self.__Log("Error Compresion"           ,   
                           sysstr_comp                  ,   
                           mth                          ,
                           "square_double"              )

        else:
            self.__Log("Formato no conocido"            ,   
                       format_file                      , 
                       mth                              ,
                       "simple_simple"                  )


        self.LogEndMethod(self.__cls)


    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

