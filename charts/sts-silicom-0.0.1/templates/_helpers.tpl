{{- define "node.name" -}}
{{- .Values.NodeName | replace "." "-" | quote -}}
{{- end -}}

{{- define "node.tsync.name" -}}
{{- printf "%s-tsy" .Values.NodeName | replace "." "-" | trunc 15 | quote -}}
{{- end -}}

{{- define "node.grpc.name" -}}
{{- printf "%s-grp" .Values.NodeName | replace "." "-" | trunc 15 | quote -}}
{{- end -}}

{{- define "node.gps.name" -}}
{{- printf "%s-gps" .Values.NodeName | replace "." "-" | trunc 15 | quote -}}
{{- end -}}

{{- define "node.phc2sys.name" -}}
{{- printf "%s-phc" .Values.NodeName | replace "." "-" | trunc 15 | quote -}}
{{- end -}}

{{- define "node.tsync_extts.name" -}}
{{- printf "%s-ext" .Values.NodeName | replace "." "-" | trunc 15 | quote -}}
{{- end -}}