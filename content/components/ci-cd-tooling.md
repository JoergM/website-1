+++
title = "CI/CD Tooling"
description = "CI/CD Tooling Component."
draft = false
weight = 8
bref="The following components are installed when leveraging KubePlatform"
logos="argo"
toc = false
+++

#### CI/CD Tooling

`argo` is a collection of Kubernetes-native automation tools for building workflow pipelines. KubePlatform installs the `argo workflow` engine, along with `argo events`. These components enable to create build pipelines or to automate any other workflow.  

Consult [argos' project repository](https://github.com/argoproj/argo), to learn more about their workflow automation tools.
For running basic workflows refer to the [demos](https://github.com/argoproj/argo/blob/master/demo.md) page. For using it for CI, refer to [this example](https://github.com/kube-platform/base-extras/tree/master/argo/examples/ci/CI.md).
