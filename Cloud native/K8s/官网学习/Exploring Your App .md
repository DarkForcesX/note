### step 1

***

Let’s verify that the application we deployed in the previous scenario is running. We’ll use the `kubectl get` command and look for existing Pods:

```
kubectl get pods
```

If no pods are running then it means the interactive environment is still reloading it's previous state. Please wait a couple of seconds and list the Pods again. You can continue once you see the one Pod running.

Next, to view what containers are inside that Pod and what images are used to build those containers we run the `describe pods` command:

```
kubectl describe pods
```

We see here details about the Pod’s container: IP address, the ports used and a list of events related to the lifecycle of the Pod.

The output of the `describe` command is extensive and covers some concepts that we didn’t explain yet, but don’t worry, they will become familiar by the end of this bootcamp.

*Note: the describe command can be used to get detailed information about most of the kubernetes primitives: node, pods, deployments. The describe output is designed to be human readable, not to be scripted against.*

### step 2

***

Recall that Pods are running in an isolated, private network - so we need to proxy access to them so we can debug and interact with them. To do this, we'll use the `kubectl proxy` command to run a proxy in a second terminal window. Click on the command below to automatically open a new terminal and run the `proxy`:

```
echo -e "\n\n\n\e[92mStarting Proxy. After starting it will not output a response. Please click the first Terminal Tab\n"; kubectl proxy
```

Now again, we'll get the Pod name and query that pod directly through the proxy. To get the Pod name and store it in the POD_NAME environment variable:

```
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}') echo Name of the Pod: $POD_NAME
```

To see the output of our application, run a `curl` request.

```
curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/proxy/
```

The url is the route to the API of the Pod

### Step 3

***

Anything that the application would normally send to `STDOUT` becomes logs for the container within the Pod. We can retrieve these logs using the `kubectl logs` command:

```
kubectl logs $POD_NAME
```

*Note: We don’t need to specify the container name, because we only have one container inside the pod.*

### Step 4

***

We can execute commands directly on the container once the Pod is up and running. For this, we use the `exec` command and use the name of the Pod as a parameter. Let’s list the environment variables:

```
kubectl exec $POD_NAME env
```

Again, worth mentioning that the name of the container itself can be omitted since we only have a single container in the Pod.

Next let’s start a bash session in the Pod’s container:

```
kubectl exec -ti $POD_NAME bash
```

We have now an open console on the container where we run our NodeJS application. The source code of the app is in the server.js file:

```
cat server.js
```

You can check that the application is up by running a curl command:

```
curl localhost:8080
```

*Note: here we used localhost because we executed the command inside the NodeJS Pod. If you cannot connect to localhost:8080, check to make sure you have run the kubectl exec command and are launching the command from within the Pod*

To close your container connection type `exit`.



***

***

