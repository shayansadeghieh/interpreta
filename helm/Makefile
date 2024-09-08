.PHONY: upgrade
upgrade:
	@helm upgrade --cleanup-on-fail \
  	jupyter-hub jupyterhub/jupyterhub \
  	--namespace jhub \
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
	
.PHONY: proxy
proxy: # start up jupyter server on http://localhost:8080
	@kubectl --namespace=jhub port-forward service/proxy-public 8080:http
	