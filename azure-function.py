import os
import datetime
import json
import azure.functions as func
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient

def main(req: func.HttpRequest) -> func.HttpResponse:
    secret_name = req.params.get('name')
    if not secret_name:
        return func.HttpResponse(
            "Please provide a secret name as a query parameter.",
            status_code=400
        )

    keyvault_name = "your-keyvault-name"  # Replace with your actual Key Vault name
    kv_uri = f"https://{keyvault_name}.vault.azure.net"
    credential = DefaultAzureCredential()
    client = SecretClient(vault_url=kv_uri, credential=credential)

    try:
        secret = client.get_secret(secret_name)
        secret_properties = {
            "Key Vault Name": keyvault_name,
            "Secret Name": secret.name,
            "Creation Date": secret.properties.created,
            "Secret Value": secret.value
        }
        return func.HttpResponse(json.dumps(secret_properties), mimetype="application/json")
    except Exception as e:
        return func.HttpResponse(
            f"Error: Secret '{secret_name}' not found.",
            status_code=404
        )
