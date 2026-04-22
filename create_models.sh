#!/bin/bash

# Script to create all Ollama models from modelfiles

# Make sure OLLAMA_HOST is set
if [ -z "$OLLAMA_HOST" ]; then
    echo "Error: OLLAMA_HOST environment variable is not set."
    exit 1
fi


for file in modelfiles/*.modelfile; do
    if [ -f "$file" ]; then
        model_name=$(basename "$file" .modelfile)
        echo "Creating model: $model_name"
        ollama create "$model_name" -f "$file"
        if [ $? -eq 0 ]; then
            echo "Successfully created $model_name"
        else
            echo "Failed to create $model_name"
        fi
    fi
done

echo "All models creation attempted."