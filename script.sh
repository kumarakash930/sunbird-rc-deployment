#!/bin/bash

kubectl create configmap config-volume-registry --from-file="/home/bhcp0213/devops training/sunbird-rc-core-main (1)/sunbird-rc-core-main/java/registry/src/main/resources/views"
kubectl create configmap config-volume-keycloak --from-file="/home/bhcp0213/devops training/sunbird-rc-core-main (1)/sunbird-rc-core-main/imports"
kubectl create configmap config-volume-vault --from-file="/home/bhcp0213/devops training/sunbird-rc-core-main (1)/sunbird-rc-core-main/vault.json"
kubectl create configmap config-volume-public-key-service --from-file="/home/bhcp0213/devops training/sunbird-rc-core-main (1)/sunbird-rc-core-main/imports"
kubectl create configmap config-volume-public-key-service --from-file="/home/bhcp0213/devops training/sunbird-rc-core-main (1)/sunbird-rc-core-main/kubernetes/nginx/nginx.conf"
 
DEPLOYMENT_STATEFULSET_FILES=(
    "kubernetes/bulk-issuance/bulk-issuance-deployment.yaml"
    "kubernetes/claim-ms/claim-ms-deployment.yaml"
    "kubernetes/clickhouse/clickhouse-statefulset.yaml"
    "kubernetes/context-proxy-service/context-proxy-service-deployment.yaml"
    "kubernetes/credential/credential-deployment.yaml"
    "kubernetes/credential-schema/credential-schema-deployment.yaml"
    "kubernetes/db/db-statefulset.yaml"
    "kubernetes/digilocker-certificate-api/digilocker-certificate-api-deployment.yaml"
    "kubernetes/encryption-service/encryption-service-deployment.yaml"
    "kubernetes/es/es-statefulset.yaml"
    "kubernetes/file-storage/file-storage-statefulset.yaml"
    "kubernetes/id-gen-service/id-gen-service-deployment.yaml"
    "kubernetes/identity/identity-deployment.yaml"
    "kubernetes/kafka/kafka-statefulset.yaml"
    "kubernetes/keycloak/keycloak-statefulset.yaml"
    "kubernetes/metrics/metrics-deployment.yaml"
    "kubernetes/nginx/nginx-deployment.yaml"
    "kubernetes/notification-ms/notification-ms-deployment.yaml"
    "kubernetes/public-key-service/public-key-service-deployment.yaml"
    "kubernetes/redis/redis-statefulset.yaml"
    "kubernetes/registry/registry-deployment.yaml"
    "kubernetes/vault/vault-statefulset.yaml"
    "kubernetes/zookeeper/zookeeper-statefulset.yaml"
)

SERVICE_FILES=(
    "kubernetes/bulk-issuance/bulk-issuance-service.yaml"
    "kubernetes/claim-ms/claim-ms-service.yaml"
    "kubernetes/clickhouse/clickhouse-service.yaml"
    "kubernetes/context-proxy-service/context-proxy-service-service.yaml"
    "kubernetes/credential/credential-service.yaml"
    "kubernetes/credential-schema/credential-schema-service.yaml"
    "kubernetes/db/db-service.yaml"
    "kubernetes/digilocker-certificate-api/digilocker-certificate-api-service.yaml"
    "kubernetes/encryption-service/encryption-service-service.yaml"
    "kubernetes/es/es-service.yaml"
    "kubernetes/file-storage/file-storage-service.yaml"
    "kubernetes/id-gen-service/id-gen-service-service.yaml"
    "kubernetes/identity/identity-service.yaml"
    "kubernetes/kafka/kafka-service.yaml"
    "kubernetes/keycloak/keycloak-service.yaml"
    "kubernetes/metrics/metrics-service.yaml"
    "kubernetes/nginx/nginx-service.yaml"
    "kubernetes/notification-ms/notification-ms-service.yaml"
    "kubernetes/public-key-service/public-key-service-service.yaml"
    "kubernetes/redis/redis-service.yaml"
    "kubernetes/registry/registry-service.yaml"
    "kubernetes/vault/vault-service.yaml"
    "kubernetes/zookeeper/zookeeper-service.yaml"
)

CONFIGMAP_FILES=(
    "kubernetes/bulk-issuance/bulk-issuance-configmap.yaml"
    "kubernetes/claim-ms/claim-ms-configmap.yaml"
    "kubernetes/credential/credential-configmap.yaml"
    "kubernetes/credential-schema/credential-schema-configmap.yaml"
    "kubernetes/db/db-configmap.yaml"
    "kubernetes/digilocker-certificate-api/digilocker-certificate-api-configmap.yaml"
    "kubernetes/encryption-service/encryption-service-configmap.yaml"
    "kubernetes/es/es-configmap.yaml"
    "kubernetes/file-storage/file-storage-configmap.yaml"
    "kubernetes/id-gen-service/id-gen-service-configmap.yaml"
    "kubernetes/identity/identity-configmap.yaml"
    "kubernetes/kafka/kafka-configmap.yaml"
    "kubernetes/keycloak/keycloak-configmap.yaml"
    "kubernetes/metrics/metrics-configmap.yaml"
    "kubernetes/notification-ms/notification-ms-configmap.yaml"
    "kubernetes/public-key-service/public-key-service-configmap.yaml"
    "kubernetes/registry/registry-configmap.yaml"
    "kubernetes/vault/vault-configmap.yaml"
    "kubernetes/zookeeper/zookeeper-configmap.yaml"
)

SECRET_FILES=(
    "kubernetes/claim-ms/claim-ms-secret.yaml"
    "kubernetes/db/db-secret.yaml"
    "kubernetes/es/es-secret.yaml"
    "kubernetes/keycloak/keycloak-secret.yaml"
    "kubernetes/registry/registry-secret.yaml"
)

PV_FILES=(
    "kubernetes/db/db-pv.yaml"
    "kubernetes/digilocker-certificate-api/digilocker-certificate-api-pv.yaml"
    "kubernetes/registry/registry-pv.yaml"
    "kubernetes/vault/vault-pv.yaml"
)

PV_FILES=(
    "kubernetes/db/db-pvc.yaml"
    "kubernetes/digilocker-certificate-api/digilocker-certificate-api-pvc.yaml"
    "kubernetes/registry/registry-pvc.yaml"
    "kubernetes/vault/vault-pvc.yaml"
)

for FILE in "${CONFIGMAP_FILES[@]}"
do
    kubectl apply -f "$FILE"
done

for FILE in "${SECRET_FILES[@]}"
do
    kubectl apply -f "$FILE"
done

for FILE in "${PV_FILES[@]}"
do
    kubectl apply -f "$FILE"
done

for FILE in "${PVC_FILES[@]}"
do
    kubectl apply -f "$FILE"
done
 
for FILE in "${SERVICE_FILES[@]}"
do
    kubectl apply -f "$FILE"
done


for FILE in "${DEPLOYMENT_STATEFULSET_FILES[@]}"
do
    kubectl apply -f "$FILE"
done
 

 
echo "Deployment done!!"