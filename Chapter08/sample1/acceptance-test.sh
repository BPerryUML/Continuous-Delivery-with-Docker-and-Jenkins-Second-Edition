#!/bin/bash
set -x

NODE_IP=$(kubectl get service calculator-service --insecure-skip-tls-verify -o jsonpath='{.spec.clusterIP}')
NODE_PORT=$(kubectl get service calculator-service --insecure-skip-tls-verify -o jsonpath='{.spec.ports.targetPort}')
./gradlew acceptanceTest -Dcalculator.url=http://${NODE_IP}:${NODE_PORT}
