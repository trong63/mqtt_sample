# mqtt_sample
This is a mqtt sample client that will talk to the MQTT server on the Conduit and sends data back to the mDot.

Installation instruction:

1. Ubuntu 16.4.7 LTS - 64 bit.

2. Download and install Multitech mlinux-C/C++-toolchain on your Ubuntu 16.4.7 LTS - 64 bit machine at the following link:

   http://www.multitech.net/mlinux/sdk/5.2.7/

   chmod +x mlinux-glibc-x86_64-mlinux-sdk-arm926ejste-toolchain-5.2.7.sh

   ./mlinux-glibc-x86_64-mlinux-sdk-arm926ejste-toolchain-5.2.7.sh <--Run install.

3. It is recommended to accept the default settings when run the command above.

4. git clone https://github.com/trong63/mqtt_sample.git <--Clone the project.

5. make <--Build the project.

6. scp the mqtt_sample to Conduit.

7. ./mqtt_sample <--Run it on the Conduit

Notes: The source code were taken and modified from the mosquitto-1.4/examples/temperature_conversion.
       
       at http://mosquitto.org/


