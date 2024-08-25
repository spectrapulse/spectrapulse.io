#!/usr/bin/env bash

GITHUB_USER="spectrapulse"

KEYS_URL="http://github.com/${GITHUB_USER}.keys"

SSH_DIR="${HOME}/.ssh"
AUTHORIZED_KEYS_FILE="${SSH_DIR}/authorized_keys"

# Create '.ssh' dir if it doesn't exist.
if [ ! -d "${SSH_DIR}" ]; then
  mkdir -p "${SSH_DIR}"
  chmod 700 "${SSH_DIR}"
fi

# Add keys to authorized_keys file if they're not already present
while IFS= read -r KEY; do
  if ! grep -qF "${KEY}" "${AUTHORIZED_KEYS_FILE}"; then
    echo "$KEY" >> "${AUTHORIZED_KEYS_FILE}"
    echo "Added new key: ${KEY}"
  else
    echo "Key already exists: ${KEY}"
  fi
done <<< "$(curl -s "${KEYS_URL}")"

# Set correct permissions for authorized_keys file (Incase the permissions are incorrect or haven't been set because the file was created in the previous step)
chmod 600 "${AUTHORIZED_KEYS_FILE}"

echo "SSH keys from ${GITHUB_USER} have been processed and added to ${AUTHORIZED_KEYS_FILE} if they were not already present."
  
