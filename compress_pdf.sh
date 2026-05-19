#!/bin/bash

YELLOW="\033[33m"
GREEN="\033[32m"
RED="\033[31m"
RESET="\033[0m"

if [ -z "$1" ]; then
    echo "❌ Usage: compress /path/to/file.pdf [quality]"
    exit 1
fi

FILE="$1"
QUALITY="${2:-2}"

if [ ! -f "$FILE" ]; then
    echo "❌ File not found: $FILE"
    exit 1
fi

if [[ ! "$QUALITY" =~ ^[1-3]$ ]]; then
    QUALITY=2
fi

# Quality settings lookup table
declare -A QUALITY_SETTINGS=(
    [1]="/prepress"
    [2]="/ebook"
    [3]="/screen"
)

declare -A QUALITY_LABELS=(
    [1]="Less compression, High quality"
    [2]="Recommended compression, Good quality"
    [3]="Extreme compression, Less quality"
)

PDFSETTING="${QUALITY_SETTINGS[$QUALITY]}"
QUALITY_LABEL="${QUALITY_LABELS[$QUALITY]}"

# Handle extra GS options for quality level 1
EXTRA_GS_OPTS=""
if [ "$QUALITY" = "1" ]; then
    EXTRA_GS_OPTS="-dColorImageResolution=150 -dGrayImageResolution=150 -dMonoImageResolution=150 \
-dDownsampleColorImages=true -dDownsampleGrayImages=true -dDownsampleMonoImages=true \
-dColorImageDownsampleType=/Bicubic -dGrayImageDownsampleType=/Bicubic -dMonoImageDownsampleType=/Subsample"
fi

# Generate output filename
EXT="${FILE##*.}"
BASENAME="${FILE%.*}"
DIRNAME="$(dirname "$FILE")"
BASENAME_ONLY="$(basename "$BASENAME")"
OUTPUT="${DIRNAME}/${BASENAME_ONLY}_compressed.${EXT}"

i=2
while [ -f "$OUTPUT" ]; do
    OUTPUT="${DIRNAME}/${BASENAME_ONLY}_compressed_${i}.${EXT}"
    ((i++))
done

ORIG_SIZE=$(du -h "$FILE" | cut -f1)
FILE_BASENAME="$(basename "$FILE")"

echo -e "⏳ Compressing \"$FILE_BASENAME\" with ${YELLOW}quality $QUALITY ($QUALITY_LABEL)${RESET}..."

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS="$PDFSETTING" \
-dNOPAUSE -dQUIET -dBATCH $EXTRA_GS_OPTS \
-sOutputFile="$OUTPUT" "$FILE" 2>/dev/null

if [ -f "$OUTPUT" ]; then
    COMP_SIZE=$(du -h "$OUTPUT" | cut -f1)
    OUTPUT_BASENAME=$(basename "$OUTPUT")
    echo -e "✅ ${GREEN}$OUTPUT_BASENAME${RESET} | Original: ${YELLOW}$ORIG_SIZE${RESET} → ${GREEN}$COMP_SIZE${RESET}"
else
    echo -e "${RED}❌ Compression failed.${RESET}"
    exit 1
fi
