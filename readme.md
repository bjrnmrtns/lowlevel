## How to debug
 1. start st-util -> ``st-util``
 2. start gdb -> ``gdb main.elf``
 3. in gdb run -> ``target remote-extended :4242``
 4. ``load``
 5. ``continue``
 6. ``ctrl-c``
 7. ``info registers``
