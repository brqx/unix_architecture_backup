import sys
import os
import datetime
import os.path
import time
import glob
import subprocess
import time
import shutil

print(os.environ['PYTHONPATH'])
print ("ANTES")
from oo_parse import Parse
print ("DESPUES")
exit(0)
import zipfile
import gzip
#**********************************************************PATHS****************************************************************
#*******************************************************************************************************************************
#*******************************************************************************************************************************
if 'win' in sys.platform:
#Definicion de Paths a utilizar
	LOG=str(os.environ['SPAZIO'])+'\\logProc\\'
	ERROR=str(os.environ['SPAZIO'])+'\\errorProc\\'
	HISTORY=str(os.environ['SPAZIO'])+'\\historyProc\\'
	RULES=(os.environ['SPAZIO'])+'\\cfg\\'
	
else: 
#Definicion de Paths a utilizar
	LOG= str(os.environ['SPAZIO'])+'/logProc/'
	ERROR= str(os.environ['SPAZIO'])+'/errorProc/'
	HISTORY=str(os.environ['SPAZIO'])+'/historyProc/'
	RULES=	str(os.environ['SPAZIO'])+'/cfg/'	
#*********************************************************FIN PATHS*************************************************************
#*******************************************************************************************************************************
#*******************************************************************************************************************************
#*********************************Funcion auxiliar apra evaluar si un valor es nulo*********************************************
#*******************************************************************************************************************************
def IsNull(value):
    return value is None or len(value) == 0
#*****************************************************Fin funcion***************************************************************
#*******************************************************************************************************************************
#*****************************************************CONTROL DE DUPLICADOS*****************************************************
#*******************************************************************************************************************************
#*******************************************************************************************************************************
def control_dup(QMANAGER,QUEUE,CORREL_ID, DATA_FILE_NAME):
	#Ejecuto el comando filelist para obtener los datos del fichero
	if 'win' in sys.platform:
		comando="filelist"+" "+QMANAGER+" "+QUEUE+" /c"+CORREL_ID+" /o NOD /o CSV /o NOBanner /o NOLabel /m4100\"(2010)\" /b3301 /b3302 /b3048 /b3049"
	else:
		comando="filelist"+" "+QMANAGER+" "+QUEUE+" -c"+CORREL_ID+" -o NOD -o CSV -o NOBanner -o NOLabel -m4100'(2010)' -b3301 -b3302 -b3048 -b3049"
	
	proc=os.popen(comando).read()
	log_a("log", "Se ejecuto el comando filelist", "Comando= "+comando)
	proc=proc.split("\n")
	aux=[]
	for l in proc:
		aux.append(l.strip().replace('"','').replace(',',' ').strip())
	del aux[len(aux)-2]
	
	b=[]	
	for a in aux:
		b.append(a.split("  "))
	
	flag="0"	
	for f in b:
		if len(f)>1:
			FECHA= datetime.datetime.fromtimestamp(int(time.mktime(time.strptime(f[1]+f[2], '%Y%m%d%H%M%S')))).date()
			fechaSys=datetime.datetime.now().date()
			FILE = f[0]
			
			if (FILE!=DATA_FILE_NAME)| ((abs((fechaSys - FECHA).days))>int(DUP)):
				flag="1"
			else:
				flag="0"
		elif len(b)<=1:
			flag="1"
	return (flag)
#***************************************************FIN CONTROL DE DUPLICADOS***************************************************
#*******************************************************************************************************************************
#*******************************************************************************************************************************
#****************************************************************LOGS***********************************************************
#*******************************************************************************************************************************
#*******************************************************************************************************************************
def log_a(log_level,message,*args):
	
	
	if log_level=="error":
	
			f=open(ERROR+datetime.datetime.now().strftime('%Y_%m_%d')+".log", 'a+')
			f.write("*******************ERROR***********************\n")
			f.write(str(datetime.datetime.now().strftime('%H:%M:%S'))+" "+message+"\n")
			for more in args:
				f.write(str(datetime.datetime.now().strftime('%H:%M:%S'))+" "+more+"\n")
			f.write("**********************************************\n")
			f.close()
	elif log_level=="history":
	
			f=open(HISTORY+datetime.datetime.now().strftime('%Y_%m_%d')+".log", 'a+')
			f.write("*******************HISTORY**********************\n")
			f.write(str(datetime.datetime.now().strftime('%H:%M:%S'))+" "+message+"\n")
			for more in args:
				f.write(str(datetime.datetime.now().strftime('%H:%M:%S'))+" "+more+"\n")
			f.write("**********************************************\n")
			f.close()
	elif log_level=="log":
	
			f=open(LOG+datetime.datetime.now().strftime('%Y_%m_%d')+".log", 'a+')
			f.write("******************LOG*********************\n")
			f.write(str(datetime.datetime.now().strftime('%H:%M:%S'))+" "+message+"\n")
			for more in args:
				f.write(str(datetime.datetime.now().strftime('%H:%M:%S'))+" "+more+"\n")
			f.write("**********************************************\n")
			f.close()
