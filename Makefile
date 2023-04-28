EXE = cruscotto
AS = as --32
LD = ld -m elf_i386
FLAGS = -gstabs
OBJ = cruscotto.o
SRC = cruscotto.s

all: $(EXE)

$(EXE): $(OBJ)
	$(LD) -o bin/$(EXE) obj/$(OBJ)
$(OBJ): src/*.s src/*/*/*.s
	$(AS) $(FLAGS) -o obj/$(OBJ) src/*.s src/*/*/*.s
clean:
	rm -f obj/*.o bin/$(EXE) core