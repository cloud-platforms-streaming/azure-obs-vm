#!/bin/bash
export RG=`uuidgen`
echo "RG is ${RG}"
export NAME=`date +"%m%d%y%H%M"`
export LOCATION=westus2

az group create --name ${RG} --location ${LOCATION} --verbose
az deployment group create -g ${RG} -f build_vm_template.json -p parameters.json  -p adminPassword=${PASSWORD} -n ${NAME} --verbose
