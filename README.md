# EOS
 
 fast run eos node

# System & Version

 require CentOs 7.x

 use eos vrsion DAWN-2018-04-23-ALPHA
 
 You can find the current stable branch of eos here: https://github.com/EOSIO/eosjs.git

# Environmental Installation

1.docker install

	sudo yum -y install docker
	
	sudo systemctl start docker
	
2.docker-compose install

	yum -y install python-pip
	
	pip install docker-compose
	
check docker docker-compose

	docker version
	
	docker-compose -version

# Run Eos

	wget https://github.com/smartblock18/eos.git
	
	cd eos
	
	./up.sh

# Other

	config docker aliyun image source 
	
	vi /etc/sysconfig/docker
	
	OPTIONS='--selinux-enabled --log-driver=journald --signature-verification=false --registry-mirror=http://abcd1234.m.daocloud.io'
	
	sudo systemctl restart docker
	