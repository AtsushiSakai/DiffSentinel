#!/usr/bin/env bash
#
# Diff based python style checker plugin for DiffSentinel
#
# This plugin needs to install "pycodestyle"
#
# Author: Atsushi Sakai (@Atsushi_twi)
#

#######################################
# check diff for .py file
# Globals:
#   GIT_ROOT_DIR
# Arguments:
#   branch commit
# Outputs:
#   None
#######################################
function check_diff_py(){
    echo "start check_diff_py"
    cd ${GIT_ROOT_DIR}
    local branch_commit=$1
    git diff -U0 ${branch_commit} -- '*'.py | pycodestyle --diff
    check_result=$?
    if [[ ${check_result} -ne 0 ]];
    then
        echo "Error: Your changes contain pycodestyle errors."
        exit 1
    fi
    cd $SCRIPT_DIR
}