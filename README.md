# EOS
 
 fast run eos node upgrade to eosio 1.0.2

# System & Version

 require CentOs 7.x ,1 CPU,2G Memory

 use eos version eosio:1.0.2
 
 You can find the current stable branch of eos here: https://github.com/EOSIO/eosjs.git

# Environment Installation

1.docker install

```

sudo yum -y install docker

sudo systemctl start docker

```
	
2.docker-compose install

```

sudo yum -y install python-pip

sudo pip install docker-compose
	
```
	
3.check docker docker-compose

```

sudo docker version

sudo docker-compose -version

```

4.git

```

sudo yum install -y git
	
```

# Run Eos

```
git clone https://github.com/espritblock/eos.git

cd eos

sudo chmod 777 *

sudo ./up.sh
	
```

# Use

```
# get info
	
sudo docker exec eos_keosd_1 cleos -u http://nodeosd:8888 get info

// create token 
sudo docker exec eos_keosd_1 cleos -u http://nodeosd:8888 push action eosio.token create '[ "eosio", "1000000000.0000 ABC", 0, 0, 0]' -p eosio.token
	
// issue token to eosio
sudo docker exec eos_keosd_1 cleos -u http://nodeosd:8888 push action eosio.token issue '[ "eosio", "1000000000.0000 ABC", "memo" ]' -p eosio
	
// eosio balance
sudo docker exec eos_keosd_1 cleos -u http://nodeosd:8888 get currency balance eosio.token eosio
	
// transfer
sudo docker exec eos_keosd_1 cleos -u http://nodeosd:8888 push action eosio.token transfer '["eosio","inita","100.0000 ABC","mome"]' -p eosio
	
// inita balance
sudo docker exec eos_keosd_1 cleos -u http://nodeosd:8888 get currency balance eosio.token inita
		
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
