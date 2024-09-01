# interpreta

Interpreta is an experimentation platform that allows for mechanistic interpretability of large language models. 

Features include:
- Autoscaling notebook environment backed by a k8s cluster, which allows for memory intensive experiments from the comfort of a notebook.
- Notebooks will have all of your favourite ML/interpretability packages preinstalled through a custom dockerfile. This dockerfile can be altered to add or remove any packages. 
- Secure authentication through google. 

## Stack 

k8s cluster: managed through terraform. 
k8s cluster packages: managed through helm. 
Containers: docker. 
