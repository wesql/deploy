
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

deploy-wesql-server-gp3:
	kubectl apply -k overlays-wesql-server-gp3

deploy-wescale-gp3:
	kubectl apply -k overlays-wescale-gp3

undeploy-wesql-server-gp3:
	kubectl delete -k overlays-wesql-server-gp3

undeploy-wescale-gp3:
	kubectl delete -k overlays-wescale-gp3