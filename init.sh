sudo apt-get update

sudo apt-get install \
    curl \
    gnupg \
    ca-certificates \
    lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# docker repository add
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# apt update
sudo apt-get update -y

# install docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# docker group add
sudo groupadd docker
sudo usermod -aG docker wchae

# ssh
echo '127.0.0.1 wchae.42.fr' | sudo tee -a /etc/hosts

# open ssh - server
sudo apt install openssh-server -y

# port open
sudo ufw 2222 allow
sudo ufw 4242 allow




sudo reboot
