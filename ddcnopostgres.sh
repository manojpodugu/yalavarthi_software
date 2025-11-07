#!/bin/bash
# ==============================================
#  EC2 Ubuntu Setup Script
#  Installs: Docker, Docker Compose, Nginx, OpenSSL, postsql
#  Shows: Disk partitions and available storage
# ==============================================

echo "🚀 Starting EC2 Ubuntu setup..."

# ------------------------------
# STEP 1: Update and Upgrade Packages
# ------------------------------
echo "🔄 Updating system packages..."
sudo apt update -y && sudo apt upgrade -y

# ------------------------------
# STEP 2: Install Docker
# ------------------------------
echo "🐳 Installing Docker..."
sudo apt install docker.io -y
sudo systemctl enable docker       # Enable Docker to start at boot
sudo systemctl start docker        # Start Docker service
sudo usermod -aG docker $USER      # Add current user to docker group (no sudo needed later)
echo "✅ Docker installed successfully!"
docker --version

# ------------------------------
# STEP 3: Install Docker Compose
# ------------------------------
echo "⚙️ Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" \
     -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo "✅ Docker Compose installed successfully!"
docker-compose --version

# ------------------------------
# STEP 4: Install Nginx
# ------------------------------
echo "🌐 Installing Nginx..."
sudo apt install nginx -y
sudo systemctl enable nginx       # Start Nginx on boot
sudo systemctl start nginx        # Start Nginx now
echo "✅ Nginx installed and running!"
nginx -v

# ------------------------------
# STEP 5: Install OpenSSL
# ------------------------------
echo "🔐 Installing OpenSSL..."
sudo apt install openssl -y
echo "✅ OpenSSL installed successfully!"
openssl version
# ------------------------------
# STEP 6: Install PostgreSQL
# ------------------------------
echo "🐘 Installing PostgreSQL..."
sudo apt install postgresql postgresql-contrib -y
sudo systemctl enable postgresql
sudo systemctl start postgresql
psql --version

# Set password for default postgres user
echo "⚙️ Setting PostgreSQL 'postgres' user password..."
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgresql';"

#Login to PostgreSQL shell:
#sudo -u postgres psql
# ------------------------------
# STEP 7: Show Disk Usage & Partition Info
# ------------------------------
echo "💽 Checking available storage and partitions..."

# 'df -h' shows disk usage in human readable format (G = GB)
df -Th


docker --version
docker-compose --version
nginx -v
openssl version
psql --version

