export PATH=`pwd`:$PATH
curl -L https://github.com/vmware-tanzu/sonobuoy/releases/download/v0.19.0/sonobuoy_0.19.0_linux_amd64.tar.gz | tar xz
oc adm policy add-scc-to-group anyuid system:authenticated system:serviceaccounts
oc adm policy add-scc-to-group privileged system:authenticated system:serviceaccounts
oc get nodes -o name -l 'node-role.kubernetes.io/master' | xargs -L1 oc adm cordon
sonobuoy run --dns-namespace openshift-dns --dns-pod-labels dns.operator.openshift.io/daemonset-dns --sonobuoy-image projects.registry.vmware.com/sonobuoy/sonobuoy:v0.19.0 --wait
