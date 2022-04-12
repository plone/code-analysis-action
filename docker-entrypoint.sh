#!/bin/bash
set -e

CHECK=$1
CHECK_PATH=$2

ls .
find /github/

if [[ "${CHECK}" == "black" ]]; then
  black "${CHECK_PATH}" --check --diff
elif  [[ "${CHECK}" == "isort" ]]; then
  isort --check-only "${CHECK_PATH}"
elif  [[ "${CHECK}" == "flake8" ]]; then
  flakeheaven lint "${CHECK_PATH}"
elif  [[ "${CHECK}" == "pyroma" ]]; then
  pyroma -n 10 -d "${CHECK_PATH}"
elif  [[ "${CHECK}" == "zpretty" ]]; then
  find "${CHECK_PATH}" -name "*.zcml" -print0| xargs -0 -r zpretty -i -z --check
  find "${CHECK_PATH}" -name "*.xml" -print0| xargs -0 -r zpretty -i -x --check
else
  # Custom
  exec "$@"
fi
