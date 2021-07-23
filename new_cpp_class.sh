#!/bin/bash

#colors
BLUE="\033[0;34m"
GREEN="\033[0;32m"
NC="\033[0m"

class_creation()
{
	FILE=${CLASS_NAME^}.hpp
	CLASS_NAME_MAJ=$(echo ${CLASS_NAME} | tr '[:lower:]' '[:upper:]')

	#create class.hpp file with 42header + define + constructor/destructor
	vim -c "Stdheader" -c "wq" ${FILE}
	sed -i '$ d' ${FILE}
	echo -e "#ifndef ${CLASS_NAME_MAJ}_HPP\n#define ${CLASS_NAME_MAJ}_HPP\n\nclass ${CLASS_NAME^}\n{\n\tpublic:\n\t\t${CLASS_NAME^}(void);\n		~${CLASS_NAME^}(void);\n\tprivate:\n};\n\n#endif" >> ${FILE}

	#create class.cpp file
	vim -c "Stdheader" -c "wq" ${CLASS_NAME^}.cpp
	sed -i '$ d' ${CLASS_NAME^}.cpp
	echo -e "#include \"${FILE}\"" >> ${CLASS_NAME^}.cpp
	echo -e "\n${CLASS_NAME^}::${CLASS_NAME^}()\n{\n}" >> ${CLASS_NAME^}.cpp
	echo -e "\n${CLASS_NAME^}::~${CLASS_NAME^}()\n{\n}" >> ${CLASS_NAME^}.cpp
	
	#display informations
	echo -e "The file [${GREEN}${CLASS_NAME^}.cpp${NC}] & [${BLUE}${CLASS_NAME^}.hpp${NC}] are up"
}

if [ $# -eq 0 ]; then
	read -p "Type new class name : " CLASS_NAME
	class_creation
else
	for CLASS_NAME in "$@"; do
		class_creation
	done
fi
