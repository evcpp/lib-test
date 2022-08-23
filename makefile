ifeq ($(OS),Windows_NT)
	PATH_PREFIX = C:/arm-gcc/bin/
	COMPILER_PREFIX = arm-evcpp-linux-gnueabi-
	CLEAR_COMMAND = del /Q /F /S  .\*.o .\*.d .\*.elf
	INCLUDE_PATH = ..\\framework\\include\\
	API_PATH = ..\\framework\\api\\
endif

COMPILER = $(PATH_PREFIX)$(COMPILER_PREFIX)g++

CFLAGS = -mcpu=arm9 -marm -O3 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g 
CFLAGS += -I"$(INCLUDE_PATH)" -std=c++0x -MMD -MP -c

LDFLAGS = -static-libstdc++ -pthread -mcpu=arm9 -marm -O3 -fmessage-length=0  
LDFLAGS += -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -Xlinker --gc-sections -s

SOURCES = $(wildcard *.cpp)

OBJECTS = $(SOURCES:.cpp=.o)

EXECUTABLE = program.elf

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS) 
	$(COMPILER) $(LDFLAGS) $(OBJECTS)  -o $@ -L"$(API_PATH)" -l:evcppapi.a -lm

.cpp.o:
	$(COMPILER) $(CFLAGS) $< -o $@

.PHONY:clean
clean:
	$(CLEAR_COMMAND)
