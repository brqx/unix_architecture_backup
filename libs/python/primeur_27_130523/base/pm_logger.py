#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Created on Wed Apr 17 15:27:05 2013

@author: Ricardo Cabello
"""
#- Librerias de Python
import os, datetime
#- Librerias Primeur
import pm_filemgmt, pm_list


def log(cadena, LOG_SHOW  = "", archivo_entrada = "primeur.log", modo_fichero = "a"):
    """ Funcion de logger general debe insertar lineas en el fichero.
        Argumentos: 
        - cadena          : Texto a sacar
        - LOG_SHOW        : Switch para permutar escritura en log o en pantalla 
        - archivo_entrada : Fichero en el que se va a escribir        
        - modo_fichero    : Modo en el que abrimos el archivo 
    """    
    
    lista_devuelta = pm_filemgmt.file_open(archivo_entrada, modo_fichero)    

    resultado = pm_list.get_codigo(lista_devuelta)    
    
    if resultado == 0:
        #-- Falta gestionar el valor del resultado
        f = pm_list.get_file(lista_devuelta)
       
        if LOG_SHOW == "screen":
            print (cadena)
        else:
            f.write(cadena + "\n")

    
        pm_filemgmt.file_close(f)
    else:
        #-En el caso de que no carge el log el motivo es un string
        motivo    = pm_list.get_valor(lista_devuelta)    
		cadena_out = "Error al cargar log:" + str(resultado) + \
				 ":" + motivo
        print (cadena_out)


def log_clear(archivo_entrada = "primeur.log"):
    """ Vacia un archivo de log.
    """    

    os.system('> ' + archivo_entrada)
    ##f=open('archivo_entrada','w')
    ##f.truncate()
    ##f.close()
    pass

def log_create(archivo_entrada = "primeur.log"):
    
    f = pm_filemgmt.file_open(f,'archivo_entrada','w')
    pm_filemgmt.file_openfile_close(f)


def flog(cadena, LOG_SHOW  = "", archivo_entrada = "comandos.log", modo_fichero = "a"):
    """ Funcion de logger formateado.
    
        Formato log : 
        Fecha - Hora - Comando
    """    
    sep = ":"
    fecha = datetime.datetime.now().strftime('%d/%b/%G:%I_%M_%p')
    ## 22/Apr/2013:11_52_AM
    pid = str(os.getpid())

    precadena = ""
    precadena = fecha + precadena
    precadena = precadena + sep + pid + sep   
    cadena    = precadena + cadena

    ## 22/Apr/2013:11_58_AM:16266:Primera_Linea
    log(cadena, LOG_SHOW, archivo_entrada, modo_fichero)    


#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

##log_clear()

#flog("pepe","screen")
