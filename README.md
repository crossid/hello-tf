# hello-terraform

Infrastructure for deployment of the `hello` project.

- [Overview](#overview)
- [Cloud Providers](#cloud-providers)

## Overview

This repository contains Terraform deployments to provision the `hello` project across multiple cloud providers.

This deploys the following services:

- [hello-fastapi](https://github.com/crossid/hello-fastapi) - A FastAPI application that creates a REST API.
- [hello-nextjs](https://github.com/crossid/hello-nextjs) - A Next.js application that creates a web app that interacts with the API.

## Cloud Providers

- [Azure](./azure/README.md)

## Clone the Repository

```sh
git clone https://github.com/crossid/hello-tf.git
cd hello-tf
```

Follow the instructions in the cloud provider's README to deploy the services to the cloud provider of your choice.
```
