all:

build:
	docker build -t dolibarr:latest .

push:
	docker tag dolibarr:latest fredericcombes/dolibarr:latest
	docker push fredericcombes/dolibarr:latest

pull:
	docker pull fredericcombes/dolibarr:latest || :

apply: apply-pvc apply-deploy apply-svc

apply-pvc:
	kubectl apply -f dolibarr-conf-persistentvolumeclaim.yaml
	kubectl apply -f dolibarr-docs-persistentvolumeclaim.yaml
	kubectl apply -f mariadb-persistentvolumeclaim.yaml

apply-deploy:
	kubectl apply -f dolibarr-deployment.yaml
	kubectl apply -f mariadb-deployment.yaml

apply-svc:
	kubectl apply -f dolibarr-service.yaml
	kubectl apply -f mariadb-service.yaml

delete: delete-deploy
	kubectl delete svc dolibarr
	kubectl delete pvc dolibarr-docs
	kubectl delete pvc dolibarr-conf
	kubectl delete pvc mariadb

delete-deploy:
	kubectl delete deployment.apps mariadb
	kubectl delete deployment.apps dolibarr
