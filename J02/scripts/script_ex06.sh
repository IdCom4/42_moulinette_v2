# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script_ex06.sh                                       :+:      :+:    :+:  #
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
EX_NUM="06"
EX_NAME="ft_putnbr"
USER_PROG="user_${EX_NUM}_exe"
REF_PROG="moulinette_${EX_NUM}_exe"
FLAGS='-Wall -Wextra -Werror'

# paths
SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
J_PATH=`pwd`
REF_PROG_PATH="${SCRIPT_PATH}/.."
MAINS_PATH="${SCRIPT_PATH}/../mains"
REF_FILES_PATH="${SCRIPT_PATH}/../references_files"
COMMON_PATH="${SCRIPT_PATH}/../../common"

DEPENDANCIES="${COMMON_PATH}/ft_putchar.c"

echo -e "${ORNG}===================== EX06 =====================\n"
echo -e "" > error_log
echo -e "${BLUE}-- Compilation --${NC}\n"
echo -e "$> gcc -o user_exe ${FLAGS} main_ex${EX_NUM}.c ${EX_NAME}.c"

# COMPILE MOULINETTE FILES
gcc -o ${REF_PROG_PATH}/${REF_PROG} ${FLAGS} ${MAINS_PATH}/m_ex${EX_NUM}.c ${REF_FILES_PATH}/ex${EX_NUM}.c ${DEPENDANCIES}
# COMPILE USER FILES
gcc -o ${USER_PROG} ${FLAGS} ${MAINS_PATH}/m_ex${EX_NUM}.c ${J_PATH}/ex${EX_NUM}/${EX_NAME}.c ${DEPENDANCIES}  2> error_log

# CHECKING COMPILATION ERRORS
ERROR=`cat error_log`

# STOP HERE IF ERRORS 
if [ "${ERROR}" != "" ]
then
	echo -e "\n====> ${RED}FAILURE${NC} <===="
	echo -e "Does not compile.\n"
	exit
# ELSE PROCEED
else
	echo -e "\n====> ${GREEN}SUCCESS${NC} <===="
	echo -e "Compilation OK.\n"
fi

ARRAY_OF_TEST_VALUES=(-10 -3 -1 0 -0 1 3 10 -5783 39641 -2147483648 2147483647)

for i in "${!ARRAY_OF_TEST_VALUES[@]}";
do 
  echo -e "\n${BLUE}-- Test 0$i --${NC}\n"
  echo -e "$> ./${REF_PROG} ${ARRAY_OF_TEST_VALUES[$i]} > m_output"
  echo -e "$> ./${USER_PROG} ${ARRAY_OF_TEST_VALUES[$i]} > u_output"
  echo -e "\n$> diff -U 10 u_output m_output > m_diff\n"

  # EXECUTING BOTH PROGRAMS
  ${REF_PROG_PATH}/${REF_PROG} ${ARRAY_OF_TEST_VALUES[$i]} > m_output
  ./${USER_PROG} ${ARRAY_OF_TEST_VALUES[$i]} > u_output

  # DIFFING THEM OUT
  diff -U 10 u_output m_output > m_${i}_diff
  TEST_DIFF=`cat m_${i}_diff`
  echo $TEST_DIFF >> m_diff

  if [ "${TEST_DIFF}" != "" ]
  then
    echo -e "${TEST_DIFF}"
  else
    echo -e "Test OK."
  fi
done

# CHECKING DIFF RESULT
M_DIFF=`cat m_diff`
rm *_output *_diff  *_log *_exe ${SCRIPT_PATH}/../*_exe
if [ "${M_DIFF}" != "" ]
then
  echo -e "\n====> ${RED}FAILURE${NC} <===="
  echo -e "Diff KO :(\n"
  exit 0
else
	echo -e "\n====> ${GREEN}SUCCESS${NC} <===="
	echo -e "Diff OK :D\n"
  exit 1
fi