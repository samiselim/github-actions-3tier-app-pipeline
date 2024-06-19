
# Build Code and Run Unit Test and SAST, SCA, and DAST Security Scans

This repository contains a GitHub Actions workflow to automate the process of building code, running unit tests, and performing security scans including SAST, SCA, and DAST.

## Table of Contents
- [Workflow Overview](#workflow-overview)
- [Inputs](#inputs)
- [Permissions](#permissions)
- [Jobs](#jobs)
  - [Install Dependencies and SonarQube Scan](#install-dependencies-and-sonarqube-scan)
  - [Security Check](#security-check)
  - [Build Images](#build-images)
  - [Edit Deployment Files](#edit-deployment-files)
- [Secrets](#secrets)

## Workflow Overview

This workflow is triggered manually via `workflow_dispatch`. It includes the following steps:
1. Install dependencies and run a SonarQube scan.
2. Perform security checks using Snyk.
3. Build Docker images for the frontend and backend, and push them to AWS ECR.
4. Update Kubernetes deployment files with the new image tags.

## Inputs

- **use-cache**: Whether to execute the cache step (default: `true`).
- **node-version**: The version of Node.js to use. Options are `16.x`, `18.x`, `20.x`, `21.x` (default: `20.x`).

## Permissions

The workflow requires the following permissions:
- `id-token`: write
- `contents`: write

## Jobs

### Install Dependencies and SonarQube Scan

This job runs on `ubuntu-latest` and includes the following steps:
- Clone the repository.
- Setup the specified Node.js version.
- Calculate cache keys based on `package-lock.json` files.
- Download cached dependencies if `use-cache` is `true`.
- Install dependencies for both frontend and backend if the cache is not hit.
- Run SonarCloud scan.

### Security Check

This job depends on the `install_dep_sonarqube` job and includes the following steps:
- Clone the repository.
- Configure AWS credentials.
- Download cached dependencies if `use-cache` is `true`.
- Install and run Snyk tests in both frontend and backend.

### Build Images

This job depends on the `security_check` job and includes the following steps:
- Clone the repository.
- Configure AWS credentials.
- Build and push Docker images for both frontend and backend to AWS ECR.

### Edit Deployment Files

This job depends on the `Build_Images` job and includes the following steps:
- Clone the repository.
- Update Kubernetes deployment files with the new Docker image tags.
- Commit and push the changes.

## Secrets

The following secrets are required for the workflow:
- `GITHUB_TOKEN`: Token to authenticate with GitHub.
- `SONNAR_TOKEN2`: Token for SonarCloud authentication.
- `AWS_ROLE`: AWS role to assume for accessing ECR.
- `AWS_REGION`: AWS region for ECR.
- `ECR`: AWS ECR registry URL.
- `SNYK_TOKEN`: Token for Snyk authentication.

## Usage

To manually trigger this workflow, go to the Actions tab in your GitHub repository, select the workflow, and click on `Run workflow`. Fill in the required inputs and click on `Run workflow`.

## Conclusion

This workflow automates the essential steps to build, test, and secure your codebase, ensuring a smooth CI/CD pipeline. Customize the workflow as needed to fit your project's requirements.
