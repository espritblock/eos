# EOS
 
 fast run eos node

# System & Version

 require CentOs 7.x ,1 CPU,2G Memory

 use eos version DAWN-2018-04-23-ALPHA
 
 You can find the current stable branch of eos here: https://github.com/EOSIO/eosjs.git

# Environment Installation

1.docker install

	sudo yum -y install docker
	
	sudo systemctl start docker
	
2.docker-compose install

	yum -y install python-pip
	
	pip install docker-compose
	
3.check docker docker-compose

	docker version
	
	docker-compose -version

4.git

	yum install -y git

# Run Eos

	git clone https://github.com/smartblock18/eos.git
	
	cd eos
	
	chmod 777 *
	
	./up.sh
	
# Use

	1.get info
	
		docker exec -i -t eos_nodeos_1 cleos get info
	
	2.sub account
	
		docker exec -i -t eos_nodeos_1 cleos get servants eosio
		
	3.create token ABC
		
		// set eosio.token contract to eosio
		docker exec -i -t eos_nodeos_1 cleos set contract eosio /contracts/eosio.token -p eosio
		
		// create token 
		docker exec -i -t eos_nodeos_1 cleos push action eosio create '[ "eosio", "1000000000.0000 ABC", 0, 0, 0]' -p eosio
		
		// issue token to eosio
		docker exec -i -t eos_nodeos_1 cleos push action eosio issue '[ "eosio", "1000000000.0000 ABC", "memo" ]' -p eosio
		
		// eosio balance
		docker exec -i -t eos_nodeos_1 cleos get currency balance eosio eosio
		
		// transfer
		docker exec -i -t eos_nodeos_1 cleos push action eosio transfer '["eosio","inita","100.0000 ABC","mome"]' -p eosio
		
		// inita balance
		docker exec -i -t eos_nodeos_1 cleos get currency balance eosio inita
		

# Other

	config docker image source 
	
	vi /etc/sysconfig/docker
	
	OPTIONS='--selinux-enabled --log-driver=journald --signature-verification=false --registry-mirror=http://abcd1234.m.daocloud.io'
	
	sudo systemctl restart docker
	