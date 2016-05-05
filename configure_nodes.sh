#!/bin/bash

for HOST in graphsys-n00 graphsys-n01 graphsys-n02 graphsys-n03 graphsys-n04 graphsys-n05 graphsys-n06 graphsys-n07 graphsys-n08 graphsys-n09; do
./configure_node.sh $HOST
done