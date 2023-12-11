import boto3
import json

def handler(event, context):
    manifest = json.loads(event["Records"][0]["body"])
    jedi_id = manifest["jedi_id"]
    jedi_location = manifest["jedi_location"]

    kms_client = boto3.client("kms")
    encrypted_data = kms_client.encrypt(
        KeyId="aws/s3",
        Plaintext=f"{jedi_id}:{jedi_location}"
    )["CiphertextBlob"]

    # Registra la información en DynamoDB
    dynamodb = boto3.resource("dynamodb")
    table = dynamodb.Table("kantox-dev-dynamodb-states")

    table.put_item(
        Item={
            "lock_id": "1",  # Puedes ajustar esto según tu lógica de bloqueo
            "encrypted_data": encrypted_data
        }
    )
