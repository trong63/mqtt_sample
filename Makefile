#BT - You just need to update these path.

MLINUX_4.0.1 = /opt/mlinux/4.0.1/sysroots

LIBDIR = $(MLINUX_4.0.1)/arm926ejste-mlinux-linux-gnueabi/usr/lib

INC = -I$(MLINUX_4.0.1)/arm926ejste-mlinux-linux-gnueabi/usr/include/jsoncpp

export CFLAGS += -DEMBED -D__UCLINUX__

export CXXFLAGS += -std=c++0x -DDEBUG

########################################################################################
#  $(CC) - gcc
#  $(CXX) - g++
#BT - $(CXX) $(CXXFLAGS) $(INC)  -o $@ $^ -L $(LIBDIR) -lmosquittopp -ljsoncpp
########################################################################################

SOURCE_FILES= mqtt_sample.cpp mqtt_sample.h main.cpp

all: mqtt_sample

mqtt_sample: $(SOURCE_FILES)
	$(CXX) $(AM_CPPFLAGS) $(INC)  -o $@ $^ -L $(LIBDIR) -lmosquittopp -ljsoncpp


clean:
	rm -rf *.o mqtt_sample *.*~ *~
