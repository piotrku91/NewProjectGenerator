#!/bin/bash

## PiotrQ Bash Script - C# Project Generator with GTest v0.1
## GitHub: https://github.com/piotrku91/newproject.git
## Author website: piotrq.eu


# Create folder of new project
echo "PiotrQ Bash Script - C# Project Generator"
echo "-----------------------------------------------------"
echo ""


if [ "$1" = "" ]; then
    echo "Usage: ./newproject_csharp.sh projectname "
    exit 0
fi

echo ""

if [ -e $1 ]; then
    echo "Folder" $1 "exists. Remove folder and try again... (rm -rf projectfolder)"
    exit 0
fi

echo "Create folder of new project... - " $1
dotnet new console -o $1

# Create default main.cpp
###################################################################################################
FILE2="Program.cs"
echo "Create default" $FILE2
###################################################################################################
echo "
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace "$1"
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine(\"Hello World!\");
        }
    }
}" >${PWD}/$1/$FILE2
###################################################################################################


###################################################################################################
echo "Build project..."
cd ${PWD}/$1/
dotnet run

###################################################################################################
