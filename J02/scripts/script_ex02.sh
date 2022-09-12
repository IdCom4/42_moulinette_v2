# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script_ex02.sh                                       :+:      :+:    :+:  #
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
EX_NUM="02"
EX_NAME="ft_print_numbers"
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

echo -e "${ORNG}===================== EX02 =====================\n"
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

# PRINT OUT THE START OF TESTS
echo -e "${BLUE}-- Test 01 --${NC}\n"
echo -e "$> ./${REF_PROG} > m_output"
echo -e "$> ./${USER_PROG} > u_output"
echo -e "\n$> diff -U 10 u_output m_output > m_diff\n"

# EXECUTING BOTH PROGRAMS
${SCRIPT_PATH}/../${REF_PROG} > m_output
./${USER_PROG} > u_output

# DIFFING THEM OUT
diff -U 10 u_output m_output > m_diff

# CHECKING DIFF RESULT
M_DIFF=`cat m_diff`
rm *_output *_diff  *_log *_exe ${SCRIPT_PATH}/../*_exe
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