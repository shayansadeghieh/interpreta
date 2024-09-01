# Apply the custom config.yaml 
.PHONY: apply
apply:
	@helm upgrade --cleanup-on-fail \
  	jupyter-hub jupyterhub/jupyterhub \
  	--namespace jhub \
  	--version=3.3.8 \
  	--values config.yaml