#************************************************************FIN LOGS***********************************************************
#*******************************************************************************************************************************
#*******************************************************************************************************************************
#**********************************************************COMPRESION***********************************************************
#*******************************************************************************************************************************
#*******************************************************************************************************************************
def compresion(DATA_FILE_NAME,COMPRESSOR):	
	try:
		if COMPRESSOR=='gzip':	
			f_to_process=DATA_FILE_NAME
			f_in = open(f_to_process, 'rb')
			f_out = gzip.GzipFile(DATA_FILE_NAME+'.gz', 'wb',7)
			f_out.writelines(f_in)
			f_out.close()
			f_in.close()
			ZIP_FILE=f_out.filename
			
			return(ZIP_FILE)
		else:
			if 'win' in sys.platform:
				f_to_store=DATA_FILE_NAME.rsplit('\\',1)[1]
			else:
				f_to_store=DATA_FILE_NAME.rsplit('/',1)[1]		
			
			f_out = zipfile.ZipFile(DATA_FILE_NAME+'.zip', 'w')
			f_out.write(DATA_FILE_NAME,f_to_store,compress_type=zipfile.ZIP_DEFLATED)
			f_out.close()
			ZIP_FILE=f_out.filename
			log_a("log","Archivo Comprimido con Exito")
			return(ZIP_FILE)
	except:
		log_a("error","Error al comprimir el archivo")
		return("")
#********************************************************FIN COMPRESION*********************************************************
#*******************************************************************************************************************************
#*******************************************************************************************************************************
#*******************************************************CONTROL DE TIEMPO*******************************************************
#*******************************************************************************************************************************
#*******************************************************************************************************************************
def time_con(TIMER,FILE_NAME):
	
	if (TIMER=="-1") | (TIMER==""): 
		return("1")
	elif float(TIMER)>0:	
		hora_modif=time.time() - os.path.getmtime(FILE_NAME)
		log_a("log","Ultima modificacion hacen "+str(hora_modif)+" segundos")
		if hora_modif >= float(TIMER):
			return("1")
		else:
			return("0")
#*****************************************************FIN CONTROL DE TIEMPO*****************************************************
#*******************************************************************************************************************************
#*******************************************************************************************************************************
#*************************************************************ENVIO*************************************************************
#*******************************************************************************************************************************
#*******************************************************************************************************************************
def enviar(QMANAGER,QUEUE,DATA_FILE_NAME,USER,PASSWD,SENDER,UCLASS,DESCRIPTION,STANDARD,DESTFILENAME):
	if 'win' in sys.platform:
		comando="filetdsp "+QMANAGER +" "+ QUEUE +' "'+ DATA_FILE_NAME+'"'
		if len(USER)>1:
			comando=comando +" /u"+USER
		if len(PASSWD)>1:
			comando=comando +" /p"+PASSWD
		comando = comando + " /c "+CORREL_ID
		if len(SENDER)>1:
			comando=comando +" /s"+SENDER
		if len(UCLASS)>1:
			comando = comando +" /n"+UCLASS
		if len(DESCRIPTION)>1:
			comando=comando +" /xDescription("+DESCRIPTION+")"
		if len(STANDARD)=="D":
			comando=comando +"/o DA"
		if len(DESTFILENAME)>1:
			comando=comando +" /f\""+DESTFILENAME+"\""
		
	else:
		comando="filetdsp "+QMANAGER +" "+ QUEUE +' "'+ DATA_FILE_NAME+'"'
		if len(USER)>1:
			comando=comando +" -u"+USER
		if len(PASSWD)>1:
			comando=comando +" -p"+PASSWD
		comando = comando + " -c"+CORREL_ID
		if len(SENDER)>1:
			comando=comando +" -s"+SENDER
		if len(UCLASS)>1:
			comando = comando +" -n"+UCLASS
		if len(DESCRIPTION)>1:
			comando=comando +" -xDescription'("+DESCRIPTION+")'"
		if len(STANDARD)=="D":
			comando=comando +"-oDA "
		if len(DESTFILENAME)>1:
			comando=comando +" -f"+"'"+DESTFILENAME+"'"
		
	
	
	log_a("log", "Comando= "+comando)
	proc= subprocess.Popen(comando,bufsize=-1, shell=True)
	out,err=proc.communicate()
	out=proc.returncode
	
	if (out==0):
		
		log_a("log","Envio realizado con Exito!","Comando Ejecutado= "+comando)
		return ("1")
	else:
		log_a("error","Error al realizar el envio","Comando Ejecutado= "+comando)
		return ("")
