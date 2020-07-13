#!/bin/bash

date
find . \( -path './src/test' -or -path './qa' \) -and -prune -or -type f \( -name "*.[ch]" -or -name "*.cc" -or -name "*.cpp" -or -name "*.hpp" \)  -print > cscope.files

#find . -type f -name *.cc >> cscope.files
#find . -type f -name *.C >> cscope.files
#find . -type f -name *.hh >> cscope.files

if [ $# -eq 1 ]; then
    # remove test related files
    echo "excludes some test files..."
    mv cscope.files cscope.files.bak
    sed -e '/_test/d;/UnitTest/d;/crimson/d;/\/test\//d' cscope.files.bak > cscope.files
    rm -f cscope.files.bak
fi

cscope -b


find  . -name \*.py -print | xargs etags

date

