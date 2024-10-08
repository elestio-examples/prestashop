#set env vars
set -o allexport; source .env; set +o allexport;

docker compose exec -it prestashop bin/console prestashop:config set PS_MAIL_SERVER --value "$PS_MAIL_SERVER"
docker compose exec -it prestashop bin/console prestashop:config set PS_SHOP_EMAIL --value "$ADMIN_EMAIL"
docker compose exec -it prestashop bin/console prestashop:config set PS_MAIL_USER --value "$PS_MAIL_USER"
docker compose exec -it prestashop bin/console prestashop:config set PS_MAIL_PASSWD --value "$PS_MAIL_PASSWD"
docker compose exec -it prestashop bin/console prestashop:config set PS_MAIL_SMTP_PORT --value "$PS_MAIL_SMTP_PORT"
docker compose exec -it prestashop bin/console prestashop:config set PS_MAIL_SMTP_ENCRYPTION --value "tls"

