# mqtt_sample
This is a mqtt sample client that will talk to the MQTT server on the Conduit and sends data back to the mDot.

Installation instruction:

1. Ubuntu OS - 64 bit.
2. Download and install Multitech mlinux-c-toolchain at the following link:

http://www.multitech.net/developer/software/mlinux/mlinux-software-development/mlinux-c-toolchain/

3. git clone https://github.com/trong63/mqtt_sample.git
4. make MANUAL_BUILD=1 <--Build the project.
5. scp the mqtt_sample to Conduit.
6. ./mqtt_sample <--Run it on the Conduit

