# https://devhints.io/makefile

BUILD = build

%.run: %.o
	clang -g -o BUILD/$@ main.c BUILD/$<

%.o: %.s
	nasm -f macho64 -o BUILD/$@ BUILD/$<

%.s: %.int
	stack exec cs4410-exe -- $* > BUILD/$@
