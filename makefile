main:   
	arm-none-eabi-as main.s -o main.o
	arm-none-eabi-ld main.o -o kernel.elf
	arm-none-eabi-objcopy kernel.elf -O binary kernel7.img

clean:
	rm *.o *.elf *.img