#***********************************************************FIN ENVIO***********************************************************
#*******************************************************************************************************************************
#*******************************************************************************************************************************
#**********************************************************Variables************************************************************
#*******************************************************************************************************************************
#*******************************************************************************************************************************
TIMER="-1"
DESTINOS="1"
FILE_NAME=""
CORREL_ID=""
LOTE=""
for args in sys.argv:
	a=args.find("/")!=-1
	b=args.find("\\")!=-1
	c=not args.find(".py")!=-1
	
	if args.startswith("-t"):
		TIMER= args[2:]
	if args.startswith("-n"):
		DESTINOS=args[2:]
	if args.startswith("-r"):
		if len(args[2:].split("-"))==4:
			CORREL_ID=args[2:]
			LOTE=CORREL_ID[:-3]
		elif len(args[2:].split("-"))==3:
			CORREL_ID=args[2:]
			LOTE=CORREL_ID
	if (((args.find("/")!=-1)|(args.find("\\")!=-1))&(not args.find(".py")!=-1)):
		FILE_NAME=args
	
#*********************************************************Fin Variables*********************************************************
#*******************************************************************************************************************************
#*******************************************************************************************************************************
#*******************************************************************************************************************************
#*******************************************************************************************************************************
#*******************************************************************************************************************************
#**************************************************************MAIN*************************************************************
#*******************************************************************************************************************************
#*******************************************************************************************************************************
#*******************************************************************************************************************************
if 'win' in sys.platform:
	Name=FILE_NAME.rsplit('\\',1)[1].rsplit('.',1)[0]
	Path=FILE_NAME.rsplit('\\',1)[0]+'\\'
else:
	Name=FILE_NAME.rsplit('/',1)[1].rsplit('.',1)[0]
	Path=FILE_NAME.rsplit('/',1)[0]+'/'
	
