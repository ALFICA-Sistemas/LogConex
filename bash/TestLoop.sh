#!/bin/bash

# Scr=$(dirname "$0")/BlqDiaHora.sh
# for B in {1..31}; do
#   $Scr $B $(( $B+62 )) 0000000000
# done

# Incluir los parametros del grafico
source $(dirname "$0")/ParamsGraf.dat

Log=$1

# Recorrer los 10 niveles del bloque
echo "$CarOk $CarNo $CarNR"
for Y in {0..9}; do
  # Decidir el color de cada linea según el caracter num Y del log:
   case ${Log:$Y:1} in
    $CarOk)
      Color=$ColorOk
    ;;&
    $CarNo)
      Color=$ColorNo
    ;;&
    $CarNR)
      Color=$ColorNG
  esac
done