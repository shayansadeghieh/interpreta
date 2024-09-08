# interpreta

Interpreta is an experimentation platform that allows for mechanistic interpretability of large language models. 

Features include:
- Autoscaling notebook environment backed by a k8s cluster, which allows for memory intensive experiments from the comfort of a notebook.
- Notebooks will have all of your favourite ML/interpretability packages preinstalled through a custom dockerfile. This dockerfile can be altered to add or remove any packages. For now, I'll include Neel Nanda's favourite tools/packages. He built an open source version of garçon that is great. 


## Stack 

- k8s cluster infrastructure: terraform.
- k8s cluster resources: kubectl/manifests. 
- k8s cluster packages: managed through helm. 
- Containers: docker. 

## Setup instructions

FYI, I aliased `kubectl` with `k`. 

1. TODO: Instructions on creating remote tfstate file and spinning up infra. 
2. Run `k get nodes`. You should see two nodes.
    ```
    NAME                                                  STATUS   ROLES    AGE     VERSION
    gke-interpreta-gke-interpreta-node-po-756e7c1c-l47x   Ready    <none>   20h     v1.29.7-gke.1104000
    gke-interpreta-gke-interpreta-node-po-756e7c1c-v159   Ready    <none>   9m20s   v1.29.7-gke.1104000
    ```
3. To get the jupyter environment running:
    `cd helm` and then `make install` 
4. After that completes, you should be able to see the services:
    `k get svc --namespace jhub` 

    You should hopefully see a few different services that are not exposed to the internet:
    ```
    NAME           TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
    hub            ClusterIP   34.118.226.209   <none>        8081/TCP   99s
    proxy-api      ClusterIP   34.118.229.142   <none>        8001/TCP   99s
    proxy-public   ClusterIP   34.118.235.32    <none>        80/TCP     99s
    ```
5. To access the jupyter login page, you need to port-forward the traffic to the proxy-public service. 
    
    `make proxy` 

    Then you should be able to access the jupyter login page on http://localhost:8080



