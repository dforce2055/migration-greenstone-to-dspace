#! /bin/bash
#----------------------------------------------------------------#
#---------NORMALIZACIÓN DE ÍTEMS EXPORTADOS GREENSTONE-----------#
#----------------------------------------------------------------#
# Los ítems exportados desde Greenstone con el plugin "dspace"   #
# no están aptos para importar directamente a DSpace.            #
# Por eso este plugin se creó para normalizar y adaptar la       #
# exportación de Greenstone y poder importarla en DSpace         #
#----------------------------------------------------------------#
# Las versiones utilizadas de de las herramientas son:           #
#    Greenstone 2.85                                             #
#    Dspace 4.1                                                  #
#----------------------------------------------------------------#
# Requisitos de Software                                         #
# SO: Debian 7                                                   #
# iconv versión:Debian EGLIBC 2.13-38+deb7u4) 2.13               #
# xsltproc versión: libxml 20800, libxslt 10126 and libexslt 815 #
#----------------------------------------------------------------#

# Declaración de vectores
declare -a directorios
declare -a pdf

# Declaración de variables
cantidad=0          # Almacena la cantidad de directorios
i=0                 # Variable auxiliar utilizada como contador
posicion=0          # Ruta donde se ejecuta el script
respuesta=0         # Almacena la respuesta del usuario
ruta_actual=0       # Almacena la ruta de la carpeta donde está los ítems 
                    # exportados, seria la carpeta de trabajo



# Posicionamiento 
ruta_actual=`pwd .` # Guarda la ruta actual de trabajo | se guarda sin / final | 
                    # `readlink -f .` | `pwd .`
echo "Ruta actual: $ruta_actual"
echo "Ingrese la ruta del directorio a trabajar:"
read posicion
cd $posicion

# Almacena el listado de directorios en el vector "directorios", en cada 
# posición del vector un nombre de directorio.
# Además guarda la cantidad en Nº de directorios
directorios=(*/)
cantidad=${#directorios[@]}

# Muestra la cantidad y el nombre de los directorios con los que se va a 
# trabajar
echo -e "Se va a trabajar con los siguientes 'ÍTEMS'\n"
for (( i = 0; i < cantidad; i++ )); do
        echo "[$i]${directorios[$i]}"
    done
echo "En total $cantidad directorios"
echo "><><><><><><><><><><><><><><><"

# 1. Copia de seguridad del archivo dublin_core.xml
echo "Desea hacer copia de seguridad de los archivos dublin_core.xml (?)"
echo "1 : si | 2 : no"
read respuesta
if ((respuesta == 1)); then
    for (( i = 0; i < cantidad; i++ )); do
        cp ${directorios[$i]}dublin_core.xml ${directorios[$i]}dublin_core.xml.copia
    done
    echo "Fin de la copia de seguridad"
    echo "><><><><><><><><><><><><><><"
    echo -e "\n"
fi

# 2. Codifica todos los documentos dublin_core.xml a UTF-8
echo "Desea codificar todos los documentos dublin_core.xml a UTF-8 (?)"
echo "1 : si | 2 : no"
read respuesta
if ((respuesta == 1)); then
    for (( i = 0; i < cantidad; i++ )); do
        iconv -f iso-8859-1 ${directorios[$i]}dublin_core.xml -t utf-8 -o  ${directorios[$i]}dublin_core.xml
    done
    echo "Fin de la codificación a utf-8"
    echo "><><><><><><><><><><><><><><><"
    echo -e "\n"
fi
# 3. Extrae los metadatos con campos UADE y los guarda en metadata_uade.xml
echo "Desea extraer los metadatos con campos UADE  (?)"
echo "1 : si | 2 : no"
read respuesta
if ((respuesta == 1)); then
    for (( i = 0; i < cantidad; i++ )); do
        xsltproc --output ${directorios[$i]}metadata_uade.xml $ruta_actual/01.metadata_uade.xsl ${directorios[$i]}dublin_core.xml
    done
    echo "Fin de extracción metadatos UADE"
    echo "><><><><><><><><><><><><><><><><"
    echo -e "\n"
    
fi
# 4. Modifica, normaliza y ordena el documento principal dublin_core.xml
echo "Desea modificar, normalizar y ordenar el documento principal dublin_core.xml (?)"
echo "1 : si | 2 : no"
read respuesta
if ((respuesta == 1)); then
    for (( i = 0; i < cantidad; i++ )); do
        xsltproc --output ${directorios[$i]}dublin_core.xml $ruta_actual/02.dublin_core.xsl ${directorios[$i]}dublin_core.xml
    done
    echo "Fin de normalización de metadatos Dublin Core"
    echo "><><><><><><><><><><><><><><><><"
    echo -e "\n"
    
fi
# 5. Copia en cada directorio el documento "license.txt"
echo "Desea copiar en cada directorio el documento "license.txt"(?)"
echo "1 : si | 2 : no"
read respuesta
if ((respuesta == 1)); then
    for (( i = 0; i < cantidad; i++ )); do
        cp $ruta_actual/license.txt ${directorios[$i]}
    done
    echo "Fin de la copia de licencias"
    echo "><><><><><><><><><><><><><><><><"
    echo -e "\n"
fi
# 6. Borra de cada directorio todos los archivos con extensión jpg
echo "Desea borra de cada directorio todos los archivos con extensión jpg(?)"
echo "1 : si | 2 : no"
read respuesta
if ((respuesta == 1)); then
    for (( i = 0; i < cantidad; i++ )); do
        rm ${directorios[$i]}*.jpg
    done
    echo "Fin de la copia de licencias"
    echo "><><><><><><><><><><><><><><><><"
    echo -e "\n"
fi
# 7.1. Guarda en el vector PDF todos los nombres de los PDF de la colección
for (( i = 0; i < cantidad; i++ )); do
        cd ${directorios[$i]}
        pdf[$i]=`ls *.pdf`
        cd ..
    done
# 7.2. Modifica todos los archivos "contents" escribiendo en los mismos los 
# nombres de los pdf contenidos y la licencia
for (( i = 0; i < cantidad; i++ )); do
    echo -e "${pdf[$i]}\tbundle:ORIGINAL\tprimary:true\tlicense.txt\tbundle:LICENSE" > ${directorios[$i]}contents
done


# Fin del programa
echo "Fin del script"


# Futuras tareas de modificación:                                #
# 1. Adaptar el código con estructuras de datos más eficientes   #
# 2. Corregir aspectos estilísticos de presentación de código    #
# 3. Adaptar el código a Python. Beneficio: Multiplataforma      #
#----------------------------------------------------------------#
#-----------------------FIN DEL SCRIPT---------------------------#
#----------------------------------------------------------------#
# Autor: dforce2055                                              #
# Versión: v. 0.1 Alfa                                           #
# Licencia: GNU GPL v. 3.0                                       #
# Fecha: 09-07-2014                                              #
# @COPYLEFT ALLL WRONGS RESERVED                                 #
# Libre uso, copia, modificación y redistribución del script     #
# Siempre y cuando los mismos derechos sean preservados en las   #
# versiones modificadas/posteriores.                             #
# http://es.wikipedia.org/wiki/copyleft                          #
# https://es.wikipedia.org/wiki/GNU_General_Public_License       #
# CC BY NC SA                                                    #
#----------------------------------------------------------------# 
