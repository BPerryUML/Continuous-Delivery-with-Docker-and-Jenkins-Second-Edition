#!/bin/bash
set -x

NODE_IP=$(kubectl get nodes -o jsonpath='{ $.items[1].status.addresses[0].address}')
NODE_PORT=$(kubectl get svc calculator-service -o=jsonpath='{.spec.ports[0].port)'
./gradlew smokeTest -Dcalculator.url=http://${NODE_IP}:${NODE_PORT}
