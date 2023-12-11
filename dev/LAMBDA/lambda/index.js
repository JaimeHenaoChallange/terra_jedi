const AWS = require('aws-sdk');
const kms = new AWS.KMS();

exports.handler = async (event) => {
  try {
    const jediId = event.Records[0].s3.object.key.replace('.json', '');

    // Simular la obtención de datos del Manifiesto (puedes implementar la lógica real)
    const jediInfo = {
      name: "Yoda",
      planet: "Dagobah",
      power_level: 90
    };

    // Encriptar la información del Jedi usando KMS
    const { CiphertextBlob } = await kms.encrypt({
      KeyId: process.env.KMS_KEY_ID,
      Plaintext: JSON.stringify(jediInfo),
    }).promise();

    console.log(`Jedi ${jediId} information encrypted successfully.`);

    // Guardar el secreto en algún lugar seguro (por ejemplo, base de datos)
    // Aquí simplemente imprimimos el secreto para demostración
    console.log(`Encrypted Jedi Secret: ${CiphertextBlob.toString('base64')}`);

    return {
      statusCode: 200,
      body: JSON.stringify('Jedi location safeguarded successfully!'),
    };
  } catch (error) {
    console.error('Error:', error);
    return {
      statusCode: 500,
      body: JSON.stringify('Internal Server Error'),
    };
  }
};
