#!/bin/sh
# wait-for-db.sh

set -e

until mysql -h database -u root forum -e "SELECT 1"; do
  >&2 echo "MySQL is unavailable - sleeping"
  sleep 1
done

>&2 echo "MySQL is up - executing command"
exec "$@" 