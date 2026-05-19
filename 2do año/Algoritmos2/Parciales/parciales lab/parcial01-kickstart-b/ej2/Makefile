# Compiler and flags
CC = gcc
CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99 -g

all: ej2

# Build the main program
ej2: main.c queries.c weather.c weather_table.c queries.h weather.h weather_table.h
	$(CC) $(CFLAGS) -o $@ main.c queries.c weather.c weather_table.c

# Build the test program
tests: tests.c queries.c weather.c weather_table.c queries.h weather.h weather_table.h
	$(CC) $(CFLAGS) -o $@ tests.c queries.c weather.c weather_table.c

clean:
	rm -f ej2 tests *.o
