The tsyncd default values are in charts/sts-silicom-0.0.1/values.yaml

## Files to change

### charts/sts-silicom-0.0.1/values.yaml

#### nodeSelector

This label selector needs to be added to the values to describe where the daemonset should be scheduled (these are examples and are not hard-coded)

```
NodeSelectors:
  sts.silicom.com/enabled: "worker1"
```

or

```
NodeSelectors:
  kubernetes.io/hostname: "worker1"
```

#### nodeName
This is the hostname of the node for the tsync daemonset to run on.

```NodeName: worker2```

#### EnableGps
Should the gpsd be enabled?

```EnableGPS: true```

#### Tsyncd profile id (refer to documentation)
```ProfileId: "2"```

### charts/sts-silicom-0.0.1/tsyncd.conf

#### Machine specific ethernet port names

```
port1 = eth0
port2 = eth1
portN = ethN
```

## Makefile recipes

There are 2 recipes in the Makefile to deploy the charts.

### Install charts

`make install`

`helm uninstall --debug sts-test --namespace sts-silicom`

## Uninstall charts

`make install`

`helm install --debug sts-test --namespace sts-silicom charts/sts-silicom-0.0.1`

### Verify deploy charts

`make test`

`helm install --debug sts-test --namespace sts-silicom charts/sts-silicom-0.0.1`

