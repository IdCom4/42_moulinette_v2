# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script_ex00.sh                                      :+:      :+:    :+:   #
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
EX_NUM="00"
EX_NAME="ft_print_alphabet"
USER_PROG="user_${EX_NUM}_exe"
REF_PROG="moulinette_${EX_NUM}_exe"
FLAGS='-Wall -Wextra -Werror'

# paths
SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
J_PATH=`pwd`
OUTPUTS_PATH="${SCRIPT_PATH}/../outputs"
MAINS_PATH="${SCRIPT_PATH}/../mains"
REF_FILES_PATH="${SCRIPT_PATH}/../references_files"
COMMON_PATH="${SCRIPT_PATH}/../../common"

DEPENDANCIES="${COMMON_PATH}/ft_putchar.c"

[ -d ${OUTPUTS_PATH} ] || mkdir ${OUTPUTS_PATH}

echo -e "${ORNG}===================== EX00 =====================\n"
echo -e "" > error_log
echo -e "${BLUE}-- Compilation --${NC}\n"
echo -e "$> gcc -o user_exe ${FLAGS} main_ex${EX_NUM}.c ${EX_NAME}.c"

# COMPILE MOULINETTE FILES
gcc -o ${OUTPUTS_PATH}/${REF_PROG} ${FLAGS} ${MAINS_PATH}/m_ex${EX_NUM}.c ${REF_FILES_PATH}/ex${EX_NUM}.c ${DEPENDANCIES}
# COMPILE USER FILES
gcc -o ${OUTPUTS_PATH}/${USER_PROG} ${FLAGS} ${MAINS_PATH}/m_ex${EX_NUM}.c ${J_PATH}/ex${EX_NUM}/${EX_NAME}.c ${DEPENDANCIES}  2> error_log

# CHECKING COMPILATION ERRORS
ERROR=`cat error_log`

# STOP HERE IF ERRORS 
if [ "${ERROR}" != "" ]
then
	rm ${OUTPUTS_PATH}/* > /dev/null 2>&1
  echo -e "\n====> ${RED}FAILURE${NC} <===="
	echo -e "Does not compile.\n"
	exit
# ELSE PROCEED
else
	echo -e "\n====> ${GREEN}SUCCESS${NC} <===="
	echo -e "Compilation OK.\n"
fi

# PRINT OUT THE START OF TESTS
echo -e "${BLUE}-- Test 01 --${NC}\n"
echo -e "$> ./${REF_PROG} > m_output"
echo -e "$> ./${USER_PROG} > u_output"
echo -e "\n$> diff -U 10 u_output m_output > m_diff\n"

# EXECUTING BOTH PROGRAMS
${OUTPUTS_PATH}/${REF_PROG} > ${OUTPUTS_PATH}/m_output
${OUTPUTS_PATH}/${USER_PROG} > ${OUTPUTS_PATH}/u_output

# DIFFING THEM OUT
diff -U 10 ${OUTPUTS_PATH}/u_output ${OUTPUTS_PATH}/m_output > ${OUTPUTS_PATH}/m_diff

# CHECKING DIFF RESULT
M_DIFF=`cat ${OUTPUTS_PATH}/m_diff`
rm ${OUTPUTS_PATH}/* > /dev/null 2>&1
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