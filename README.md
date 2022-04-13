NOTES: The tsyncd default values are in charts/sts-silicom-0.0.1/values.yaml

## Add helm repository from github.io

https://helm.sh/docs/intro/quickstart/

`helm repo add sts-charts https://silicom-ltd.github.io/STS_HelmCharts/`

`helm search repo sts-charts`

```
NAME                    CHART VERSION   APP VERSION     DESCRIPTION
sts-charts/sts-silicom  0.0.1           1.0.0           Silicom STS PTP tsync deployment
```

`helm repo update`
```
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "sts-charts" chart repository
```

`helm search repo sts-charts`

```
NAME                    CHART VERSION   APP VERSION     DESCRIPTION                     
sts-charts/sts-silicom  0.0.1           1.0.0           Silicom STS PTP tsync deployment
```
## Files to change

Please refer to https://helm.sh/docs/chart_template_guide/values_files/ on how to override the default values of the chart(s).

NOTE: Possible tsync values to override https://github.com/silicom-ltd/STS_HelmCharts/blob/main/charts/sts-silicom-0.0.1/values.yaml

### GM deployment example
Create a local file, gm.yaml with the following contents, changing the values to the actual physical deployment.

```yaml
NodeSelectors:
  kubenetes.io/hostname: "master"
Spec:
  profileID: 2
  ports:
  - ethName: enp101s0f0
    ql: 4
    ethPort: 1
  - ethName: enp101s0f1
    ql: 4
    ethPort: 2
  masterPortMask_GM: 0xfff
  masterPortMask_BC: 0xfff
  slavePortMask_BC: 0xfff
  slavePortMask_TSC: 0xfff
  ipv6PortMask: 0xfff
  domainNum_8275_1: 24
  domainNum_8275_2: 44
  domainNum_8265_2: 4
```

Now deploy the chart with the above values.

`helm install -f gm.yaml --debug sts-gm --namespace sts-silicom charts/sts-silicom-0.0.1`

### BC deployment example
Create a local file, bc.yaml with the following contents, changing the values to the actual physical deployment.

```yaml
NodeSelectors:
  kubenetes.io/hostname: "master"
Spec:
  profileID: 1
  ports:
  - ethName: enp101s0f0
    ql: 4
    ethPort: 1
  - ethName: enp101s0f1
    ql: 4
    ethPort: 2
  masterPortMask_GM: 0xfff
  masterPortMask_BC: 0x1
  slavePortMask_BC: 0x2
  slavePortMask_TSC: 0xfff
  ipv6PortMask: 0xfff
  domainNum_8275_1: 24
  domainNum_8275_2: 44
  domainNum_8265_2: 4
```

Now deploy the chart with the above values.

`helm install -f bc.yaml --debug sts-bc --namespace sts-silicom charts/sts-silicom-0.0.1`

### Slave deployment example
Create a local file, slave.yaml with the following contents, changing the values to the actual physical deployment.

```yaml
NodeSelectors:
  kubenetes.io/hostname: "master"
Spec:
  profileID: 3
  ports:
  - ethName: enp101s0f0
    ql: 4
    ethPort: 1
  - ethName: enp101s0f1
    ql: 4
    ethPort: 2
  masterPortMask_GM: 0xfff
  masterPortMask_BC: 0x1
  slavePortMask_BC: 0x2
  slavePortMask_TSC: 0xfff
  ipv6PortMask: 0xfff
  domainNum_8275_1: 24
  domainNum_8275_2: 44
  domainNum_8265_2: 4
```

Now deploy the chart with the above values.

`helm install -f slave.yaml --debug sts-slave --namespace sts-silicom charts/sts-silicom-0.0.1`

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

