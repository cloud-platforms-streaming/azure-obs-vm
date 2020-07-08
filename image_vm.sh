#!/bin/bash
export RG=`uuidgen`
export NAME=`date +"%m%d%y%H%M"`
export LOCATION=westus2

if [ -z "$1" ]
then
  export IMAGEREFERENCE="-p imageReference=$1"
fi

az group create --name ${RG} --location ${LOCATION} --verbose
az deployment group create -g ${RG} -f imaged_vm_template.json -p parameters.json  -p adminPassword=${PASSWORD} $IMAGEREFERENCE -n ${NAME} --verbose

echo "RG is ${RG}"
