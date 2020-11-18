#!/bin/bash
export RG=`uuidgen`
export NAME=`date +"%m%d%y%H%M"`
export LOCATION=${1:-eastus}

if [ ! -z "$2" ]
then
  export IMAGEREFERENCE="-p imageReference=$2"
fi

az group create -o table --name ${RG} --location ${LOCATION}

echo "--------"

az deployment group create -o table -g ${RG} -f imaged_vm_template.json -p parameters.json  -p adminPassword=${PASSWORD} $IMAGEREFERENCE -n ${NAME}
