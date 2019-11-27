## Instruction

Start minikube
```bash
minikube start
```

Deploy Dolibar & mariadb in `provision/files/control/src/dolibar`
```bash
make apply
```
without `make` (windows), run
```bash
kubectl apply -f dolibarr-conf-persistentvolumeclaim.yaml
kubectl apply -f dolibarr-docs-persistentvolumeclaim.yaml
kubectl apply -f mariadb-persistentvolumeclaim.yaml
kubectl apply -f dolibarr-deployment.yaml
kubectl apply -f mariadb-deployment.yaml
kubectl apply -f dolibarr-service.yaml
kubectl apply -f mariadb-service.yaml
```

Check that the PhysicalVolumeClaims, Deployments and Services are created
```bash
kubectl get pvc
kubectl get deployment
kubectl get svc
```

Wait for the pods the be in the `Running` status
```bash
watch kubectl get pods
```

Port forward the port 80 to `deployment/dolibarr`
```bash
kubectl port-forward deployment/dolibar 80
```
If the port 80 is already in use, use
```bash
kubectl port-forward deployment/dolibarr 12345:80
```

Enjoy!
