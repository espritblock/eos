# EOS
 
 fast run eos node

# System & Version

 require CentOs 7.x ,1 CPU,2G Memory

 use eos version dawn4:20180516
 
 You can find the current stable branch of eos here: https://github.com/EOSIO/eosjs.git

# Environment Installation

1.docker install

```

sudo yum -y install docker

sudo systemctl start docker

```
	
2.docker-compose install

```

yum -y install python-pip

pip install docker-compose
	
```
	
3.check docker docker-compose

```

docker version

docker-compose -version

```

4.git

```

yum install -y git
	
```

# Run Eos

```
git clone https://github.com/smartblock18/eos.git

cd eos

chmod 777 *

./up.sh
	
```

# Use

```
get info
	
docker exec eos_keosd_1 cleos -u http://nodeosd:8888 get info
		
create token ABC
	
// set eosio.token contract to eosio
docker exec eos_keosd_1 cleos -u http://nodeosd:8888 set contract eosio.token /contracts/eosio.token -p eosio.token
	
// create token 
docker exec eos_keosd_1 cleos -u http://nodeosd:8888 push action eosio.token create '[ "eosio", "1000000000.0000 ABC", 0, 0, 0]' -p eosio.token
	
// issue token to eosio
docker exec eos_keosd_1 cleos -u http://nodeosd:8888 push action eosio.token issue '[ "eosio", "1000000000.0000 ABC", "memo" ]' -p eosio
	
// eosio balance
docker exec eos_keosd_1 cleos -u http://nodeosd:8888 get currency balance eosio.token eosio
	
// transfer
docker exec eos_keosd_1 cleos -u http://nodeosd:8888 push action eosio.token transfer '["eosio","inita","100.0000 ABC","mome"]' -p eosio
	
// inita balance
docker exec eos_keosd_1 cleos -u http://nodeosd:8888 get currency balance eosio.token inita
		
```

# Other


	config docker image source 

```
	
	vi /etc/sysconfig/docker
	
	OPTIONS='--selinux-enabled --log-driver=journald --signature-verification=false --registry-mirror=http://abcd1234.m.daocloud.io'
	
	sudo systemctl restart docker
	
```
	
# join eos open source 

	wechat hl_294944589
