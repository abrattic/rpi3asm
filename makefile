main:   
	aarch64-none-elf-as main.s -o main.o
	aarch64-none-elf-ld main.o -o kernel.elf
	aarch64-none-elf-objcopy kernel.elf -O binary kernel8.img

clean:
	rm *.o *.elf *.img
