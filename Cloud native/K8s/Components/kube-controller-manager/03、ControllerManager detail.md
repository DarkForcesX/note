### 一、Controller Manager

***

* kube-controller-manager 

  * 必须启动的控制器
    			Endpoint Controller
    			Replication Controller
    			PodGCController
    			ResourceQuota
    			NamespaceController
    			ServiceAccountController
    			GarbageCollectorController
    			DaemonSetController
    			JobController
    			DeploymentController
    			ReplicaSetController
    			HPAController
    			DisruptionController
    			StatefulSetController
    			CronJobController
    			CSRSigningController
    			CSRApprovingController
    			TTLController

  * 默认启动的可选控制器
    			TokenController
    			NodeController
    			ServiceController
    			RouteController
    			PVBinderController
    			AttachDetachController
  * 默认禁止的可选控制器
    			BootstrapSignerController
    			TokenCleanerController

  * cloud-controller-manager
    		CloudNodeController
    		RouteController
    		ServiceController