echo "
=====================================================
VERSION CHECKING
=====================================================

"
docker --version
docker-compose --version
nginx -v
openssl version
psql --version

echo "
======================================================
SERVICE CHECKING
======================================================

"
sudo systemctl status docker
sudo systemctl status nginx
sudo systemctl status postgresql

docker ps -a


