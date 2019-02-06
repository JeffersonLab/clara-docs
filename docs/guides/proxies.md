# CLARA proxy

CLARA application can be distributed,
spanning across multiple nodes (DPEs) over the network,
accessing services and service compositions.
The biggest problem in distributed systems is the discovery process.
That is, how do services know about each other?
The fact that services can come and go dynamically while the application is running
makes the "dynamic discovery" process much more difficult.
To solve this problem xMsg introduces a proxies with a defined TCP port.
The xMsg proxy functions like a simple stateless message switch,
much like http proxy, forwarding network packets between ports.
xMsg proxy can run as a separate process or within a DPE.

![Figure13. CLARA proxy with the registration and discovery service.](
../assets/images/Slide13.jpg){: .align-center }

TCP port 7771 is used by CLARA application orchestrator/s,
as well as exception and data monitors,
to send request and subscribe messages.
Examples of CLARA platform requests are

* service requests

* service container start/stop requests

* service deployment requests, etc.

Asynchronous nature of CLARA communications requires requester
to listen a response messages with consequent execution of a callback action.
Since CLARA communications are based on publish-subscribe communication paradigm
the above described communication mechanism in a pub-sub language will be described as

1.  orchestrator/s and/or service/s publish/send request to the port 7771, and

2.  subscribe the future response messages at the port 7772.

CLARA proxy forwards requests from port 7771 to port 7772
where future service containers will subscribe orchestrator and/or monitor messages.
Note that in this network pattern we can have arbitrary number of containers and services.

By introducing the proxy in each DPE, CLARA avoids star network configuration
(single point of failure architecture).
The port 7771 is the port where services and/or orchestrator/s publish/send a data
directly addressed to a service, deployed and running on a specific DPE.
The port 7772 is the port where services subscribe CLARA transient data envelopes.
DPE proxy is the main hub to organize service based application data transfer.

It is important to mention that CLARA TCP port assignments suggest
a possible network security mechanism where only ports 7771 and 7772
will be exposed to the outside of a possible firewall.
Also, in case only a few nodes are allowed to be outside of the firewall,
a special gateway service is provided
that is capable of accepting requests and forwarding them
to a specific DPE running on a host behind the firewall.
