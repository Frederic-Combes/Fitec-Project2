all:

apply:
	kubectl apply -f dolibarr-conf-persistentvolumeclaim.yaml
	kubectl apply -f dolibarr-docs-persistentvolumeclaim.yaml
	kubectl apply -f dolibarr-deployment.yaml
	kubectl apply -f dolibarr-service.yaml
	kubectl apply -f mariadb-persistentvolumeclaim.yaml
	kubectl apply -f db-deployment.yaml
