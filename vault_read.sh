
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
tee payload.json <<"EOF"
{
  "role_id": "_ROLE_ID_",
  "secret_id": "_SECRET_ID_"
}
EOF
sed -i 's%_ROLE_ID_%$ROLE_ID%g'  payload.json
sed -i 's%_SECRET_ID_%$SECRET_ID%g'  payload.json
cat payload.json
#curl --request POST --data @payload.json https://addwebprojects.com:8200/v1/auth/approle/login | jq 
# ACCESS_TOKEN="$(vault write -format=json auth/approle/login role_id=${ROLE_ID} secret_id=${SECRET_ID} | jq -r .auth.client_token)"
ACCESS_TOKEN="$(curl -sL --request POST --data @payload.json ${VAULT_URL}/v1/auth/approle/login | jq -r .auth.client_token)"
curl -sL --header "X-Vault-Token: ${ACCESS_TOKEN}" ${VAULT_URL}/v1/${KV_PATH}/data/${KV_NAME}?version=1 | jq -r .data.data.${KV_FIELD}