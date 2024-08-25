#!/usr/bin/env bash

GITHUB_USER="spectrapulse"

KEYS_URL="https://github.com/${GITHUB_USER}.keys"

SSH_DIR="${HOME}/.ssh"
AUTHORIZED_KEYS_FILE="${SSH_DIR}/authorized_keys"

# Create '.ssh' dir if it doesn't exist.
if [ ! -d "${SSH_DIR}" ]; then
  mkdir -p "${SSH_DIR}"
  chmod 700 "${SSH_DIR}"
fi

# Create authorized_keys file if it doesn't exit
if [ ! -f "${AUTHORIZED_KEYS_FILE}" ]; then
  install -m 600 /dev/null "${AUTHORIZED_KEYS_FILE}"
fi

# Fetch and print keys
KEYS=$(curl -s $KEYS_URL)
echo -e "Fetched keys from ${KEYS_URL}:\n${KEYS}\n"

# Add keys to authorized_keys file if they're not already present
while IFS= read -r KEY; do
  if ! grep -qF "${KEY}" "${AUTHORIZED_KEYS_FILE}"; then
    echo "$KEY" | tee -a "${AUTHORIZED_KEYS_FILE}" > /dev/null
    echo "Added new key: ${KEY}"
  else
    echo "Key already exists: ${KEY}"
  fi
done <<< "${KEYS}"

echo "SSH keys from ${GITHUB_USER} have been processed and added to ${AUTHORIZED_KEYS_FILE} if they were not already present."
  
