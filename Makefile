CC := coqc

SRC := $(shell find ./ -type f -name '*.v')
OBJ := $(patsubst %.v, %.vo, $(SRC))

all: $(OBJ)

X86_64.vo: X86_64.v
	$(CC) $<

ArrayArith.vo: ArrayArith.v X86_64.vo
	$(CC) $<

clean:
	find ./ -type f -name '*.vo' -delete
	find ./ -type f -name '*.glob' -delete
	find ./ -type f -name '*~' -delete
