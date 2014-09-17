Flowdock notification script for Zabbix 
=======================================

About
-----
Use custom alerts from within [Zabbix](http://www.zabbix.com/) to send notifications to your flows' team inboxes in [Flowdock](http://www.flowdock.com/).

The script should work with Zabbix 2.0 or greater. It is inspired by the [Zabbix Slack AlertScript](https://github.com/ericoc/zabbix-slack-alertscript).

Installation
------------

### Zabbix server

Place the [flowdock.sh script](https://github.com/flowdock/zabbix-flowdock-script/raw/master/flowdock.sh) in Zabbix server's AlertScriptsPath path. The path is defined in the zabbix_server.conf configuration file. Make sure that the flowdock.sh file is executable by the user that runs zabbix_server.

The default configuration values in flowdock.sh should work out of the box, but if you want to change the sender details or the default tags, edit the values in the Configuration section at the top of flowdock.sh:

- **sender_email**: The email address of the sender of the notification. If one exists, Flowdock uses the Gravatar of this email address as the avatar of the team inbox item. Default: `zabbix.avatar@flowdock.com`
- **sender_name**: The name of the sender. Default: `Zabbix`
- **tags**: A comma-separated list of default tags for the notifications. Default: `zabbix,monitoring`

### Flowdock

In Flowdock, copy the API token of the flow that you'd like to receive notifications in. You can find the API token from the Inbox settings dialog, which can be opened by clicking on the gear icon next to the flow's name.

### Zabbix server web interface

As a super-administrator, select **Create media type** from the **Media types** sub-tab of the **Administration** tab. The values should be:

- **Name:** `Flowdock`
- **Type:** Script
- **Script name:** `flowdock.sh`

Once the media has been created, add a new user called `Flowdock (flow_name)` from the **Users** sub-tab of the **Administration** tab. Specify `Flowdock` as the user's Media, and add the flow API token that you copied above as the value of the **Send to** field. **What active** should probably be `1-7,00:00-24:00` and **Use if severity** should have all options selected. Create a new user for every flow that you would like to send messages to.

Finally, create an action from the **Actions** sub-tab of the **Configuration** tab to notify the appropriate flow (users) when a desired activity occurs. Be sure to specify an appropriate **Default subject** and **Default message** (and **Recovery subject** and **Recovery message**, if appropriate) for your actions. The subjects and messages use Zabbix [macros](https://www.zabbix.com/documentation/2.2/manual/appendix/macros/supported_by_location) for content, e.g. `{TRIGGER.NAME} - {HOSTNAME} ({IPADDRESS})`.

If you run into any problems, don't hesitate to contact the [Flowdock team](mailto:support@flowdock.com).
