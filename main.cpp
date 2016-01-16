#include "mqtt_sample.h"

int main(int argc, char *argv[])
{
	class mqtt_sample *sample;
	int rc;

	mosqpp::lib_init();

	//BT - Create an instance
	sample = new mqtt_sample("sample", "127.0.0.1", 1883);
	
	while(1){

		//BT - Call loop
		rc = sample->loop();

		if(rc){
			sample->reconnect();
		}
		
	}

	mosqpp::lib_cleanup();

	return 0;
}

