# /bin/bash

# Takes one or mmore directories as arguments
DIR_LIST=${@}

# DO NOT include trailing slash in git directory home path
# TODO: Move git path and output file into separate properties file to externalize configuration
GIT_HOME_PATH="/home/ssitani/git_repos"

# name of, and path to, the output file, currently hard-coded

WORKING_DIR=${pwd}
#OUTPUT_FILE_NAME="remotelist-test1.txt"
OUTPUT_FILE_PATH="../remotelist-export_2018-12-02.txt"
# OUTPUT_FILE_PATH="${pwd}/${OUTPUT_FILE_NAME}"

for dir in $DIR_LIST
do

        if [ -d ${GIT_HOME_PATH}/${dir} ] ; then

            dir_name="${dir}"

            cd ${GIT_HOME_PATH}/${dir_name}

            #print the name of the current repo directory
            #echo "[DEBUG]: $(dir_name)"

            echo "# ${dir_name}" >> ${OUTPUT_FILE_PATH}

            # print the matched entry
            #echo "[DEBUG]: $(git remote -v | egrep -io ".*[[:space:]](git@git).*(.git)")"

            git remote -v | egrep -io ".*(.git)" >> ${OUTPUT_FILE_PATH}

            echo " " >> ${OUTPUT_FILE_PATH}

            cd ${GIT_HOME_PATH}

        fi
done

exit 0
