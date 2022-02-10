a=$(nvidia-smi)
if [ "$a" = "Failed to initialize NVML: Driver/library version mismatch" ]
then
sudo apt --fix-broken install -y  
sudo reboot
fi
