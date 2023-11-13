#BT - You just need to update these path.
#/usr/local/oecore-x86_64

MLINUX_6.3.0 = /usr/local/oecore-x86_64/sysroots

LIBDIR = $(MLINUX_6.3.0)/arm926ejste-mlinux-linux-gnueabi/usr/lib

INC = -I$(MLINUX_6.3.0)/arm926ejste-mlinux-linux-gnueabi/usr/include/jsoncpp -I$(MLINUX_6.3.0)/arm926ejste-mlinux-linux-gnueabi/usr/include/

export CFLAGS += -DEMBED -D__UCLINUX__

export CXXFLAGS += -std=c++0x -DDEBUG

SOURCE_FILES= mqtt_sample.cpp mqtt_sample.h main.cpp

all: mqtt_sample

mqtt_sample: $(SOURCE_FILES)
	$(CXX) $(CXXFLAGS) $(INC)  -o $@ $^ -L $(LIBDIR) -lmosquittopp -ljsoncpp


clean:
	rm -rf *.o mqtt_sample *.*~ *~
