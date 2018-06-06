#!/usr/bin/env bash
set -o errexit
set -o xtrace

# set hosts 
echo "127.0.0.1 nodeosd" >> /etc/hosts

# dockrc.sh
export owner_pubkey=EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
export active_pubkey=EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

function cleos() {
  docker exec eos_keosd_1 cleos -u http://nodeosd:8888 "$@"
}

function newaccount() {
  cleos system newaccount\
    --stake-net "10 SYS" --stake-cpu "100 SYS" --buy-ram-bytes 256\
    "$@"
}


# Reset the volumes
docker-compose down

# Update docker
#docker-compose pull

# Start the server for testing
docker-compose up -d --build
docker-compose logs -f | egrep -v 'Produced block 0' &
sleep 2

cleos wallet create

# Create accounts must happen before eosio.system is installed

# Test accounts (for eosjs)
cleos create account eosio inita $owner_pubkey $active_pubkey
cleos create account eosio initb $owner_pubkey $active_pubkey
cleos create account eosio initc $owner_pubkey $active_pubkey

# System accounts for Nodeosd
cleos create account eosio eosio.bpay $owner_pubkey $active_pubkey
cleos create account eosio eosio.msig $owner_pubkey $active_pubkey
cleos create account eosio eosio.names $owner_pubkey $active_pubkey
cleos create account eosio eosio.ram $owner_pubkey $active_pubkey
cleos create account eosio eosio.ramfee $owner_pubkey $active_pubkey
cleos create account eosio eosio.saving $owner_pubkey $active_pubkey
cleos create account eosio eosio.stake $owner_pubkey $active_pubkey
cleos create account eosio eosio.token $owner_pubkey $active_pubkey
cleos create account eosio eosio.vpay $owner_pubkey $active_pubkey

# sys toekn
cleos set contract eosio.token contracts/eosio.token -p eosio.token@active
cleos push action eosio.token create '{"issuer":"eosio.token", "maximum_supply": "1000000000.0000 SYS"}' -p eosio.token@active
cleos push action eosio.token issue '{"to":"eosio.token", "quantity": "1000000000.0000 SYS", "memo": "issue"}' -p eosio.token@active

# eosio.system
cleos set contract eosio contracts/eosio.system -p eosio@active

# transfer
cleos transfer eosio.token eosio '400000000 SYS'
cleos transfer eosio.token inita '100000 SYS'
cleos transfer eosio.token initb '100000 SYS'
cleos transfer eosio.token initc '100000 SYS'
