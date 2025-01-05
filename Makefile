# Compilation Target
TARGET = calc.out

# Source files
ASM_SRC = sum.asm subtract.asm multiplication.asm division.asm
C_SRC = main.c

# Object files
ASM_OBJ = sum.o subtract.o multiplication.o division.o
C_OBJ = main.o

# Compiler
ASM_COMPILER = nasm
ASM_FLAGS = -f elf64
C_COMPILER = gcc
C_FLAGS = -g -Wall -m64

# Rules
all: $(TARGET)

	@echo "Linking object files"
$(TARGET): $(ASM_OBJ) $(C_OBJ)
	$(C_COMPILER) $(C_FLAGS) -o $@ $^

	@echo "Compiling assembly files"
sum.o: sum.asm
	$(ASM_COMPILER) $(ASM_FLAGS) -o sum.o sum.asm

subtract.o: subtract.asm
	$(ASM_COMPILER) $(ASM_FLAGS) -o subtract.o subtract.asm

multiplication.o: multiplication.asm
	$(ASM_COMPILER) $(ASM_FLAGS) -o multiplication.o multiplication.asm

division.o: division.asm
	$(ASM_COMPILER) $(ASM_FLAGS) -o division.o division.asm

	@echo "Compiling C files"
$(C_OBJ): $(C_SRC)
	$(C_COMPILER) -c $(C_FLAGS) -o $@ $<

clean:
	@echo "Removing object files"
	rm -f $(ASM_OBJ) $(C_OBJ)

.PHONY: all clean