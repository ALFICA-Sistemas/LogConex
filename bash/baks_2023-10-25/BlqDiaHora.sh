#!/bin/bash

# Incluir los parametros del grafico
source $(dirname "$0")/ParamsLogConex.dat

# VERIFICACION DE ARGUMENTOS, explicar uso si no se pasaron:
if [ $# -eq 0 ]; then         # Si no se pasan argumentos, mostrar como se usa
  echo "USO: BlqDiaHora.sh {1..31} {1..144} /path/a/imagengrid 10intentos"
  echo " el primer  argumento es la fecha del mes, que determina el numero de la fila"
  echo " el segundo argumento es el bloque de 10 minutos, que determina el numero de la columna"
  echo " el tercer argumento es el path y nombre del archivo con la imagen del mes"
  echo " el cuarto argumento es el string con los 10 resultados del último bloque de 10 minutos"
  exit
fi
# ..../BlqDiaHora.sh 22 87 /Discos/Local/web/LogConex/202309_ipify.png ##########

# VALIDACION DE ARGUMENTOS Y ASIGNACION A VARIABLES MEMORABLES:
Fil=$1                                                                  # Pasar el argumento a una variable leible
  if [ -z "$Fil" ]; then Fil=1; fi                                      # Si no se recibió valor o es vacío, asignar el default
  if [ $Fil -lt 1 ]; then Fil=1; fi                                     # Si el valor es menos que el minimo, asignar el minimo
  if [ $Fil -gt 31 ]; then Fil=31; fi                                   # Si el valor es mayor que el maximo, asignar el maximo
  Fil=$(echo $Fil | sed 's/^0*//')                                      # ELiminar el cero precedente para que no lo confunda confunda con octal y explote en "08"
Col=$2                                                                  # Pasar el argumento a una variable leible
  if [ -z "$Col" ]; then Col=1; fi                                      # Si no se recibió valor o es vacío, asignar el default
  if [ $Col -lt 1 ]; then Col=1; fi                                     # Si el valor es menos que el minimo, asignar el minimo
  if [ $Col -gt 144 ]; then Col=144; fi                                 # Si el valor es mayor que el maximo, asignar el maximo
  Col=$(echo $Col | sed 's/^0*//')                                      # ELiminar el cero precedente para que no lo confunda confunda con octal y explote en "08"
Img=$3                                                                  # Pasar el argumento a una variable leible
  if [ -z $Img ]; then                                                  # Si el path/imagen tiene longitud cero,
    Img=$(dirname ${0})                                                 # Iniciarla con el path de este script,
    Img=$Img"/"$(TZ=":America/Caracas" date +'%Y%m')".png"              #  y agregar por defecto AñoMes.png
  fi
Dat=$4                                                                  # Pasar el argumento a una variable leible
    if [ -z $Dat ]; then                                                # Si el dato del bloque tiene longitud cero,
    Dat="$CarOk$CarNo$CarNR$CarOk$CarNo$CarNR$CarOk$CarNo$CarNR$CarOk"  #  crear un default alternando OK-No-NR
  fi
Pos=$5

# Definir los logs temporales:
Yo=$(basename ${0})                                                     # Tomar el nombre de este script
Yo="${Yo%%.*}"                                                          # Eliminar la extension del script
Deb="$DirTmp/$Pos"-Debug.log                                            # Log de debug de la última ejecución
# Dat="$DirTmp/$Pos"_$Yo-10pings.dat                                    # Log de 10 intentos de conexion
Scr="$DirTmp/$Pos"_$Yo-Magick.scr                                       # Script para ImageMagick

echo "($Yo) $0 $1 $2 $3 $4" >> $Deb                                     # Registrar el comando con el que se ejecutó
echo "($Yo) $Fil $Col $Img $Dat" >> $Deb                                # Registrar el comando interpretado
echo "($Yo) DEB: $Deb DAT:$Dat SCR:$Scr" >> $Deb                        # Registrar los temporales

# Asegurar la existencia de la imagen sobre la cual se dibujara el bloque
if [ ! -f $Img ]; then                                                  # Si el archivo NO existe,
  echo "($Yo) No existe $Img, crearlo" >> $Deb
  echo "($Yo) $(dirname ${0})"/"MesVacio.sh $Img $Pos"  >> $Deb
              $(dirname ${0})"/"MesVacio.sh $Img $Pos                   #  ejecotar el generador de imagen del mes vacio
fi

echo "($Yo) Dibujar bloque en la columna" $Col "y fila" $Fil "con el log" $Dat "en la imagen" $Img >> $Deb
echo "$Mon $Img " > $Scr 
# Calcular los limites horizontales del bloque:
X1=$(( $mIzq + $bIzq + ($Col-1) * ($ColAncho + $ColSep) +1 ))
X2=$(( $X1 + $ColAncho - $ColSep ))
echo "($Yo) Bloque desde X=$X1 hasta X=$X2 con las muestras: $Dat" >> $Deb
# Recorrer los 10 niveles del bloque
for M in {0..9}; do
  echo -n "($Yo)   Muestra $M: ${Dat:$M:1} " >> $Deb
  
  Y=$(( $mSup + $bSup + $Fil * ( $FilAlto + $FilSep ) -$M -2 ))         # Calcular la coordenada Y de la linea M en esta fila:
   echo -n "en la coordenada Y=$Y" >> $Deb
   case ${Dat:$M:1} in                                                  # Decidir el color de cada linea según el caracter num M del log:
    $CarOk)
      Color=$ColorOk
      echo " de color" $Color >> $Deb
      echo " -stroke xc:$Color -draw 'line $X1,$Y $X2,$Y'" >> $Scr      # Agregar el trazado de la línea al script
    ;;&
    $CarNo)
      Color=$ColorNo
      echo " de color" $Color >> $Deb
      echo " -stroke xc:$Color -draw 'line $X1,$Y $X2,$Y'" >> $Scr      # Agregar el trazado de la línea al script
    ;;&
    $CarNR)
      echo "" >> $Deb
    ;;&
    *)
      # No trazar nada
  esac
done
echo "$Mon -write $Img" >> $Scr                                         # Terminar el script escribiendo al archivo de imagen del mes
echo "/usr/local/bin/magick -script $Scr" >> $Deb
      /usr/local/bin/magick -script $Scr                                # Ejecutar ImageMagic con el script generado 

echo "" >> $Deb                                                         # Separar del log de la siguiente ejecucion
