#!/bin/bash
growpart /dev/nvme0n1 4 #grow full size
pvresize /dev/nvme0n1p4 #i wrote coz lvextend may fail
lvextend -r -L +30G /dev/mapper/RootVG-varVol
xfs_growfs /var
# xfx_growfs /home ----no need to use this command when using -r in the above

#installing terraform inbastian to execute terra cmds to run ansible playbook in mongo thru terra to install mongodb database
#yum install -y yum-utils 
#yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
#yum -y install terraform

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user
            # . Use su - username
            # su - username or use newgrp <group>
            # ✔️ No need to relogin into ec2 after assigning the ec2-user to docker grp
            # ✔️ Reloads full login environment
            # ✔️ Picks up new groups

PLATFORM=Linux_amd64
#ARCH=amd64
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
sudo install -m 0755 /tmp/eksctl /usr/local/bin && rm /tmp/eksctl

curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.35.2/2026-02-27/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH


# ################  EKSCTL session 55
#---------------- already given above
# # for ARM systems, set ARCH to: `arm64`, `armv6` or `armv7`
# ARCH=amd64 ---- means the system or binary is built for 64-bit x86 architecture (Intel/AMD processors).
# PLATFORM=$(uname -s)_$ARCH ----did not use this command

# curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"

# # (Optional below command) Verify checksum 
# curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check

# tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
# sudo install -m 0755 /tmp/eksctl /usr/local/bin && rm /tmp/eksctl
# eksctl version

# curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.35.2/2026-02-27/bin/linux/amd64/kubectl
# chmod +x ./kubectl
# mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH
#-----------------------------------------

# do docker login ; docker --version
# eksctl version
#aws configure - give access key and secret key - get from  local folder

# create CLUSTER

#aws configure
#aws configure list -----check if configured
# eksctl create cluster --config-file = eks.yaml

#--------------------DELETE CLUSTER
# eksctl delete cluster roboshop


