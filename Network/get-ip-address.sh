<< lib.README
#name 		Network.get-ip-address
#nutshell	Get external IP address of domain
#usage		lib Network.get-ip-address <domain>
#story		lib Network.get-ip-address www.google.com # echo 173.194.34.20 173.194.34.19 ...
lib.README

lib.Network.get-ip-address(){
	dig +short A $1
}
