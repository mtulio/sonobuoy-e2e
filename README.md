# Overview

Sonobuoy is a framework for executing Kubernetes conformance tests.  Versions of sonobuoy correlate with the [target minor release of kubernetes](https://sonobuoy.io/docs/v0.19.0/index.html) and are compatible with n-2 minor releases of kubernetes.

Getting the test to run:

1. Download sonobuoy
`curl -L https://github.com/vmware-tanzu/sonobuoy/releases/download/v0.19.0/sonobuoy_0.19.0_linux_amd64.tar.gz | tar xz`

2. Disable container security[see container security restrictions are removed](https://github.com/openshift/kubernetes/blob/master/openshift-hack/conformance-k8s.sh#L47)
~~~
oc adm policy add-scc-to-group anyuid system:authenticated system:serviceaccounts
oc adm policy add-scc-to-group privileged system:authenticated system:serviceaccounts
~~~
3. Cordon masters
`oc get nodes -o name -l 'node-role.kubernetes.io/master' | xargs -L1 oc adm cordon`

4. Run sonobuoy
`./sonobuoy run --dns-namespace openshift-dns --dns-pod-labels dns.operator.openshift.io/daemonset-dns --sonobuoy-image projects.registry.vmware.com/sonobuoy/sonobuoy:v0.19.0`

5. Retrieve results
`sonobuoy retrieve`
