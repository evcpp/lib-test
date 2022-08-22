# SRCS = $(wildcard *.cpp) 
# OBJS = $(patsubst %.cpp, %.o, $(SRCS))
# EXECUTABLE_FILE = program.elf
# LDFLAGS =-static-libstdc++ -pthread -mcpu=arm9 -marm -O3 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -Xlinker --gc-sections -s
# COMPFLAGS = -mcpu=arm9 -marm -O3 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -I"..\framework\include\\" -std=c++0x -MMD -MP -c


# ifeq ($(OS),Windows_NT)
# 	PATH_PREFIX = C:/arm-gcc/bin/
# 	COMPILER_PREFIX = arm-evcpp-linux-gnueabi-
# 	CLEAR_COMMAND = del /Q /F /S  .\*.o .\*.d .\*.elf
# endif

# COMPILER = $(PATH_PREFIX)$(COMPILER_PREFIX)gcc

# all: $(SRCS) $(OBJS) $(EXECUTABLE_FILE)

# $(EXECUTABLE_FILE):$(OBJS)
# 	$(COMPILER) $(LDFLAGS) $(OBJS) -o $@ -L"..\framework\api\" -levcppapi.a -lm

# %.o: %.cpp
# 	$(COMPILER) $(COMPFLAGS) $< -o $@

# clean:
# 	$(CLEAR_COMMAND)

override PREFIX = C:/arm-gcc/bin/arm-evcpp-linux-gnueabi-
includePath = C:\\evcpp\\framework\\include\\
apiPath = C:\\evcpp\\framework\\api

PREFIX ?= $(CROSS_COMPILE)
CC=$(PREFIX)g++
CFLAGS= -mcpu=arm9 -marm -O3 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -I"$(includePath)" -std=c++0x -MMD -MP -c
LDFLAGS=-static-libstdc++ -pthread -mcpu=arm9 -marm -O3 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -Xlinker --gc-sections -s 
SOURCES=$(wildcard *.cpp)
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=program.elf
all: $(SOURCES) $(EXECUTABLE)
$(EXECUTABLE): $(OBJECTS) 
	$(CC) $(LDFLAGS) $(OBJECTS)  -o $@ -L"C:/evcpp/framework/api/" -l:evcppapi.a -lm

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@
