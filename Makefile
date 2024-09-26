build:
	kubectl kustomize overlays-wesql-server-default 	> artifact/overlays-wesql-server-default.yaml
	kubectl kustomize overlays-wesql-server-gp2 		> artifact/overlays-wesql-server-gp2.yaml
	kubectl kustomize overlays-wesql-server-gp3 		> artifact/overlays-wesql-server-gp3.yaml
	kubectl kustomize overlays-wesql-server-standard 	> artifact/overlays-wesql-server-standard.yaml

	kubectl kustomize overlays-wescale-default 			> artifact/overlays-wescale-default.yaml
	kubectl kustomize overlays-wescale-gp2 				> artifact/overlays-wescale-gp2.yaml
	kubectl kustomize overlays-wescale-gp3 				> artifact/overlays-wescale-gp3.yaml
	kubectl kustomize overlays-wescale-standard 		> artifact/overlays-wescale-standard.yaml


clean:
	rm -rf artifact/*.yaml