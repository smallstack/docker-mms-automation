mms-automation
==============

MongoDB (mms) Automation Agent

The automation agent (by default) accesses/stores MongoDB data in /data of
the container, so you will probably want to add a volume for that.  Note that
this directory and its contents should be owned by mongodb (uid: 102).

Example:
```
  docker run -e MMS_API_KEY=YourAPIKey -e MMS_GROUP_ID=YourGroupId -v /data ulexus/mms-automation
```


Environment variables
---------------------

*  `MMS_API_KEY`  _(required)_ Your mms API key
*  `MMS_GROUP_ID`  _(required)_ Your mms group id
*  `MMS_SERVER`  Optional override of the mms server URL to connect to

