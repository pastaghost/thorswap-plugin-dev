#!/bin/bash
PROJECT_ROOT=$(pwd)

virtualenv .ledger
source .ledger/bin/activate
pip3 install ledgerblue
deactivate

cd thorswap-plugin
source ../.ledger/bin/activate
python -m ledgerblue.loadApp --targetId 0x31100004 --apdu --tlv --fileName bin/app.hex --appName THORSwap --appFlags 0x00 --icon ""
deactivate
