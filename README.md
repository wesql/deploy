# Deploy
* [Deploying WeSQL-Server Cluster in Kubernetes](https://wesql.io/docs/tutorial/kubernetes/wesql-server/)
* [Deploying WeScale Cluster in Kubernetes](https://wesql.io/docs/tutorial/kubernetes/wescale)

# About This Repository
This repository uses kustomize to generate the Kubernetes manifests for deploying WeSQL-Server and WeScale in Kubernetes.
Please do not modify the `artifact` directory directly. Instead, modify the `wesql-server`, `wescale`, `overlays-*` directory and run `make clean build` to generate the artifact.
```bash
make clean build
```