```zsh
Kubernetes Started
$ kubectl get pods
NAME                                   READY   STATUS              RESTARTS   AGE
kubernetes-bootcamp-765bf4c7b4-hxch7   0/1     ContainerCreating   0          10s
$ kubectl describe pods kubernetes-bootcamp-765bf4c7b4-hxch7
Name:         kubernetes-bootcamp-765bf4c7b4-hxch7
Namespace:    default
Priority:     0
Node:         minikube/172.17.0.28
Start Time:   Sat, 25 Apr 2020 07:48:41 +0000
Labels:       pod-template-hash=765bf4c7b4
              run=kubernetes-bootcamp
Annotations:  <none>
Status:       Running
IP:           172.18.0.2
IPs:
  IP:           172.18.0.2
Controlled By:  ReplicaSet/kubernetes-bootcamp-765bf4c7b4
Containers:
  kubernetes-bootcamp:
    Container ID:   docker://b4ae986f3520e2287ebfb57285af1298551fa33708b37f1f9a5302b5df0198d9
    Image:          gcr.io/google-samples/kubernetes-bootcamp:v1
    Image ID:       docker-pullable://jocatalin/kubernetes-bootcamp@sha256:0d6b8ee63bb57c5f5b6156f446b3bc3b3c143d233037f3a2f00e279c8fcc64af
    Port:           8080/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Sat, 25 Apr 2020 07:48:43 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from default-token-j9djj (ro)
Conditions:
  Type              Status
  Initialized       True
  Ready             True
  ContainersReady   True
  PodScheduled      True
Volumes:
  default-token-j9djj:
    Type:        Secret (a volume populated by a Secret)
    SecretName:  default-token-j9djj
    Optional:    false
QoS Class:       BestEffort
Node-Selectors:  <none>
Tolerations:     node.kubernetes.io/not-ready:NoExecute for 300s
                 node.kubernetes.io/unreachable:NoExecute for 300s
Events:
  Type     Reason            Age                From               Message
  ----     ------            ----               ----               -------
  Warning  FailedScheduling  34s (x2 over 34s)  default-scheduler  0/1 nodes are available: 1 node(s) had taints that the pod didn't tolerate.
  Normal   Scheduled         28s                default-scheduler  Successfully assigned default/kubernetes-bootcamp-765bf4c7b4-hxch7 to minikube
  Normal   Pulled            27s                kubelet, minikube  Container image "gcr.io/google-samples/kubernetes-bootcamp:v1" already present on machine
  Normal   Created           27s                kubelet, minikube  Created container kubernetes-bootcamp
  Normal   Started           26s                kubelet, minikube  Started container kubernetes-bootcamp
$ kubectl get pods
NAME                                   READY   STATUS    RESTARTS   AGE
kubernetes-bootcamp-765bf4c7b4-hxch7   1/1     Running   0          43s
$
$ export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
$ echo Name of the Pod: $POD_NAME
Name of the Pod: kubernetes-bootcamp-765bf4c7b4-hxch7
$ curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/proxy/
Hello Kubernetes bootcamp! | Running on: kubernetes-bootcamp-765bf4c7b4-hxch7 | v=1
$ kubectl logs $POD_NAME
Kubernetes Bootcamp App Started At: 2020-04-25T07:48:43.159Z | Running On:  kubernetes-bootcamp-765bf4c7b4-hxch7

Running On: kubernetes-bootcamp-765bf4c7b4-hxch7 | Total Requests: 1 | App Uptime: 344.979 seconds | Log Time: 2020-04-25T07:54:28.138Z
$ kubectl exec $POD_NAME env
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=kubernetes-bootcamp-765bf4c7b4-hxch7
KUBERNETES_SERVICE_PORT=443
KUBERNETES_SERVICE_PORT_HTTPS=443
KUBERNETES_PORT=tcp://10.96.0.1:443
KUBERNETES_PORT_443_TCP=tcp://10.96.0.1:443
KUBERNETES_PORT_443_TCP_PROTO=tcp
KUBERNETES_PORT_443_TCP_PORT=443
KUBERNETES_PORT_443_TCP_ADDR=10.96.0.1
KUBERNETES_SERVICE_HOST=10.96.0.1
NPM_CONFIG_LOGLEVEL=info
NODE_VERSION=6.3.1
HOME=/root
$ kubectl exec -ti $POD_NAME bash
root@kubernetes-bootcamp-765bf4c7b4-hxch7:/# cat server.js
var http = require('http');
var requests=0;
var podname= process.env.HOSTNAME;
var startTime;
var host;
var handleRequest = function(request, response) {
  response.setHeader('Content-Type', 'text/plain');
  response.writeHead(200);
  response.write("Hello Kubernetes bootcamp! | Running on: ");
  response.write(host);
  response.end(" | v=1\n");
  console.log("Running On:" ,host, "| Total Requests:", ++requests,"| App Uptime:", (new Date() - startTime)/1000 , "seconds", "| Log Time:",new Date());
}
var www = http.createServer(handleRequest);
www.listen(8080,function () {
    startTime = new Date();;
    host = process.env.HOSTNAME;
    console.log ("Kubernetes Bootcamp App Started At:",startTime, "| Running On: " ,host, "\n" );
});
root@kubernetes-bootcamp-765bf4c7b4-hxch7:/# curl localhost:8080
Hello Kubernetes bootcamp! | Running on: kubernetes-bootcamp-765bf4c7b4-hxch7 | v=1
root@kubernetes-bootcamp-765bf4c7b4-hxch7:/#
```

* 开启proxy

```shell
$ echo -e "\n\n\n\e[92mStarting Proxy. After starting it will not output a response. Please click the first Terminal Tab\n"; kubectl proxy

Starting Proxy. After starting it will not output a response. Please click the first Terminal Tab

Starting to serve on 127.0.0.1:8001
```





