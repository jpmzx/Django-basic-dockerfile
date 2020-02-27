# Dockerfile básico para Django

- [Dockerfile básico para Django](#dockerfile-b%c3%a1sico-para-django)
  - [Instalar Docker](#instalar-docker)
  - [Proyecto Django](#proyecto-django)
    - [Instalar dependencias python](#instalar-dependencias-python)
    - [Crear directorios](#crear-directorios)
    - [Crear y activar entorno virtual](#crear-y-activar-entorno-virtual)
    - [Crear proyecto Django](#crear-proyecto-django)
    - [Ejecutar proyecto Django](#ejecutar-proyecto-django)
  - [Iniciando con Docker](#iniciando-con-docker)

## Instalar Docker

Toda la documentación en : https://docs.docker.com/install/linux/docker-ce/ubuntu/

```bash
$ sudo apt-get update
$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
$ sudo apt-key fingerprint 0EBFCD88
$ sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io

```

Probar instalación de Docker

```bash
$ sudo docker run hello-world
```
Habilite el comando docker para su usuario sin requerir sudo:

```bash
$ sudo usermod -aG docker your-user
```

## Proyecto Django

### Instalar dependencias python

```bash
$ sudo apt-get install git \
       python-dev \
       python-virtualenv \
       python3-pip \
```
### Crear directorios

```bash
$ cd ~
$ mkdir djangodocker
$ cd djangodocker
```

### Crear y activar entorno virtual

```bash
$ virtualenv myproject
$ source myproject/bin/activate
```

### Crear proyecto Django

```bash
$ pip install Django
$ django-admin startproject myproject
$ cd  myproject
```

### Ejecutar proyecto Django

```bash
$ python manage.py runserver
```
Revisar en el navegador si el proyecto corre correctamente en 
http://localhost:8000

## Iniciando con Docker

Crear el dockerfile

ejecutar

$ docker build . -t myproject:latest



