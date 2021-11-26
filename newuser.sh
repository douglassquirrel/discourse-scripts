set -e 
set -x

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 [name] [username]" >&2
    exit 2
fi

KEY=`./get_config_var.sh KEY`
URL=`./get_config_var.sh URL`
ADMIN_USER=`./get_config_var.sh ADMIN_USER`

NAME=$1
USERNAME=$2
EMAIL="$USERNAME-temp@douglassquirrel.com"
PASSWORD=$USERNAME-123

echo "Creating user $USERNAME"

curl -X POST "$URL/users" \
          -H "Content-Type: multipart/form-data;" \
          -H "Api-Key: $KEY" \
          -H "Api-Username: $ADMIN_USER" \
          -F "name=$NAME" \
          -F "email=$EMAIL" \
          -F "password=$PASSWORD" \
          -F "username=$USERNAME" \
          -F "active=true" \
          -F "approved=true"
