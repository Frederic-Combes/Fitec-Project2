all:

build:
	docker build -t dolibarr:latest .

apply: apply-pvc apply-deploy apply-svc

apply-pvc:
	kubectl apply -f dolibarr-conf-persistentvolumeclaim.yaml
	kubectl apply -f dolibarr-docs-persistentvolumeclaim.yaml
	kubectl apply -f mariadb-persistentvolumeclaim.yaml

apply-deploy:
	kubectl apply -f dolibarr-deployment.yaml
	kubectl apply -f db-deployment.yaml

apply-svc:
	kubectl apply -f dolibarr-service.yaml

delete: delete-deploy
	kubectl delete svc dolibarr
	kubectl delete pvc dolibarr-docs
	kubectl delete pvc dolibarr-conf
	kubectl delete pvc mariadb

delete-deploy:
	minikube kubectl delete deployment.apps db
	minikube kubectl delete deployment.apps dolibarr
