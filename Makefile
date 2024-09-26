build:
	kubectl kustomize overlays-wesql-server-local > artifact/wesql-server-local.yaml
	kubectl kustomize overlays-wescale-local > artifact/wescale-local.yaml
	kubectl kustomize overlays-wesql-server-gp3 > artifact/wesql-server-gp3.yaml
	kubectl kustomize overlays-wescale-gp3 > artifact/wescale-gp3.yaml

clean:
	rm -rf artifact/*.yaml