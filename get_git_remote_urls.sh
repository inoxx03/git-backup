# /bin/bash

DIR_LIST=${@}

# DO NOT include trailing slash in git directory home path
# TODO: Move git path and output file into separate properties file to externalize configuration
GIT_HOME_PATH="/home/ssitani/git_repos"

OUTPUT_FILE_NAME="../remotelist-test1.txt"

for dir in $DIR_LIST
do

        if [ -d ${GIT_HOME_PATH}/${dir} ] ; then

            dir_name="${dir}"

            cd ${GIT_HOME_PATH}/${dir_name}

            #print the name of the current repo directory
            #echo "[DEBUG]: $(dir_name)"

            echo "# ${dir_name}" >> ${OUTPUT_FILE_NAME}

            # print the matched entry
            #echo "[DEBUG]: $(git remote -v | egrep -io ".*[[:space:]](git@git).*(.git)")"

            git remote -v | egrep -io ".*(.git)" >> ${OUTPUT_FILE_NAME}

            echo " " >> ${OUTPUT_FILE_NAME}

            cd ${GIT_HOME_PATH}

        fi
done

exit 0
