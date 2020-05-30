
while getopts u:r:s:p:n:f: option
do
case "${option}"
in
u) VAULT_URL=${OPTARG};;
r) ROLE_ID=${OPTARG};;
s) SECRET_ID=${OPTARG};;
p) KV_PATH=${OPTARG};;
n) KV_NAME=${OPTARG};;
f) KV_FIELD=${OPTARG};;
esac
done
ACCESS_TOKEN="$(vault write -format=json auth/approle/login role_id=${ROLE_ID} secret_id=${SECRET_ID} | jq -r .auth.client_token)"
curl -sL --header "X-Vault-Token: ${ACCESS_TOKEN}" https://addwebprojects.com:8200/v1/${KV_PATH}/data/${KV_NAME}?version=1 | jq -r .data.data.${KV_FIELD}