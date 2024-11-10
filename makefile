CROSS_COMPILE=aarch64-none-elf-

SRC = main.s
OBJ = main.o
ELF = kernel.elf
IMG = kernel8.img

all: $(IMG)

$(OBJ): $(SRC)
	$(CROSS_COMPILE)as $< -o $@

$(ELF): $(OBJ)
	$(CROSS_COMPILE)ld $< -o $@

$(IMG): $(ELF)
	$(CROSS_COMPILE)objcopy $< -O binary $@

clean:
	rm -f *.o *.elf *.img

.PHONY: all clean

