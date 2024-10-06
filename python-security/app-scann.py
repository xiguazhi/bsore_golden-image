import asyncio
from azure.identity.aio import ClientSecretCredential

credential = ClientSecretCredential("tenant_id", "client_id", "client_secret")

scopes = ['https://graph.microsoft.com/.default']
