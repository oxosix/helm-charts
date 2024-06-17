# Bazinga

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

Helm chart genérico para serviços Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| addExternalConfigmaps | list | `[]` | Lista de configmaps a serem adicionandos como ENVIRONMENT provenientes de outros projetos |
| autoScaling.cpuAverageUtilization | int | `80` | Média de CPU (Não utilizado caso keda esteja habilitado) |
| autoScaling.enabled | bool | `false` | Habilita autoscaling |
| autoScaling.keda.cooldownPeriod | int | `300` | Keda cooldownPeriod - https://keda.sh/docs/2.6/concepts/scaling-deployments/#cooldownperiod |
| autoScaling.keda.enabled | bool | `false` | Habilita autoscaling através do KEDA Kubernetes Event-driven Autoscaling - https://keda.sh/ |
| autoScaling.keda.pollingInterval | int | `120` | Keda pollingInterval-  https://keda.sh/docs/2.6/concepts/scaling-deployments/#pollinginterval |
| autoScaling.keda.triggers | list | `[]` | Keda Triggers scalers - https://keda.sh/docs/2.6/scalers/ |
| autoScaling.maxReplicas | int | `2` | Máximo de réplicas |
| autoScaling.memoryAverageUtilization | int | `80` | Média de Memória (Não utilizado caso keda esteja habilitado) |
| autoScaling.minReplicas | int | `1` | Mínimo de réplicas |
| containerPort | string | `nil` | Porta que a aplicação rodará |
| containerPortName | string | `"http"` | Nome da porta que a aplicação rodará - https://istio.io/v1.0/docs/setup/kubernetes/spec-requirements/ |
| deployment.annotations | object | `{}` | Kubernetes annotations para o componente deployment |
| deployment.entrypoint.args | string | `nil` | Alteração do entrypoint args - Raramente necessário - https://unofficial-kubernetes.readthedocs.io/en/latest/concepts/configuration/container-command-args/ |
| deployment.entrypoint.command | string | `nil` | Alteração do entrypoint command - Raramente necessário - https://unofficial-kubernetes.readthedocs.io/en/latest/concepts/configuration/container-command-args/ |
| deployment.labels | object | `{}` | Labels extras do deployment |
| deployment.sidecars | list | `[]` |  |
| env | object | `{}` | Lista de variáveis de ambiente via configmap KEY: VALUE(não segredos) |
| environment | string | `nil` | Ambiente a qual o serviço pertence (production/sandbox/qa) (obrigatório) |
| healthCheck.enabled | bool | `true` | Habilita verificações da saúde da aplicação |
| healthCheck.failureThresholdHealthCheck | int | `3` | Checagens falhas antes do serviço ser consideravel não saudável |
| healthCheck.initialDelayHealthCheck | int | `30` | Tempo antes de iniciar a checagem (segundos) |
| healthCheck.pathHealthCheck | string | `"/"` | Caminho do helh check |
| healthCheck.periodHealthCheck | int | `30` | Tempo entre checages (segundos) |
| healthCheck.successThresholdHealthCheck | int | `1` | Checagens com sucesso antes do serviço ser consideravel saudável |
| healthCheck.timeoutHealthCheck | int | `1` | Tempo de timeout da checagem (segundos) |
| hostAliases | list | `[]` | hostaliases são registros de DNS. Raramente necessário - https://kubernetes.io/docs/tasks/network/customize-hosts-file-for-pods/ |
| image.pullPolicy | string | `"Always"` | Política de pull da imagem docker |
| image.repository | string | `nil` | Repositório da imagem docker |
| image.tag | string | `"latest"` | Tag da imagem docker |
| ingress.acmArn | string | `nil` | Específica um certificado(Obrigatório caso haja dois certificados que atendam o mesmo host) |
| ingress.annotations | object | `{}` | Kubernetes annotations para o componente ingress |
| ingress.enabled | bool | `false` | Habilita o ingress para acessos externos ao cluster |
| ingress.group_name | string | `nil` | Ingress ALB group (same loadbalance) |
| ingress.host | string | `nil` | Endereço DNS do serviço. Se for uma aplicação de api-gateway deixe o host em branco. |
| ingress.ingressClassName | string | `"alb"` | Ingress class name se type = alb |
| ingress.paths | list | `["/"]` | Paths que o service responderá - Não use "*" |
| ingress.protocol | string | `"HTTP"` | Backend protocol |
| ingress.public | bool | `false` | Acesso via internet e não via vpn |
| ingress.type | string | `"nlb"` | Utiliza nlb (ingress nginx) ou alb (AWS ALB Controller). |
| ingress.whitelist | string | `nil` | Ingress ALB group whitelise (the same group_name must have the same whitelist) |
| multi_az | bool | `true` | A aplicação será multi-az? |
| nodeSelector | object | `{}` | Seleção de hosts onde a aplicação rodará |
| owner | string | `nil` | Squad responsável por esse serviço (obrigatório) |
| product | string | `nil` | Nome do produto que o serviço faz parte (obrigatório) |
| project_name | string | `nil` | Nome do projeto que o serviço faz parte (obrigatório) |
| replicaCount | int | `1` | Quantidade de pods iniciais |
| resources.limits.cpu | float | `0.5` | CPU Limit - https://kubernetes.io/pt-br/docs/concepts/configuration/manage-resources-containers/ |
| resources.limits.memory | string | `"1024Mi"` | Memory Limit - https://kubernetes.io/pt-br/docs/concepts/configuration/manage-resources-containers/ |
| resources.requests.cpu | string | `"100m"` | CPU requests - https://kubernetes.io/pt-br/docs/concepts/configuration/manage-resources-containers/ |
| resources.requests.memory | string | `"150Mi"` | Memory requests - https://kubernetes.io/pt-br/docs/concepts/configuration/manage-resources-containers/ |
| rollingUpdate.enabled | bool | `true` | Habilita a estratégia de deploy rollingUpdate. Se não for habilitado será usado a opção recreate (mata tudo e depois sobe) |
| rollingUpdate.maxSurge | string | `"50%"` | https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#max-surge |
| rollingUpdate.maxUnavailable | string | `"50%"` | https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#max-unavailable |
| service.annotations | object | `{}` |  |
| service.enabled | bool | `true` | Create service  |
| service.port | int | `80` | Kubernetes annotations para o componente service |
| service.serviceType | string | `"ClusterIP"` | Service Type - https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types |
| service_name | string | `nil` | Nome do serviço (obrigatório) |
| tolerations | list | `[]` | Tolerations de hosts onde a aplicação rodará |
| vault.ClusterSecretStore | string | `nil` | Referência ao objeto de configuração de acesso ao vault: Default $environment-shared-vault-backend |
| vault.enabled | bool | `false` | Habilita secrets vindo do hashicorp vault |
| vault.secretPath | string | `nil` | caminho dentro do vault secrets/ |
| volumes.configmap | list | `[]` | Volumes provenientes de configmaps (exemplo no arquivo de values) |
| volumes.nfs | list | `[]` | Volumes provenientes de servidores NFS (exemplo no arquivo de values) |
| volumes.pvc | list | `[]` | Volumes provenientes de volumes PVC (exemplo no arquivo de values) |

