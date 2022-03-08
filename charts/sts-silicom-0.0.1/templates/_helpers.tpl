{{- define "node.name" -}}
{{- .Values.NodeName | replace "." "-" | trunc 15 | quote -}}
{{- end -}}

{{- define "node.tsync.name" -}}
{{- printf "%.*s-tsy" 11 .Values.NodeName | replace "." "-" | trunc 15 | quote -}}
{{- end -}}

{{- define "node.grpc.name" -}}
{{- printf "%.*s-grp" 11 .Values.NodeName | replace "." "-" | trunc 15 | quote -}}
{{- end -}}

{{- define "node.gps.name" -}}
{{- printf "%.*s-gps" 11 .Values.NodeName | replace "." "-" | trunc 15 | quote -}}
{{- end -}}

{{- define "node.phc2sys.name" -}}
{{- printf "%.*s-phc" 11 .Values.NodeName | replace "." "-" | trunc 15 | quote -}}
{{- end -}}

{{- define "node.tsync_extts.name" -}}
{{- printf "%.*s-ext" 11 .Values.NodeName | replace "." "-" | trunc 15 | quote -}}
{{- end -}}