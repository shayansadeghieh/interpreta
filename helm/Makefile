# Apply the custom jupyter.yaml to override the default values in the chart 
.PHONY: upgrade
upgrade:
	@helm upgrade --cleanup-on-fail \
  	jupyter-hub jupyterhub/jupyterhub \
  	--namespace jhub \
  	--version=3.3.8 \
  	--values jupyter/values.yaml 

.PHONY: install
install: 
	@helm install jhub jupyterhub/jupyterhub \
	--namespace jhub \
	--values jupyter/values.yaml \
	--debug

.PHONY: uninstall
uninstall:
	@helm uninstall jhub 
	
