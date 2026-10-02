#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
TEX_FILE="main.tex"
PDF_FILE="../cv-wuwenhao.pdf"

cd "$SCRIPT_DIR"

cleanup() {
  rm -f \
    "${TEX_FILE%.tex}.aux" \
    "${TEX_FILE%.tex}.log" \
    "${TEX_FILE%.tex}.out" \
    "${TEX_FILE%.tex}.toc" \
    "${TEX_FILE%.tex}.fls" \
    "${TEX_FILE%.tex}.fdb_latexmk" \
    "${TEX_FILE%.tex}.synctex.gz" \
    "${TEX_FILE%.tex}.xdv" \
    "${TEX_FILE%.tex}.pdf"
}

trap cleanup EXIT

xelatex -interaction=nonstopmode -halt-on-error "$TEX_FILE"
mv "${TEX_FILE%.tex}.pdf" "$PDF_FILE"

printf 'Generated %s\n' "$PDF_FILE"
