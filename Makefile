build:
	kubectl kustomize overlays-wesql-server-default 	> artifact/wesql-server-default.yaml
	kubectl kustomize overlays-wesql-server-gp2 		> artifact/wesql-server-gp2.yaml
	kubectl kustomize overlays-wesql-server-gp3 		> artifact/wesql-server-gp3.yaml
	kubectl kustomize overlays-wesql-server-standard 	> artifact/wesql-server-standard.yaml
	kubectl kustomize overlays-wesql-server-local-path 	> artifact/wesql-server-local-path.yaml
	kubectl kustomize overlays-wesql-server-killercoda 	> artifact/wesql-server-killercoda.yaml

	kubectl kustomize overlays-wescale-default 			> artifact/wescale-default.yaml
	kubectl kustomize overlays-wescale-gp2 				> artifact/wescale-gp2.yaml
	kubectl kustomize overlays-wescale-gp3 				> artifact/wescale-gp3.yaml
	kubectl kustomize overlays-wescale-standard 		> artifact/wescale-standard.yaml
	kubectl kustomize overlays-wescale-local-path 		> artifact/wescale-local-path.yaml


clean:
	rm -rf artifact/*.yaml