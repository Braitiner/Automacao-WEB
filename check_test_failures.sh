#!/bin/bash

JUNIT_FILE="$1"

if [ ! -e "$JUNIT_FILE" ]; then
  echo "Error: Arquivo $JUNIT_FILE não encontrado"
  exit 2
fi

if grep -qP 'failures="(?:(?!0).)*"' "$JUNIT_FILE"; then
  echo "Encontrado algum teste falhado!"
  exit 1
else
  echo "All tests passed!"
  exit 0
fi
