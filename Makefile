SRC = $(wildcard *.c)
BIN = $(SRC:%.c=%)
CFLAGS = -O3 -Wall -Wextra -Wno-unused-parameter -pedantic -std=c11
CC = gcc

all: $(BIN)

clean:
	rm -rf $(BIN)

format:
	clang-format -i *.c
