#!/bin/bash

# Configuration
sender_email='noreply+zabbix.avatar@flowdock.com'
sender_name='Zabbix'
tags='zabbix,monitoring'

# Parameters
flow_api_token="$1"
subject="$2"
message="$3"

curl -X POST -d "{\"source\":\"Zabbix\",\"from_name\":\"${sender_name}\",\"subject\":\"${subject}\",\"from_address\":\"${sender_email}\",\"content\":\"${message}\", \"tags\":\"${tags}\"}" -H "Content-type: application/json" https://api.flowdock.com/v1/messages/team_inbox/${flow_api_token}
