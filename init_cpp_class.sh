# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init_class.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bahaas <bahaas@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/30 18:33:18 by bahaas            #+#    #+#              #
#    Updated: 2021/01/02 04:36:57 by bahaas           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

#colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

class_creation()
{
	FILE=${CLASS_NAME}.hpp
	CLASS_NAME_MAJ=$(echo ${CLASS_NAME} | tr '[:lower:]' '[:upper:]')

	#create class.hpp file with 42header + define + constructor/destructor
	vim -c "Stdheader" -c "wq" ${FILE}
	sed -i '$ d' ${FILE}
	echo "#ifndef ${CLASS_NAME_MAJ}_CLASS_HPP\n#define ${CLASS_NAME_MAJ}_CLASS_HPP\n\nclass ${CLASS_NAME}\n{\n	public:\n\n		${CLASS_NAME}(void);\n		~${CLASS_NAME}(void);\n};\n\n#endif" >> ${FILE}
	echo "#endif" >> ${FILE}

	#create class.cpp file
	vim -c "Stdheader" -c "wq" ${CLASS_NAME}.cpp
	sed -i '$ d' ${FILE}
	echo "#include \"${FILE}\"" >> ${CLASS_NAME}.cpp
	
	#display informations
	echo "The file [${GREEN}${CLASS_NAME}.cpp${NC}] & [${BLUE}${CLASS_NAME}.hpp${NC}] have been created"
}

if [ $# -eq 0 ]; then
	read -p "Please enter the name of your class : " CLASS_NAME
	class_creation
else
	for CLASS_NAME in "$@"; do
		class_creation
	done
fi
