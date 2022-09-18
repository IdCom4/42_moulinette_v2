# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script_all.sh                                       :+:      :+:    :+:   #
#                                                     +:+ +:+         +:+      #
#    By: idcornua <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/26 19:55:07 by idcornua          #+#    #+#              #
#    Updated: 2022/09/15 16:30:33 by idcornua         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# DEFINE VARIABLES
# colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELL='\033[1;33m'
ORNG='\033[0;33m'
BLUE='\033[1;34m'
NC='\033[0m'

# ex & day properties
J_NUM="02"
EX_AMOUNT=8

# paths
SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
J_PATH=`pwd`

EX_POINTS=()
TOTAL_POINTS=0

# for each exercise, run his associated script
for (( EX = 0; EX < $EX_AMOUNT; EX++ ))
do
  FORMATED_EX=$EX
  if [ $EX -lt 10 ]; then FORMATED_EX="0$EX"; fi
  
	bash ${SCRIPT_PATH}/script_ex${FORMATED_EX}.sh

  if [ $(echo $?) -eq "1" ]
  then
    EX_POINTS+=("1")
    ((TOTAL_POINTS=TOTAL_POINTS+1))
  else
    EX_POINTS+=("0")
  fi
done

RESULTS_PERCENTAGE="$(echo `expr $TOTAL_POINTS \* 100 / ${EX_AMOUNT}`)"

echo -e "\n\n${ORNG}===================== FINAL RESULT OF J${J_NUM} =====================${NC}\n"

# print out results
for (( EX = 0; EX < $EX_AMOUNT; EX++ ))
do
  FORMATED_EX=$EX
  if [ $EX -lt 10 ]; then FORMATED_EX="0$EX"; fi

  echo -en "ex${FORMATED_EX} ... "
  if [ ${EX_POINTS[$EX]} -eq 1 ]
  then echo -e "[${GREEN}OK${NC}]"
  else echo -e "[${RED}KO${NC}]"
  fi
done

echo -e "\n${NC}Total: $TOTAL_POINTS/${EX_AMOUNT} (${RESULTS_PERCENTAGE}%)"

if [ $RESULTS_PERCENTAGE -lt 80 ]
then
  echo -e "\n====> ${RED}FAILURE${NC} <===="
	echo -e "KO ! Minimum to pass is 80% :(\n"
else
	echo -e "\n====> ${GREEN}SUCCESS${NC} <===="
	echo -e "OK :D\n"
fi