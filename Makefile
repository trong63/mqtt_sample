# set up environment for building outside bitbake
# run: make MANUAL_BUILD=1
ifdef MANUAL_BUILD

ifndef OETREE
#$(error Please set OETREE variable)
#-------------------------------------------------------------------------
#BT - VERY IMPORTANT: Set this path to your mlinux source code path
#-------------------------------------------------------------------------
export OETREE=/opt/mlinux/3.1.0/sysroots
endif


HOST_ARCH=$(shell uname -m)
CCDIR = $(OETREE)/$(HOST_ARCH)-mlinux-linux/usr/bin/arm-mlinux-linux-gnueabi

CROSS_COMPILE=$(CCDIR)/arm-mlinux-linux-gnueabi-

LIBDIR = $(OETREE)/arm926ejste-mlinux-linux-gnueabi/usr/lib


export AS = $(CROSS_COMPILE)as
export LD = $(CROSS_COMPILE)ld
export CC = $(CROSS_COMPILE)gcc
export CPP = $(CROSS_COMPILE)g++
export CXX = $(CROSS_COMPILE)g++
export AR = $(CROSS_COMPILE)ar
export NM = $(CROSS_COMPILE)nm
export STRIP = $(CROSS_COMPILE)strip
export OBJCOPY = $(CROSS_COMPILE)objcopy
export OBJDUMP = $(CROSS_COMPILE)objdump
export RANLIB = $(CROSS_COMPILE)ranlib
endif

export CFLAGS += -DEMBED -D__UCLINUX__

export AM_CPPFLAGS += -std=c++0x -DDEBUG

SOURCE_FILES= mqtt_sample.cpp mqtt_sample.h main.cpp

INC = -I$(OETREE)/arm926ejste-mlinux-linux-gnueabi/usr/include/jsoncpp

all: mqtt_sample

mqtt_sample: $(SOURCE_FILES)
	$(CPP) $(AM_CPPFLAGS) $(INC)  -o $@ $^ -L $(LIBDIR) -lmosquittopp -ljsoncpp
clean:
	rm -rf *.o mqtt_sample *.*~ *~


