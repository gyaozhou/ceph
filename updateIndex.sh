#!/bin/bash

date
find . \( -path './src/test' -or -path './qa' \) -and -prune -or -type f \( -name "*.[ch]" -or -name "*.cc" -or -name "*.cpp" \)  -print > cscope.files
cscope -b


find  . -name \*.py -print | xargs etags

date

