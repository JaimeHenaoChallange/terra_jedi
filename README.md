# The Jedi Council: Secrets of the Galaxy

Despliegue IaC JEDI

Estructura:

```console
terra_jedi
├── backend-terraform
│   ├── main.tf
│   ├── mainvars.tf
│   ├── provider.tf
│   └── version.tf
├── dev
│   ├── LAMBDA
│   │   ├── Code and json
│   │   │   ├── jedi_1.json
│   │   │   ├── jedi_2.json
│   │   │   └── jedi.json
│   │   ├── lambda
│   │   │   ├── node_modules
│   │   │   ├── index.js
│   │   │   ├── lambda.zip
│   │   │   ├── package-lock.json
│   │   │   └── package.json
│   │   ├── lambda_data.tf
│   │   ├── lambda_kms.tf
│   │   ├── lambda_maim.tf
│   │   ├── lambda_outputs.tf
│   │   ├── lambda_role.tf
│   │   ├── lambda_s3.tf
│   │   ├── lambda_variables.tf
│   │   └── lammda.zip
│   ├── VPC
│   │   ├── vpc_igw.tf
│   │   ├── vpc_main.tf
│   │   ├── vpc_ngw.tf
│   │   ├── vpc_outouts.tf
│   │   ├── vpc_rt.tf
│   │   ├── vpc_sg.tf
│   │   └── vpc_variables.tf
│   ├── mainvar.tf
│   ├── modules.tf
│   ├── providers.tf
│   ├── version.tf
│   ├── .gitignore
│   └── README.md
└──
```

***The Jedi Council: Secrets of the Galaxy.**

**Lambda**
Razón de Uso:

Serverless Architecture: Lambda es un servicio de computación sin servidor que permite ejecutar código sin tener que aprovisionar ni administrar servidores. Al ser un desafío con requisitos de costos eficientes y arquitectura serverless, Lambda es una opción adecuada.

Implementación:
Se puede implementar una función Lambda para procesar eventos de actualización de manifiestos Jedi. Por ejemplo, cada vez que llega un nuevo manifiesto, la función Lambda puede desencadenarse para procesar la información y actualizar los registros necesarios.

**S3**
Razón de Uso:
Almacenamiento Duradero: S3 proporciona un almacenamiento duradero y escalable. Dado que se trata de información crítica sobre Jedi que debe mantenerse a lo largo del tiempo, S3 es una opción adecuada para almacenar los registros y manifiestos de Jedi.

Implementación:
Se puede utilizar S3 para almacenar los manifiestos Jedi y los registros de ubicación de Jedi de manera segura. Los eventos de Lambda pueden desencadenarse cuando se carga un nuevo manifiesto en S3, activando así la actualización del registro.

**KMS (Key Management Service)**
Razón de Uso:
Seguridad y Encriptación: KMS se utiliza para administrar las claves de cifrado. Dado que el desafío requiere el cifrado del ID del Jedi, se utiliza KMS para garantizar la seguridad de la información sensible.

Implementación:
KMS se integra con Lambda para cifrar y descifrar el ID del Jedi almacenado como secreto. Esto garantiza que el ID del Jedi esté seguro y solo sea accesible para funciones autorizadas.

**VPC (Virtual Private Cloud)**
Razón de Uso:
Aislamiento y Seguridad: VPC proporciona un entorno virtual aislado en la nube. En un contexto de seguridad, se puede utilizar VPC para aislar los recursos y funciones, asegurando que la información de los Jedi esté protegida.

Implementación:
Lambda y otros servicios pueden ser configurados dentro de una VPC para establecer límites y proporcionar un nivel adicional de seguridad. Esto ayuda a proteger la infraestructura y la información de posibles amenazas externas.

**Backend de Terraform en S3 y DynamoDB**
Razón de Uso:
Infraestructura como Código (IaC): Utilizar Terraform para definir y gestionar la infraestructura. Al almacenar el backend de Terraform en S3 y usar DynamoDB para el bloqueo de estado, se permite una gestión eficaz y segura de la infraestructura.

Implementación:
El backend de Terraform se configura para almacenar el estado en S3, lo que facilita la colaboración y la gestión de versiones del código de infraestructura. DynamoDB se utiliza para el bloqueo de estado, evitando conflictos en las operaciones concurrentes.
En resumen, la combinación de Lambda, S3, KMS, VPC y el backend de Terraform en S3 y DynamoDB ofrece una solución segura, eficiente y serverless para abordar los requisitos del desafío "El Consejo Jedi: Secretos de la Galaxia".

**Diagrama**

![Solucion IaC](doc/jedi-Página-2.jpg)

```
