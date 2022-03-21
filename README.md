# Overview

Sonobuoy is a framework for executing Kubernetes conformance tests.  This repository features a Sonobuoy plugin which executes the [OpenShift e2e tests](https://github.com/openshift/origin)

1. Download sonobuoy and extract [sonobuoy](https://github.com/vmware-tanzu/sonobuoy/releases/)


2. Disable container security[see container security restrictions are removed](https://github.com/openshift/kubernetes/blob/master/openshift-hack/conformance-k8s.sh#L47)
~~~
oc adm policy add-scc-to-group anyuid system:authenticated system:serviceaccounts
oc adm policy add-scc-to-group privileged system:authenticated system:serviceaccounts
~~~

3. Run sonobuoy
~~~
./sonobuoy run --dns-namespace openshift-dns --dns-pod-labels dns.operator.openshift.io/daemonset-dns --plugin plugin.yaml
~~~

4. Check status
./sonobuoy status                                                               

               PLUGIN    STATUS   RESULT   COUNT                                 PROGRESS
   openshift-e2e-cert   running                1   Passed:1905, Failed:  1, Remaining:964

Sonobuoy is still running. Runs can take 60 minutes or more depending on cluster and plugin configuration.

5. Retrieve results
~~~
sonobuoy retrieve
~~~














