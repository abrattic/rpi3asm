main:
	aarch64-none-elf-as start.s -o start.o
	aarch64-none-elf-ld start.o -o kernel8.elf
	aarch64-none-elf-objcopy kernel8.elf -O binary kernel8.img

