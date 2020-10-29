#!/bin/bash
export RG=`uuidgen`
export NAME=`date +"%m%d%y%H%M"`
export LOCATION=eastus

az group create --name ${RG} --location ${LOCATION} --verbose
az deployment group create -g ${RG} -f build_vm_template.json -p parameters.json  -p adminPassword=${PASSWORD} -n ${NAME} --verbose

echo "RG is ${RG}"

