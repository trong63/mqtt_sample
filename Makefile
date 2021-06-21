#BT - You just need to update these path.

MLINUX_5.2.7 = /opt/mlinux/5.2.7/sysroots

LIBDIR = $(MLINUX_5.2.7)/arm926ejste-mlinux-linux-gnueabi/usr/lib

INC = -I$(MLINUX_5.2.7)/arm926ejste-mlinux-linux-gnueabi/usr/include/jsoncpp -I$(MLINUX_5.2.7)/arm926ejste-mlinux-linux-gnueabi/usr/include/

export CFLAGS += -DEMBED -D__UCLINUX__

export CXXFLAGS += -std=c++0x -DDEBUG

SOURCE_FILES= mqtt_sample.cpp mqtt_sample.h main.cpp

all: mqtt_sample

mqtt_sample: $(SOURCE_FILES)
	$(CXX) $(CXXFLAGS) $(INC)  -o $@ $^ -L $(LIBDIR) -lmosquittopp -ljsoncpp


clean:
	rm -rf *.o mqtt_sample *.*~ *~
