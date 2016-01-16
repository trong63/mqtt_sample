#include <cstdio>
#include <cstring>

#include "mqtt_sample.h"
#include <mosquittopp.h>

//BT - Constructor
mqtt_sample::mqtt_sample(const char *id, const char *host, int port) : mosquittopp(id)
{
	int keepalive = 60;

	/* Connect immediately. This could also be done by calling
	 * mqtt_sample->connect(). */
	connect(host, port, keepalive);

};

mqtt_sample::~mqtt_sample()
{
}

void mqtt_sample::on_connect(int rc)
{
	printf("Connected with code %d.\n", rc);
	if(rc == 0){
		/* Only attempt to subscribe on a successful connect. */
		subscribe(NULL, "lora/+/up");
	}
}

void mqtt_sample::on_message(const struct mosquitto_message *message)
{

 
	//BT - On message: got a message - lora/00:80:00:00:00:00:9c:6a/up
	std::cout << "Got message->topic " << message->topic << std::endl;
	
	//BT - Split based on the '/'

	  char * pch;
          std::vector<std::string> data;

	  pch = strtok (message->topic,"/");
	  while (pch != NULL)
	  {

            data.push_back(pch);
	    pch = strtok (NULL, "/");
	  }

	std::cout << "BT - extract eui: " << data[1] << std::endl;

	std::string topic = "lora/" + data[1] + "/down";

	std::cout << "BT - Got message->payload: " << (char*)message->payload << std::endl;

	//BT - Put data in json object

        bool parsedSuccess = m_jrReader.parse((char*)(message->payload),m_jvRoot,false);

        if(not parsedSuccess)
        {
		    std::cout  << "Failed to parse configuration\n"
			       << m_jrReader.getFormattedErrorMessages();
		return;
    	}

	//BT - Create payload_load send in json format.
	Json::Value payload_send;
         
        payload_send["data"] = m_jvRoot["data"].asString();

        std::cout << "BT - Send " << topic << ":\n\n"
		  << payload_send.toStyledString() << std::endl;


	//BT - Echo data back to mDot
	publish(NULL, topic.c_str(), strlen(payload_send.toStyledString().c_str()), payload_send.toStyledString().c_str());

	//BT - Clear the vector to prevent growing.
	data.clear();

}

void mqtt_sample::on_subscribe(int mid, int qos_count, const int *granted_qos)
{
	printf("Subscription succeeded.\n");
}

