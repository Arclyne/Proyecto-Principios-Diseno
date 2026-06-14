$DirectorioDestino = "documentos"
$ArchivoSalida = "$DirectorioDestino\documento_final.md"

if (-Not (Test-Path -Path $DirectorioDestino)) {
    New-Item -ItemType Directory -Path $DirectorioDestino | Out-Null
}

Get-ChildItem *.md | Where-Object { $_.FullName -ne (Resolve-Path $ArchivoSalida -ErrorAction SilentlyContinue).Path } | Sort-Object Name | ForEach-Object { 
    Get-Content $_ -Raw
    "`n`n<div style='page-break-before: always;'></div>`n`n" 
} | Set-Content $ArchivoSalida