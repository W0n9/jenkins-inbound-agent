# Jenkins Inbound Agent with Python

[![Build and Push](https://github.com/W0n9/jenkins-inbound-agent/actions/workflows/build.yml/badge.svg)](https://github.com/W0n9/jenkins-inbound-agent/actions/workflows/build.yml)

Docker image based on the official [`jenkins/inbound-agent`](https://hub.docker.com/r/jenkins/inbound-agent) with Python pre-installed.

## Available Tags

| Tag | Python | Architectures |
|-----|--------|---------------|
| `python3.14`, `latest` | 3.14 | amd64, arm64 |
| `python3.13` | 3.13 | amd64, arm64 |

## Registries

- **Docker Hub**: `docker pull w0n9/jenkins-inbound-agent:latest`
- **GHCR**: `docker pull ghcr.io/w0n9/jenkins-inbound-agent:latest`

## Usage

```yaml
# Kubernetes pod template
apiVersion: v1
kind: Pod
spec:
  containers:
    - name: jnlp
      image: w0n9/jenkins-inbound-agent:python3.14
```

```groovy
// Jenkins Pipeline
pipeline {
    agent {
        docker {
            image 'w0n9/jenkins-inbound-agent:python3.14'
        }
    }
    stages {
        stage('Test') {
            steps {
                sh 'python3 --version'
                sh 'pip3 --version'
            }
        }
    }
}
```

## Automated Updates

- **Dependabot** monitors base image (`jenkins/inbound-agent`, `python`) and GitHub Actions versions daily/weekly.
- **Auto-merge** automatically merges Dependabot PRs after CI passes.
- **Scheduled rebuild** runs weekly to incorporate any upstream changes.
