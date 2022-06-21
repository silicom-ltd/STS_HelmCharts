{{- define "node.name" -}}
{{- .Release.Name | replace "." "-" | trunc 15 | quote -}}
{{- end -}}

{{- define "node.tsync.name" -}}
{{- printf "%.*s-tsy" 11 .Release.Name | replace "." "-" | trunc 15 | quote -}}
{{- end -}}

{{- define "node.grpc.name" -}}
{{- printf "%.*s-grp" 11 .Release.Name | replace "." "-" | trunc 15 | quote -}}
{{- end -}}

{{- define "node.grpcevnt.name" -}}
{{- printf "%.*s-evt" 11 .Release.Name | replace "." "-" | trunc 15 | quote -}}
{{- end -}}

{{- define "node.grpccfg.name" -}}
{{- printf "%.*s-cfg" 11 .Release.Name | replace "." "-" | trunc 15 | quote -}}
{{- end -}}

{{- define "node.grpcstat.name" -}}
{{- printf "%.*s-stt" 11 .Release.Name | replace "." "-" | trunc 15 | quote -}}
{{- end -}}

{{- define "node.grpctimingmgr.name" -}}
{{- printf "%.*s-mgr" 11 .Release.Name | replace "." "-" | trunc 15 | quote -}}
{{- end -}}

{{- define "node.gps.name" -}}
{{- printf "%.*s-gps" 11 .Release.Name | replace "." "-" | trunc 15 | quote -}}
{{- end -}}

{{- define "node.phc2sys.name" -}}
{{- printf "%.*s-phc" 11 .Release.Name | replace "." "-" | trunc 15 | quote -}}
{{- end -}}

{{- define "node.tsync_extts.name" -}}
{{- printf "%.*s-ext" 11 .Release.Name | replace "." "-" | trunc 15 | quote -}}
{{- end -}}
