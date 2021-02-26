# k3s-dbruno
This is a snap of k3s, a fully conformant production-ready Kubernetes distribution

## Build
Simply clone this tree and call `snapcraft` in the toplevel dir

## Install
To install the snap from the store use:

`snap install k3s-dbruno --edge --devmode`

After installation a couple of small tweaks are required:

1. Create the /run/user/0/snap.k3s dir
```
sudo mkdir -p /run/user/0/snap.k3s
sudo chmod 700 /run/user/0
```
2. Download and parse the cri-containerd apparmor profile
```
sudo wget https://raw.githubusercontent.com/dbruno74/k3s-dbruno/main/cri-containerd.apparmor.d -O /var/lib/snapd/apparmor/profiles/cri-containerd.apparmor.d
sudo apparmor_parser -r /var/lib/snapd/apparmor/profiles/cri-containerd.apparmor.d
```

Alternatively, you can download the install-k3s-dbruno.sh script and run on your host:
```
sudo wget https://raw.githubusercontent.com/dbruno74/k3s-dbruno/main/install-k3s-dbruno.sh
chmod 755 install-k3s-dbruno.sh
./install-k3s-dbruno.sh
```

Note: if your host is Ubuntu Core, wget is be available, you can use wget-simosx snap instead

`snap install wget-simosx`

## Run
### k3s server
Just start the k3s-daemon service

`snap start k3s-dbruno.k3s-daemon`

k3s will be launched with the "server" parameter. In case you want to change the k3s service command line, use snap set

`snap set k3s-dbruno k3s-cmd-line="server --node-name k3s-server"`

To print k3s daemon logs:

`snap logs k3s-dbruno.k3s-daemon -f`

To stop the server:

`snap stop k3s-dbruno.k3s-daemon`

### k3s agent
Set the k3s daemon command line first

`snap set k3s-dbruno k3s-cmd-line="agent --server https://<k3s server address>:6443 --token <k3s server's token>"` 

To get the k3s server token, login to k3s server at <k3s server address>, then:

`sudo cat /var/snap/k3s/current/var/lib/rancher/k3s/server/token`

Then start the k3s-daemon service

`snap start k3s-dbruno.k3s-daemon`

To print k3s daemon logs:

`snap logs k3s-dbruno.k3s-daemon -f`

To stop the server:

`snap stop k3s-dbruno.k3s-daemon`

## Test k3s on uc20

Please refer to the doc _A simple k3s cluster deployed on uc20.pdf_