v=""
QMANAGER= ""
QUEUE=""
SENDER=""
UCLASS=""
DESCRIPTION=""
STANDARD=""
COMPRESSOR=""
USER=""
PASSWD=""
DESTFILENAME=""
EXT=""
EFG=""
TARGET=""
DUP=""
EC=1
DATA_FILE_NAME=""
if time_con(TIMER, FILE_NAME)=="1":
	if IsNull(LOTE):
		log_a("log","Procesamiento sin fichero de reglas.", "El fichero esta listo para ser enviado")
		log_a("history", "Procesamiento sin fichero de reglas.", "El fichero esta listo para ser enviado", "Control devuelto a la Agenda estatica")
		sys.exit(1)
	
	all=os.listdir(RULES)
	rule_list=[]
	for files in all:
		if files.startswith(LOTE) and files.endswith("_prepro.rul"):
			rule_list.append(files)
	if len(rule_list)==1:
		EC=2
	if not rule_list and int(DESTINOS)==1:
		log_a("log","No se ha encontrado un archivo de reglas de pre-proceso","Nombre del fichero de reglas= "+CORREL_ID+"_prepro.rul")
		log_a("history", "Sin archivo de reglas. Esto puede deberse a que no se ha creado.","Nombre del fichero de reglas= "+CORREL_ID+"_prepro.rul","Codigo de salida= 2")
		sys.exit(2)
	if not rule_list and int(DESTINOS)>1:
		log_a("log","No se ha encontrado un archivo de reglas de pre-proceso","Nombre del fichero de reglas= "+CORREL_ID+"_prepro.rul")
		log_a("history", "Sin archivo de reglas. Esto puede deberse a que no se ha creado.","Nombre del fichero de reglas= "+CORREL_ID+"_prepro.rul","Codigo de salida= 1")
		sys.exit(1)
	else:
		for files in rule_list:
			lines = [line.strip() for line in open(RULES+files)]
			for l in lines:
				if l.startswith("QMANAGER"):
					QMANAGER= l.rsplit('=')[1].replace(" ","")
				if l.startswith("QUEUE"):
					QUEUE= l.rsplit('=')[1].replace(" ","")
				if l.startswith("SENDER"):
					SENDER= l.rsplit('=')[1].replace(" ","")
				if l.startswith("UCLASS"):
					UCLASS= l.rsplit('=')[1].replace(" ","")
				if l.startswith("DESCRIPTION"):	
					DESCRIPTION= l.rsplit('=')[1].replace(" ","")
				if l.startswith("STANDARD"):	
					STANDARD= l.rsplit('=')[1].replace(" ","")
				if l.startswith("COMPRESSOR"):	
					COMPRESSOR= l.rsplit('=')[1].replace(" ","")
				if l.startswith("USER"):	
					USER= l.rsplit('=')[1].replace(" ","")
				if l.startswith("PASSWD"):	
					PASSWD= l.rsplit('=')[1].replace(" ","")
				if l.startswith("DESTFILENAME"):	
					DESTFILENAME= l.rsplit('=')[1].replace(" ","")
				if l.startswith("EXT"):	
					EXT= l.rsplit('=')[1].replace(" ","")
				if l.startswith("EFG"):	
					EFG= l.rsplit('=')[1].replace(" ","")
				if l.startswith("TARGET"):	
					TARGET= l.rsplit('=')[1].replace(" ","")
				if l.startswith("DUP"):	
					DUP= l.rsplit('=')[1].replace(" ","")
			
			if IsNull(QMANAGER) | IsNull(QUEUE)| IsNull(TARGET):
				log_a("error","ERROR!: Faltan parametros obligatorios en el fchero de reglas", "QMANAGER= "+QMANAGER,"QUEUE= "+QUEUE,"TARGET= "+TARGET)
				log_a("history", "Faltan parametros. Revise el log de error. Codigo de salida= 1")
				sys.exit(EC)
			
			else:
				if not IsNull(EXT):
					band=EXT.replace(")","").replace("(","").replace('\\',"").replace("/","")
					files = os.listdir(Path)
					for file in files:
						file=Path+file
						if (os.path.isfile(file))& (file.startswith(Path+Name)) & (file.endswith(band)==False):
							DATA_FILE_NAME=file
							
			
				else: DATA_FILE_NAME=FILE_NAME
				if IsNull(DATA_FILE_NAME):
					log_a("log","Se ha producido un error. Revise el log de error")
					log_a("error","No se encuentra el fichero de Datos")
					log_a("history","No se encuentra el fichero de Datos", "Codigo de salida= "+str(EC))
					sys.exit(EC)
				else:
					log_a("log","Archivo de datos: "+DATA_FILE_NAME)
				CONTROL=""
				
				if TARGET=="E":
					log_a("log", "El destino al que se envia es Externo")
					if not IsNull(COMPRESSOR):
						log_a("log", "Iniciando Compresion")
						DATA_FILE_NAME=compresion(DATA_FILE_NAME,COMPRESSOR)
						if not IsNull(DATA_FILE_NAME):
							CONTROL=CONTROL+"0"
						else:
							log_a("error", "Se interrumpio el procesamiento debido a un error en la compresion")
							log_a("history", "Error en la compresion. Revise el log de error. Codigo de salida= "+str(EC))
							sys.exit(EC)
					else:
						log_a("log", "No se requiere compresion")
						CONTROL=CONTROL+"1"
					
					if not IsNull(EFG):
						log_a("log", "Iniciando procesamiento para envio de fichero bandera")
						band=EFG.replace(")","").replace("(","").replace('\\',"").replace("/","")
						FLAG_FILE_NAME=FILE_NAME.rsplit('.',1)[0]+band
						shutil.copyfile(FILE_NAME, FLAG_FILE_NAME)
						DEST_FLAG_FILE=DESTFILENAME.rsplit('.',1)[0]+band
						if (not IsNull(FLAG_FILE_NAME)) & (not IsNull(DEST_FLAG_FILE)):
							code=enviar(QMANAGER,QUEUE,FLAG_FILE_NAME,USER,PASSWD,SENDER,UCLASS,DESCRIPTION,STANDARD,DEST_FLAG_FILE)
							if code=="1":
								log_a("log", "La bandera se envio con exito")
								os.remove(FLAG_FILE_NAME)
								log_a("log", "Archivo bandera removido con exito")
							else:
								log_a("error", "Error al enviar el fichero Bandera.")
								CONTROL=CONTROL+code
						else:
							log_a("error", "Error al generar  el fichero Bandera. Procesamiento Interrumpido")
							log_a("history", "Error Con el fichero bandera. Revise el log de error. Codigo de salida= "+str(EC))
							sys.exit(EC)
					else:
						log_a("log", "Procesamiento sin envio de fichero bandera")
						CONTROL=CONTROL+"1"
					
					#MANEJO DE DESTFILENAME CON MASCARA
					oparse = Parse( DESTFILENAME,DATA_FILE_NAME, DESTFILENAME,CORREL_ID,SENDER,DESCRIPTION,COMPRESSOR,EXT,0,0,"") 
					oparse.runParse() 
					DESTFILENAME= oparse.getResultado()
					
					if not IsNull(DESTFILENAME):
						log_a("log", "Manejo de mascara realizado con exito")
						CONTROL=CONTROL+"1"
					else:
						log_a("error", "Error al realizar el Manejo de mascara")
						CONTROL=CONTROL+"0"
					#FIN MANEJO DE DESTFILENAME CON MASCARA
					
					
					
				else:
					log_a("log", "El destino al que se envia es Interno")
					CONTROL="111"
				
				if not IsNull(DUP) and DUP!="0":
					log_a("log", "Inicio del control de Duplicados")
					CONTROL=CONTROL+control_dup(QMANAGER,QUEUE,CORREL_ID, DATA_FILE_NAME)
					
				else:
					log_a("log", "Sin control de Duplicados")
					CONTROL="1111"
								
				log_a("log", "Codigo de control= "+CONTROL)
				
				
				if CONTROL=="1111":
					v=v+enviar(QMANAGER,QUEUE,DATA_FILE_NAME,USER,PASSWD,SENDER,UCLASS,DESCRIPTION,STANDARD,DESTFILENAME)
				elif CONTROL=="0111":
					if (enviar(QMANAGER,QUEUE,DATA_FILE_NAME,USER,PASSWD,SENDER,UCLASS,DESCRIPTION,STANDARD,DESTFILENAME)=="1"):
						log_a("log", "Fichero comprimido enviado")
						os.remove(DATA_FILE_NAME)
						log_a("log", "Fichero comprimido borrado con exito")
					else:
						log_a("error", "Error al enviar el fichero comprimido. Procesamiento Interrumpido")
						log_a("history", "Codigo de salida= "+str(EC))
						sys.exit(EC)
				elif CONTROL=="0110" or CONTROL=="1110":
					log_a("log", "El archivo ha sido enviado anteriormente. Archivo no enviado", "Codigo de Control= "+CONTROL)
					log_a("history", "El archivo ha sido enviado anteriormente. Archivo no enviado")
					v=v+"0"
				else:
					log_a("error", "Una de las operaciones no se realizo con exito. Procesamiento Interrumpido", "Codigo de Control= "+CONTROL)
					log_a("history", "Codigo de salida= "+str(EC))
					sys.exit(EC)
					
	if len(v)==int(DESTINOS):
		log_a("log", "Todos las operaciones se realizaron con exito")
			
		if (FILE_NAME==DATA_FILE_NAME):
			os.remove(FILE_NAME)
			log_a("log", "Fichero de datos eliminado con exito")
			log_a("history", "Codigo de salida= 0")
			sys.exit(0)
		else:
			os.remove(FILE_NAME)
			log_a("log", "Fichero bandera eliminado con exito")
			os.remove(DATA_FILE_NAME)
			log_a("log", "Fichero de datos eliminado con exito")
		log_a("history", "Codigo de salida= 0")
		sys.exit(0)
	else:
		log_a("log", "Se ha producido un error. Revise el log de errores para mas detalles.")
		log_a("history", "Codigo de salida= "+str(EC))
		sys.exit(EC)
else:
	log_a("log","El archivo no esta listo para ser enviado")
	log_a("history", "Codigo de salida= 0")
	sys.exit(0)