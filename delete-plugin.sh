#!/bin/bash
PROJECT_ROOT=$(pwd)

virtualenv .ledger
source .ledger/bin/activate
pip3 install ledgerblue
deactivate

cd thorswap-plugin
source ../.ledger/bin/activate
python -m ledgerblue.deleteApp --targetId 0x31100004 --appName "THORSwap"
deactivate
