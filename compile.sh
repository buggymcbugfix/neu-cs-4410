set -ex
cd build
stack exec cs4410-exe -- $1 > $1.s
nasm -f macho64 -o $1.o $1.s
clang -g -o $1 ../main.c $1.o
./$1
