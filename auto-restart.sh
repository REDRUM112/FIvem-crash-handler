while true 
do
IP=$(curl -s https://api.ipify.org)
PORT=30120
URL="http://"$IP":"$PORT"/players.json"
STARTSV=sudo cd ~/fivem_resources && screen -d -m "FiveM server" bash ~/fivem_server/run.sh +exec server.cfg
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' 
YELLOW='\033[1;33m'
if curl --head --silent --fail $URL 2> /dev/null;
 then
  echo "${GREEN}The Server Is Online. ->${NC} ${YELLOW} $IP ${NC}"
  sleep 5  
 else
  echo "${RED}The Server Is Currently Offline - >${NC} ${YELLOW} $URL ${NC}."
  echo "${RED}The Server Is Booting.${NC}"
  sleep 5
  $STARTSV
fi
done