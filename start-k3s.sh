#!/bin/bash
./k3s-killall.sh
snap remove k3s-dbruno --purge
snap install k3s-dbruno_0.1_amd64.snap --dangerous
snap connect k3s-dbruno:mount-observe
snap connect k3s-dbruno:firewall-control
snap connect k3s-dbruno:network-control
snap connect k3s-dbruno:process-control
snap connect k3s-dbruno:log-observe
snap connect k3s-dbruno:system-backup
snap connections k3s-dbruno
sudo k3s-dbruno.k3s server
