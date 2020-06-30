{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "openshiksha.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "openshiksha-cabinet.name" -}}
{{ include "openshiksha.name" . }}-cabinet
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "openshiksha.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "openshiksha-cabinet.fullname" -}}
{{ include "openshiksha.fullname" . }}-cabinet
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "openshiksha.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "openshiksha.labels" -}}
helm.sh/chart: {{ include "openshiksha.chart" . }}
{{ include "openshiksha.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "openshiksha-cabinet.labels" -}}
helm.sh/chart: {{ include "openshiksha.chart" . }}
{{ include "openshiksha-cabinet.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "openshiksha.selectorLabels" -}}
app.kubernetes.io/name: {{ include "openshiksha.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "openshiksha-cabinet.selectorLabels" -}}
app.kubernetes.io/name: {{ include "openshiksha-cabinet.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "openshiksha.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "openshiksha.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
