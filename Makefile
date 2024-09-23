deploy-wesql-server:
	kubectl apply -k overlays-local

undeploy-wesql-server:
	kubectl delete -k overlays-local

deploy-wescale:
	kubectl apply -k wescale

undeploy-wescale:
	kubectl delete -k wescale