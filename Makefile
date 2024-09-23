deploy-wesql-server:
	kubectl apply -k overlays-local

undeploy-wesql-server:
	kubectl delete -k overlays-local