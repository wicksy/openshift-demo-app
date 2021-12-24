[![Build Status](https://travis-ci.org/wicksy/openshift-demo-app.svg?branch=master)](https://travis-ci.org/wicksy/openshift-demo-app) [![license](https://img.shields.io/badge/License-MIT-blue.svg?maxAge=2592000)](https://github.com/wicksy/openshift-demo-app/blob/master/LICENSE.md)</br>

## Demo App for OpenShift

This is a sample openshift application repository that can be deployed via `oc new-app`

Hello World via nginx built on Alpine Linux

```
[vagrant@ocptest ~]$ oc new-project demo
Now using project "demo" on server "https://ocptest.openshift.localdomain:8443".

You can add applications to this project with the 'new-app' command. For example, try:

    oc new-app centos/ruby-22-centos7~https://github.com/openshift/ruby-ex.git

to build a new example application in Ruby.
[vagrant@ocptest ~]$ oc new-app --name=demo https://github.com/wicksy/openshift-demo-app
--> Found Docker image d9ad582 (7 months old) from Docker Hub for "wicksy/alpine"

    * An image stream will be created as "alpine:latest" that will track the source image
    * A Docker build using source code from https://github.com/wicksy/openshift-demo-app will be created
      * The resulting image will be pushed to image stream "demo:latest"
      * Every time "alpine:latest" changes a new build will be triggered
    * This image will be deployed in deployment config "demo"
    * Port 8080 will be load balanced by service "demo"
      * Other containers can access this service through the hostname "demo"
    * WARNING: Image "wicksy/alpine" runs as the 'root' user which may not be permitted by your cluster administrator

--> Creating resources ...
    imagestream "alpine" created
    imagestream "demo" created
    buildconfig "demo" created
    deploymentconfig "demo" created
    service "demo" created
--> Success
    Build scheduled, use 'oc logs -f bc/demo' to track its progress.
    Run 'oc status' to view your app.
[vagrant@ocptest ~]$
[vagrant@ocptest ~]$ oc get pod
NAME           READY     STATUS      RESTARTS   AGE
demo-1-0v4qd   1/1       Running     0          46s
demo-1-build   0/1       Completed   0          55s
[vagrant@ocptest ~]$ oc get svc
NAME      CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
demo      172.30.180.170   <none>        8080/TCP   1m
[vagrant@ocptest ~]$ curl http://172.30.180.170:8080
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Hello World</title>
    </head>
    <body>
        <div class="page-header" align=center>
          <h1>Welcome to an OpenShift v3 Demo App</h1>
        </div>
        <div class="container" align=center>
          <h3>Hello World</h3>
        </div>
    </body>
</html>
[vagrant@ocptest ~]$
```