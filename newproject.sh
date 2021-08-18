#!/bin/bash

## PiotrQ Bash Script - C++ Project Generator with GTest v0.1
## GitHub: https://github.com/piotrku91/newproject.git
## Author website: piotrq.eu


# Create folder of new project
echo "PiotrQ Bash Script - C++ Project Generator with GTest"
echo "-----------------------------------------------------"
echo ""


if [ "$1" = "" ]; then
    echo "Usage: ./newproject.sh projectname [testincludeflag]"
    echo "Example: ./newproject.sh newproj -t (create project with Gtest)"
    echo "Example: ./newproject.sh newproj (create project without Gtest)"
    exit 0
fi

echo ""

if [ -e $1 ]; then
    echo "Folder" $1 "exists. Remove folder and try again... (rm -rf projectfolder)"
    exit 0
fi

echo "Create folder of new project... - " $1
mkdir $1

COMMENTCHAR="#"
if [ "$2" = "-t" ]; then
    echo "GTest prepared to include to project..."
    COMMENTCHAR=""
fi

# Create CMakeLists.txt
###################################################################################################
FILE1="CMakeLists.txt"
echo "Create" $FILE1
###################################################################################################
echo "cmake_minimum_required(VERSION 3.14)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
project("$1")

"$COMMENTCHAR"include(FetchContent)
"$COMMENTCHAR"FetchContent_Declare(
"$COMMENTCHAR"  googletest
"$COMMENTCHAR"  # Specify the commit you depend on and update it regularly.
"$COMMENTCHAR"  URL https://github.com/google/googletest/archive/609281088cfefc76f9d0ce82e1ff6c30cc3591e5.zip
"$COMMENTCHAR")
"$COMMENTCHAR"# For Windows: Prevent overriding the parent project's compiler/linker settings
"$COMMENTCHAR"set(gtest_force_shared_crt ON CACHE BOOL \"\" FORCE)
"$COMMENTCHAR"FetchContent_MakeAvailable(googletest)

set(FLAGS -Wall -Wextra -Werror -Wconversion -pedantic -pedantic-errors -g)
add_compile_options(\${FLAGS})

"$COMMENTCHAR"enable_testing()

add_executable(\${PROJECT_NAME} main.cpp)
"$COMMENTCHAR"add_executable(\${PROJECT_NAME}-ut test.cpp)

"$COMMENTCHAR"target_link_libraries(\${PROJECT_NAME}-ut gtest_main)
"$COMMENTCHAR"add_test(NAME \${PROJECT_NAME}_test COMMAND \${PROJECT_NAME}-ut)" >>${PWD}/$1/$FILE1
###################################################################################################

# Create default main.cpp
###################################################################################################
FILE2="main.cpp"
echo "Create default" $FILE2
###################################################################################################
echo "
#include <iostream>

int main() 
{
std::cout << \"Hello World!\" << std::endl;

}" >>${PWD}/$1/$FILE2
###################################################################################################

# Create default test.cpp
if [ "$2" = "-t" ]; then
    ###################################################################################################
    FILE3="test.cpp"
    echo "Create test file" $FILE3
    ###################################################################################################
    echo "
#include \"gtest/gtest.h\"

TEST(defaultTest, ShouldDoSth) 
{

}

" >>${PWD}/$1/$FILE3
###################################################################################################
fi

###################################################################################################
echo "Build project..."
cd ${PWD}/$1/
mkdir build
cd build
cmake ..
make -j && ./$1
###################################################################################################
