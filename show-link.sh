#!/bin/bash
IP=$(curl -s -4 "https://digitalresistance.dog/myIp")
if [ -f .env ]; then
    source .env
    PORT_CON=$PORT
else
    PORT_CON=""
fi
SECRET=$(cat ./data/secret 2>/dev/null)
echo "tg://proxy?server=$IP&port=${PORT_CON:-443}&secret=$SECRET"