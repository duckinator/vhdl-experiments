NAME := hello_world

SRC_FILES := $(wildcard src/*.vhdl)
OBJ_FILES := $(patsubst src/%.vhdl,%.o,${SRC_FILES})

GHDL_FLAGS := --std=02

all: ${NAME}

%.o: src/%.vhdl
	ghdl -a ${GHDL_FLAGS} $<

${NAME}: ${OBJ_FILES}
	ghdl -e ${GHDL_FLAGS} ${NAME}

test: lint ${NAME}
	ghdl -r ${GHDL_FLAGS} ${NAME}

lint: ${ALL_FILES}
	ghdl -s ${GHDL_FLAGS} ${ALL_FILES}

clean:
	ghdl --clean
	find '(' -name '*.o' -o -name '*.cf' ')' -delete

.PHONY: all clean test clean
