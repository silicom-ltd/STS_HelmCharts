{{- define "node.name" -}}
{{- .Values.NodeName | replace "." "-" | quote -}}
{{- end -}}

{{- define "node.tsync.name" -}}
{{- printf "%s-tsync" .Values.NodeName | replace "." "-" | quote -}}
{{- end -}}

{{- define "node.grpc.name" -}}
{{- printf "%s-grpc" .Values.NodeName | replace "." "-" | quote -}}
{{- end -}}

{{- define "node.gps.name" -}}
{{- printf "%s-gps" .Values.NodeName | replace "." "-" | quote -}}
{{- end -}}

{{- define "node.phc2sys.name" -}}
{{- printf "%s-phc2sys" .Values.NodeName | replace "." "-" | quote -}}
{{- end -}}

{{- define "node.tsync_extts.name" -}}
{{- printf "%s-tsync_extts" .Values.NodeName | replace "." "-" | quote -}}
{{- end -}}