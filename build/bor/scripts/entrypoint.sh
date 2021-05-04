#!/bin/sh

# exit script on any error
set -e

# Set Bor Home Directory
BOR_HOME=/datadir

if [ ! -f "$BOR_HOME/genesis.json" ];
then
    echo "setting up initial configurations"
    cd $BOR_HOME

    echo "downloading launch genesis file"
    wget https://raw.githubusercontent.com/maticnetwork/launch/master/mainnet-v1/without-sentry/bor/genesis.json

    echo "initializing bor with genesis file"
    bor --datadir /datadir init /datadir/genesis.json
fi

bor \
    --port=30303 \
    --maxpeers=200 \
    --datadir=/datadir \
    --networkid=137 \
    --syncmode=full
    --miner.gaslimit=200000000 \
    --miner.gastarget=20000000 \
    --bor.heimdall=http://heimdallr:1317 \
    --http \
    --http.addr=0.0.0.0 \
    --http.port=8545 \
    --http.api=eth,net,web3,bor \
    --http.corsdomain="*" \
    --http.vhosts="*" \
    --ws \
    --ws.addr=0.0.0.0 \
    --ws.port=8545 \
    --ws.api=eth,net,web3,bor \
    --ws.origins="*" \
    --nousb
    --bootnodes=enode://0cb82b395094ee4a2915e9714894627de9ed8498fb881cec6db7c65e8b9a5bd7f2f25cc84e71e89d0947e51c76e85d0847de848c7782b13c0255247a6758178c@44.232.55.71:30303,enode://88116f4295f5a31538ae409e4d44ad40d22e44ee9342869e7d68bdec55b0f83c1530355ce8b41fbec0928a7d75a5745d528450d30aec92066ab6ba1ee351d710@159.203.9.164:30303
