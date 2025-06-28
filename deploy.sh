#!/bin/bash

set -e

# ========== CONFIGURATION ==========
CONFIG_FILE="./config.json"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "❌ config.json not found."
    exit 1
fi

DF_PATH=$(jq -r '.df_path' "$CONFIG_FILE")

if [ -z "$DF_PATH" ] || [ "$DF_PATH" == "null" ]; then
    echo "❌ 'df_path' is missing in config.json"
    exit 1
fi

MODS_UPLOAD_PATH="$DF_PATH/mods/mod_upload"
MOD_PROJECT_DIR="$(pwd)"
INFO_FILE="$MOD_PROJECT_DIR/info.txt"

# ========== VALIDATION ==========
if [ ! -f "$INFO_FILE" ]; then
    echo "❌ info.txt not found in project directory: $MOD_PROJECT_DIR"
    exit 1
fi

# ========== PARSE [ID:...] FROM info.txt ==========
MOD_FOLDER_NAME=$(grep -oP '^\[ID:\K[^\]]+' "$INFO_FILE")

if [ -z "$MOD_FOLDER_NAME" ]; then
    echo "❌ Couldn't find [ID:...] in info.txt"
    exit 1
fi

TARGET_MOD_PATH="$MODS_UPLOAD_PATH/$MOD_FOLDER_NAME"

echo "📦 Target mod directory: $TARGET_MOD_PATH"

# ========== CREATE TARGET DIRECTORY ==========
mkdir -p "$TARGET_MOD_PATH"

# ========== COPY FILES ==========
echo "📂 Copying scripts_modinstalled..."
rsync -a --delete "$MOD_PROJECT_DIR/scripts_modinstalled/" "$TARGET_MOD_PATH/scripts_modinstalled/"

echo "📄 Copying info.txt..."
cp "$INFO_FILE" "$TARGET_MOD_PATH/info.txt"

# ========== HANDLE preview.png ==========
PREVIEW_SRC="$MOD_PROJECT_DIR/preview.png"
PREVIEW_DST="$TARGET_MOD_PATH/preview.png"

if [ -f "$PREVIEW_SRC" ]; then
    if [ -f "$PREVIEW_DST" ]; then
        if cmp -s "$PREVIEW_SRC" "$PREVIEW_DST"; then
            echo "🖼️ preview.png is identical, skipping"
        else
            echo "🖼️ preview.png has changed, copying"
            cp "$PREVIEW_SRC" "$PREVIEW_DST"
        fi
    else
        echo "🖼️ preview.png is missing in target, copying"
        cp "$PREVIEW_SRC" "$PREVIEW_DST"
    fi
else
    echo "ℹ️ preview.png not found in project, skipping"
fi

echo "✅ Mod update completed."
