# JSON-Parser
A json file parser using lex

To convert this file into a C source and a C header:

bison -d sample.y

To convert this file into a C source :

flex sample.l

COMPILATION

gcc -o validate sample.tab.c lex.yy.c


TESTING

cat sample.json | ./validate

echo "Hello"| ./validate
