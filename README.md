# tsync-charts
* The daemonsets need the correct nodeSelector labels 
  * Which nodes have the cards. (example: pci.sts.silicom.com/card: "true").
* The daemonsets pods need privileged rights.

These default values are in values.yaml

## Overview

* Unique services need to be created for each node, or use localhost, and don't use service (already has hostNetwork).
* Helm does not allow for receiving all nodes with label, then creating objects accordingly, so again, the values file need to be paramatized.
* Each tsync configuration change requires a daemonset restart, include gps parameters, if the services are only localhost, otherwise the grpc service could be used to configure on-the-fly.

## Rbac
[pod security](https://medium.com/@LachlanEvenson/hands-on-with-kubernetes-pod-security-admission-b6cac495cd11)
