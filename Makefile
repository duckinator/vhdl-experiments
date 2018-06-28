NAME := vhdl-experiments
ALL_FILES := $(wildcard src/*.vhdl)

GHDL_FLAGS := --std=02 --work=${NAME}

all: ${NAME}

${NAME}: ${ALL_FILES}
	ghdl -a ${ALL_FILES}

test: lint

lint: ${ALL_FILES}
	ghdl ${GHDL_FLAGS} -s ${ALL_FILES}

clean:
	find '(' -name '*.o' -o -name 'work-*.cf' ')' -delete

.PHONY: all clean test clean
