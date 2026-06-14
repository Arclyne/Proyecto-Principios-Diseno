#!/bin/bash

mkdir -p documentos
salida="documentos/documento_final.md"

> "$salida"

for f in $(ls *.md | sort); do
    if [ "$f" != "$salida" ]; then
        cat "$f" >> "$salida"
        printf "\n\n<div style='page-break-before: always;'></div>\n\n" >> "$salida"
    fi
done