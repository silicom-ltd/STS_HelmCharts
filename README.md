The tsyncd default values are in charts/sts-silicom-0.0.1/values.yaml

## Files to change

Please refer to https://helm.sh/docs/chart_template_guide/values_files/ on how to override the default values of the chart(s).

### cfgs/bc.yaml, cfgs/gm.yaml, cfgs/slave.yaml
These 3 files  

### charts/sts-silicom-0.0.1/values.yaml
Default values that can be overwritten using `helm install --set` or a file with the same format `helm install -f args.yaml`

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


## Makefile recipes

There are various recipes in the Makefile to deploy the charts.

### Install charts

`make install`

`helm uninstall --debug sts-test --namespace sts-silicom`

## Uninstall charts

`make install`

`helm install --debug sts-test --namespace sts-silicom charts/sts-silicom-0.0.1`

### Verify deploy charts

`make test`

`helm install --debug sts-test --namespace sts-silicom charts/sts-silicom-0.0.1`

### Deploy Master clock mode
This will override some of the values.yaml file values.

`helm install --set Spec.twoStep=0 -f cfgs/gm.yaml --debug sts-test --namespace sts-silicom charts/sts-silicom-0.0.1`

### Deploy Boundary clock mode
This will override some of the values.yaml file values.

`helm install --set Spec.twoStep=1 -f cfgs/bc.yaml --debug sts-test --namespace sts-silicom charts/sts-silicom-0.0.1`

### Deploy Slave clock mode
This will override some of the values.yaml file values.

`helm install --set Spec.gpsdDbgLevel=8  -f cfgs/slave.yaml --debug sts-test --namespace sts-silicom charts/sts-silicom-0.0.1`
