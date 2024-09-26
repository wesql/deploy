build:
	kubectl kustomize overlays-wesql-server-standard > artifact/wesql-server-standard.yaml
	kubectl kustomize overlays-wescale-standard > artifact/wescale-standard.yaml
	kubectl kustomize overlays-wesql-server-gp3 > artifact/wesql-server-gp3.yaml
	kubectl kustomize overlays-wescale-gp3 > artifact/wescale-gp3.yaml

clean:
	rm -rf artifact/*.yaml