#!/bin/bash
export RG=`uuidgen`
export NAME=`date +"%m%d%y%H%M"`
export LOCATION=westus2

if [ ! -z "$1" ]
then
  export IMAGEREFERENCE="-p imageReference=$1"
fi

az group create -o table --name ${RG} --location ${LOCATION}

echo "--------"

az deployment group create -o table -g ${RG} -f imaged_vm_template.json -p parameters.json  -p adminPassword=${PASSWORD} $IMAGEREFERENCE -n ${NAME}
