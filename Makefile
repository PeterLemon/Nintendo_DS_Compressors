SRC = $(wildcard *.c)
BIN = $(SRC:%.c=%)
CFLAGS = -O3 -Wall -Wextra -Wno-unused-parameter -pedantic -std=c99
CC = gcc

all: $(BIN)