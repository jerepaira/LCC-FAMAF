# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -std=c99

all: tests

# Build targets
tests: tests.c merge_sort.c merge_sort.h
	$(CC) $(CFLAGS) -o tests tests.c merge_sort.c

# Run target
run: tests
	./tests

# Clean target
clean:
	rm -f tests merge_sort.o
