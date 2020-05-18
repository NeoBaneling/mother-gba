PRODUCT_NAME       = Project
SOURCES            = main.c myLib.c bugmoonl.c hackingl.c portelythl.c spaceInvaders.c shruden.c sound.c spritesheet.c sprites.c start.c bugMoonPause.c hackingPause.c portelythPause.c menu.c eclipse.c win.c sonata.c hackingbg.c hackingcm.c portelythbg.c portelythFar.c portelythcm.c bugMoonStarsFar.c bugMoonStarsNear.c startbg.c gamebg.c pausebg.c winbg.c losebg.c Blaster.c CloudlandRegion.c CollisionBody.c Levels.c MenuNav.c MeufordReset.c MotherMainTheme.c MusselReset.c Scare.c Scifi.c Tagirijus.c VangIsSomewhatIntenseAtTimes.c VangReset.c WinSound.c
CCPATH             = /usr/bin
DKPATH             = "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/devkitARM/bin"
VBASIM             = open "/Users/Joeysaurus/Desktop/CS2261-A/Lab00_OSX/Installation Files/visualboyadvance-m.app"
FIND               = find
COPY               = cp -r

# --- File Names
ELF_NAME           = $(PRODUCT_NAME).elf
ROM_NAME           = $(PRODUCT_NAME).gba
BIN_NAME           = $(PRODUCT_NAME)

#MODEL              = -mthumb-interwork -mthumb
MODEL              = -mthumb-interwork -marm -mlong-calls #This makes interrupts work
SPECS              = -specs=gba.specs

# --- Archiver
AS                 = $(DKPATH)/arm-none-eabi-as
ASFLAGS            = -mthumb-interwork

# --- Compiler
CC                 = $(DKPATH)/arm-none-eabi-gcc
CFLAGS             = $(MODEL) -O2 -Wall -pedantic -Wextra -std=c99 -save-temps -D_ROM=$(ROM_NAME) -D_VBA=$(VBASIM)


# --- Linker
LD                 = $(DKPATH)/arm-none-eabi-gcc
LDFLAGS            = $(SPECS) $(MODEL) -lm

# --- Object/Executable Packager
OBJCOPY            = $(DKPATH)/arm-none-eabi-objcopy
OBJCOPYFLAGS       = -O binary

# --- ROM Fixer
GBAFIX             = $(DKPATH)/gbafix

# --- Delete
RM                 = rm -f

OBJECTS = $(SOURCES:.c=.o)


# --- Main build target

all : clean run

run : $(ROM_NAME)
	$(VBASIM) $(ROM_NAME)


build : $(ROM_NAME)

# --- Build .elf file into .gba ROM file
$(ROM_NAME) : $(ELF_NAME)
	$(OBJCOPY) $(OBJCOPYFLAGS) $(ELF_NAME) $(ROM_NAME)
	$(GBAFIX) $(ROM_NAME)

# --- Build .o files into .elf file
$(ELF_NAME) : $(OBJECTS)
	$(LD) $(OBJECTS) $(LDFLAGS) -o $@

# -- Build .c files into .o files
$(OBJECTS) : %.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@



clean:
	$(RM) $(ROM_NAME)
	$(RM) $(ELF_NAME)
	$(RM) $(BIN_NAME)
	$(RM) *.o