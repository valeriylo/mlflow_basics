#!/bin/sh

# Maximum number of retries
MAX_RETRIES=30
RETRY_INTERVAL=2
RETRIES=0

# Wait for MinIO service to be ready
until mc alias set minioserver http://minio:9000 "${MINIO_ROOT_USER}" "${MINIO_ROOT_PASSWORD}"; do
  RETRIES=$((RETRIES+1))
  if [ "$RETRIES" -ge "$MAX_RETRIES" ]; then
    echo "MinIO server not ready after $RETRIES attempts. Exiting."
    exit 1
  fi
  echo "Waiting for MinIO to be ready... attempt #$RETRIES"
  sleep "$RETRY_INTERVAL"
done

# Create the MLFlow bucket (ignore error if it already exists)
mc mb minioserver/mlflow || true

