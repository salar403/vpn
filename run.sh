CERT_PATH="./ssl"
mkdir $CERT_PATH
openssl req -new -newkey rsa:4096 -days 3600 -nodes -x509 -subj '/C=IR/ST=Tehran/' -keyout $CERT_PATH/key.pem -out $CERT_PATH/cert.pem
docker network create v2ray-network
