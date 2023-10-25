#!/bin/bash

# Incluir los parametros del grafico
source $(dirname "$0")/ParamsLogConex.dat

# Definir los logs temporales:
Yo=$(basename ${0})                                         # Tomar el nombre de este script
Yo="${Yo%%.*}"                                              # Eliminar la extension del script
Yo="($(TZ=":America/Caracas" date +'%Y-%m-%d_%H%M') $Yo)"   # Agregar el time tag
Deb="$DirTmp/$Pos"-Debug.log                                # Log de debug de la última ejecución
Dat="$DirTmp/$Pos"_$Yo-10pings.dat                          # Log de 10 intentos de conexion
Scr="$DirTmp/$Pos"_$Yo-Magick.scr                           # Script para ImageMagick

# Sincronizar a Github pages
cd $(dirname "$0")    # Cambiar al directorio de este script (está eb /bash debajo de la raiz del repo)
cd ..                 #  y subir un nivel a la raiz del repo
git add .             # Registrar todos los archivos
git commit -m "Update del $(TZ=":America/Caracas" date +'%Y-%m-%d_%H:%M')"
echo "$Yo" >> $Deb
git push -u origin main >> $Deb
