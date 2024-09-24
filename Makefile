
#Deployments on local

deploy-wesql-server-local:
	kubectl apply -k overlays-wesql-server-local

deploy-wescale-local:
	kubectl apply -k overlays-wescale-local

undeploy-wesql-server-local:
	kubectl delete -k overlays-wesql-server-local

undeploy-wescale-local:
	kubectl delete -k overlays-wescale-local




#Deployments on AWS

deploy-wesql-server-gp2:
	kubectl apply -k overlays-wesql-server-gp2

deploy-wescale-gp2:
	kubectl apply -k overlays-wescale-gp2

undeploy-wesql-server-gp2:
	kubectl delete -k overlays-wesql-server-gp2

undeploy-wescale-gp2:
	kubectl delete -k overlays-wescale-gp2