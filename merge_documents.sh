#!/bin/bash

mkdir -p documentos
salida="documentos/documento_final.md"

> "$salida"

for f in $(find . -name "*.md" -not -path "./$salida" | sort); do
    cat "$f" >> "$salida"
    printf "\n\n<div style='page-break-before: always;'></div>\n\n" >> "$salida"
done