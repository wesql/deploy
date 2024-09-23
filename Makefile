deploy-wesql-server-local:
	kubectl apply -k overlays-local

undeploy-wesql-server-local:
	kubectl delete -k overlays-local

deploy-wescale-local:
	kubectl apply -k overlays-wescale-local

undeploy-wescale-local:
	kubectl delete -k overlays-wescale-local

deploy-wesql-server-gp2:
	kubectl apply -k overlays-gp2

undeploy-wesql-server-gp2:
	kubectl delete -k overlays-gp2

deploy-wescale-gp2:
	kubectl apply -k overlays-wescale-gp2

undeploy-wescale-gp2:
	kubectl delete -k overlays-wescale-gp2