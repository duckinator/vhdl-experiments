NAME := vhdl_experiments
ALL_FILES := $(wildcard src/*.vhdl)

GHDL_FLAGS := --std=02 --work=${NAME}

all: ${NAME}

${NAME}: ${ALL_FILES}
	ghdl -a ${GHDL_FLAGS} ${ALL_FILES}

test: lint

lint: ${ALL_FILES}
	ghdl -s ${GHDL_FLAGS} ${ALL_FILES}

clean:
	find '(' -name '*.o' -o -name "${NAME}-*.cf" ')' -delete

.PHONY: all clean test clean
