#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <binary_file>"
    exit 1
fi

BINARY=$1

if [ ! -f "$BINARY" ]; then
    echo "Error: File '$BINARY' not found!"
    exit 1
fi

echo "[*] Extracting shellcode from $BINARY..."

objdump -d "$BINARY" | grep -Po '\s\K[0-9a-f]{2}(?=\s|$)' | tr -d '\n' | \
    sed 's/../\\x&/g' | fold -w 48

echo -e "\n[*] Shellcode extraction complete."
