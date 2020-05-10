### 一、yaml

***

* Deployment

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchExpressions:
    - key: app
      operator: In
      values:
      - nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80
```

* RS

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: nginx
  labels:
    app: nginxv2
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginxv2
    matchExpressions:
    - key: app
      operator: In
      values:
      - nginxv2
      - nginxv1
  template:
    metadata:
      labels:
        app: nginxv2
    spec:
      containers:
      - name: nginx
        image: nginx:1.9.1
```

