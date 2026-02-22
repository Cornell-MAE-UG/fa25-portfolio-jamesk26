#!/usr/bin/env bash
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 input.md output.pdf"
  exit 1
fi
INPUT="$1"
OUTPUT="$2"
pandoc "$INPUT" -o "$OUTPUT" --pdf-engine=xelatex -V geometry:margin=1in -V fontsize:11pt
echo "Wrote $OUTPUT"
