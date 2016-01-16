#ifndef MQTT_SAMPLE_H


#include <mosquittopp.h>
#include <json/json.h>
#include <iostream>
#include <vector>

class mqtt_sample : public mosqpp::mosquittopp
{
	private:
		Json::Reader m_jrReader;
		Json::Value m_jvRoot;
	public:
		mqtt_sample(const char *id, const char *host, int port);
		~mqtt_sample();

		void on_connect(int rc);
		void on_message(const struct mosquitto_message *message);
		void on_subscribe(int mid, int qos_count, const int *granted_qos);
};

#endif
