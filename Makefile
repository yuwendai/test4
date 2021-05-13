CROSS =
CC = $(CROSS)gcc
LD = $(CROSS)gcc

CFILES = a1.c
OBJECTS = $(patsubst %.c, %.o, $(CFILES))

CPPFLAGS = 
CFLAGS   = -Wall -g -O0
LDFLAGS  = 

TARGET = a1
all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(LD) -o $(TARGET) $(OBJECTS) $(LDFLAGS)

clean:
	-rm -f $(TARGET) $(OBJECTS) $(TARGET).exe

dep: $(CFILES)
	$(CC) -E $(CFLAGS) -MM $^ > .depend

ifeq (.depend,$(wildcard .depend))
include .depend
endif

.PHONY: all clean
