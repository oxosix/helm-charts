{{/*
Return the appropriate apiVersion for Ingress
*/}}
{{- define "ingress.apiVersion" -}}
    {{- if semverCompare "<1.14-0" .Capabilities.KubeVersion.Version -}}
        {{- print "extensions/v1beta1" -}}
    {{- else if semverCompare "<1.19-0" .Capabilities.KubeVersion.Version -}}
        {{- print "networking.k8s.io/v1beta1" -}}
    {{- else -}}
        {{- print "networking.k8s.io/v1" -}}
    {{- end -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for HorizontalPodAutoscaler
*/}}
{{- define "hpa.apiVersion" -}}
    {{- if semverCompare "<1.23-0" .Capabilities.KubeVersion.Version -}}
        {{- print "autoscaling/v2beta2" -}}
    {{- else -}}
        {{- print "autoscaling/v2" -}}
    {{- end -}}
{{- end -}}


{{/*
Return the appropriate apiVersion for ExternalSecret
*/}}
{{- define "externalsecret.apiVersion" -}}
    {{- if semverCompare "<1.21-0" .Capabilities.KubeVersion.Version -}}
        {{- print "external-secrets.io/v1alpha1" -}}
    {{- else -}}
        {{- print "external-secrets.io/v1beta1" -}}
    {{- end -}}
{{- end -}}