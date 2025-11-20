# MSSQL Server (sqlserver) en Arch Linux

Microsoft SQL Server es un sistema de gestión de base de datos relacional, desarrollado por la empresa Microsoft. 

## Requisitos

- Arch Linux o Distribucion basada en la misma
- YAY 
  [Instalacion](https://salmorejogeek.com/2022/11/19/instalar-yay-en-arch-linux-desde-una-sola-linea/)

## Pasos
### Instalar mssql-server

`yay -S mssql-server`

Este comando descargara y compilara desde los repositorios de usuario de archlinux.

### Configurar

Para configurar necesitamos ejecutar como superusuario la herramienta mssql-conf

`sudo /opt/mssql/bin/mssql-conf setup`

En el "setup" se nos pedira elegir:
  - Edicion (WEB, Evaluation, etc). Elige a tu conveniencia, Recomendado "Express"
  - Idioma
  - Contraseña del Superadmin "sa"

Al finalizar el setup se iniciara el servicio y podrias acceder desde un gestor de base de datos mediante tu ip.

Tus Variables de conexion con:
- Host: tu ip
- Puerto: 1433
- Usuario: sa
- Contraseña: la que pusiste
> Para conseguir tu ip: `ip a`

## Tomar en Cuenta
Para detener el servidor:

`sudo systemctl stop mssql-server`

Para iniciar el servidor:

`sudo systemctl start mssql-server`

Para eliminar el inicio automatico:

`sudo systemctl disable mssql-server`

Para habilitar el inicio automatico:

`sudo systemctl enable mssql-server`




