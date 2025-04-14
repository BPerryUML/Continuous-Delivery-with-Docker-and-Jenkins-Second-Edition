#!/bin/bash
set -x

NODE_IP=$(kubectl get service calculator-service --insecure-skip-tls-verify -o jsonpath='{.spec.clusterIP}')
NODE_PORT=$(kubectl get svc calculator-service -o=jsonpath='{.spec.ports[0].nodePort}')
./gradlew acceptanceTest -Dcalculator.url=http://${NODE_IP}:${NODE_PORT}
