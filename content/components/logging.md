+++
title = "Logging"
description = "Logging Component."
draft = false
weight = 2
bref="The following components are installed when leveraging KubePlatform"
logos="elasticsearch,fluentd,kibana"
toc = false
+++

#### Logging

For collecting and analyzing logs, the `EFK Stack` is used, consisting of __Elasticsearch__, __Fluentd__, and __Kibana__.
__Elasticsearch__ stores logs emitted by pods. With __Fluentd__ logs are collected and transformed into the JSON format for __Elasticsearch__ to consume. It is deployed as a DeamonSet and has permission to collect logs from every pod on every node. Those logs are then submitted to __Elasticsearch__ for storage. Data from the logs can be queried and visualized with __Kibana__.