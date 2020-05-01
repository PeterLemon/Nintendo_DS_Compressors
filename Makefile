SRC = $(wildcard *.c)
BIN = $(SRC:%.c=%)
CFLAGS = -O3 -Wall
CC = gcc

all: $(BIN)