#set env vars
set -o allexport; source .env; set +o allexport;


cat /opt/elestio/startPostfix.sh > post.txt
filename="./post.txt"

SMTP_LOGIN=""
SMTP_PASSWORD=""

# Read the file line by line
while IFS= read -r line; do
  # Extract the values after the flags (-e)
  values=$(echo "$line" | grep -o '\-e [^ ]*' | sed 's/-e //')

  # Loop through each value and store in respective variables
  while IFS= read -r value; do
    if [[ $value == RELAYHOST_USERNAME=* ]]; then
      SMTP_LOGIN=${value#*=}
    elif [[ $value == RELAYHOST_PASSWORD=* ]]; then
      SMTP_PASSWORD=${value#*=}
    fi
  done <<< "$values"

done < "$filename"

rm post.txt

cat << EOT >> ./.env
PS_MAIL_SERVER=tuesday.mxrouting.net
PS_MAIL_SMTP_PORT=25
PS_MAIL_USER=${SMTP_LOGIN}
PS_MAIL_PASSWD=${SMTP_PASSWORD}
EOT