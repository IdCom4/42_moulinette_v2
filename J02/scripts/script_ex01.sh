# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script_ex01.sh                                       :+:      :+:    :+:  #
#                                                     +:+ +:+         +:+      #
#    By: idcornua <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/26 19:55:07 by idcornua          #+#    #+#              #
#    Updated: 2019/01/15 16:30:33 by idcornua         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# DEFINE VARIABLES
RED='\033[0;31m'
GREEN='\033[0;32m'
YELL='\033[1;33m'
ORNG='\033[0;33m'
BLUE='\033[1;34m'
NC='\033[0m'

J_NUM="02"
EX_NUM="01"
EX_NAME="ft_print_reverse_alphabet"
U_EX="user_${EX_NUM}_exe"
M_EX="moulinette_${EX_NUM}_exe"
FLAGS='-Wall -Wextra -Werror'
J_PATH=`pwd`
SCRIPT_LOC="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

echo -e "${ORNG}===================== EX01 =====================\n"
echo -e "" > error_log
echo -e "${BLUE}-- Compilation --${NC}\n"
echo -e "$> gcc -o user_exe ${FLAGS} main_ex${EX_NUM}.c ${EX_NAME}.c"

# COMPILE MOULINETTE FILES
gcc -o ${SCRIPT_LOC}/../${M_EX} ${FLAGS} ${SCRIPT_LOC}/../mains/m_ex${EX_NUM}.c ${SCRIPT_LOC}/../valid_exercices/ex${EX_NUM}.c ${SCRIPT_LOC}/../../common/*.c
# COMPILE USER FILES
gcc -o ${U_EX} ${FLAGS} ${SCRIPT_LOC}/../mains/m_ex${EX_NUM}.c ${J_PATH}/ex${EX_NUM}/${EX_NAME}.c ${SCRIPT_LOC}/../../common/*.c  2> error_log

# CHECKING COMPILATION ERRORS
ERROR=`cat error_log`

# STOPE HERE IF ERRORS 
if [ "${ERROR}" != "" ]
then
	echo -e "\n====> ${RED}FAILURE${NC} <===="
	echo -e "Does not compile.\n"
	exit
# ELSE PROCEEED
else
	echo -e "\n====> ${GREEN}SUCCESS${NC} <===="
	echo -e "Compilation OK.\n"
fi

# PRINT OUT THE START OF TESTS
echo -e "${BLUE}-- Test 01 --${NC}\n"
echo -e "$> ./${M_EX} > m_output"
echo -e "$> ./${U_EX} > u_output"
echo -e "\n$> diff -U 10 u_output m_output > m_diff\n"

# EXECUTING BOTH PROGRAMS
${SCRIPT_LOC}/../${M_EX} > m_output
./${U_EX} > u_output

# DIFFING THEM OUT
diff -U 10 u_output m_output > m_diff

# CHECKING DIFF RESULT
M_DIFF=`cat m_diff`
rm *_output *_diff  *_log *_exe
if [ "${M_DIFF}" != "" ]
then
	echo -e "${M_DIFF}"
	echo -e "\n====> ${RED}FAILURE${NC} <===="
	echo -e "Diff KO :(\n"
	exit 0
else
	echo -e "\n====> ${GREEN}SUCCESS${NC} <===="
	echo -e "Diff OK :D\n"
  exit 1
fi