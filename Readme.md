## Instruction

Start minikube
```bash
minikube start
```

Deploy Dolibar & mariadb in `provision/files/control/src/dolibar`
```bash
make apply
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

Enjoy!
