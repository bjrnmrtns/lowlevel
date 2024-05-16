CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
LD = arm-none-eabi-ld
BIN = arm-none-eabi-objcopy
STL = st-flash
CFLAGS = -O0 -mthumb -mcpu=cortex-m3 -Wall

all: main.bin

start.o: start.s
	$(AS) -o start.o start.s

main.elf: linker.ld start.o
	$(LD) -T linker.ld -o main.elf start.o

main.bin: main.elf
	$(BIN) -O binary main.elf main.bin

clean:
	rm -f *.o *.elf *.bin

flash: main.bin
	$(STL) write main.bin 0x8000000

erase:
	$(STL) erase
