# newproject

### PiotrQ Bash Script - C++ Project Generator with GTest v0.1

It's very easy to start new project C++ for exercises or whatever you need.


Script creates and builds C++ project folder CMake and optional GTest

main.cpp file prints "Hello world!"


If you use test flag scripts generates file test.cpp with empty case of test and also uncomment GTest include in CMakeLists.txt







## How to use the script

>   Create project folder without GTest:

    git clone https://github.com/piotrku91/newproject.git
    cd newproject
    chmod +x newproject.sh
    ./newproject.sh yourprojectname
    
>   Create project folder with GTest:

    git clone https://github.com/piotrku91/newproject.git
    cd newproject
    chmod +x newproject.sh
    ./newproject.sh yourprojectname -t

If you have newproject.sh on harddisk just move it to destination folder and execute by ./newproject.sh yourprojectname -t
    
