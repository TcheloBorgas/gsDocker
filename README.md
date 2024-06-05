# Global Solution Readme -- como executar

## 1. Construir a Imagem Docker
Primeiro, navego até o diretório onde está localizado o Dockerfile e executo o comando para construir a imagem Docker:


docker build -t node-test .


## 2. Executar o Contêiner
Executo o contêiner com o nome node-test e mapeio a porta 9090 do host para a porta 8090 do contêiner:

docker run -d --name node-test -p 9090:8090 node-test


## 3. Verificar o Serviço
Para verificar se o contêiner está em execução e funcionando corretamente, uso os seguintes comandos:

### Listar contêineres em execução:

docker ps
Isso deve mostrar uma lista de contêineres em execução, incluindo o node-test.

Verificar os logs do contêiner:

docker logs node-test
Isso exibirá os logs do contêiner, onde devo ver algo como App running on port 8090, indicando que a aplicação está funcionando.

### Acessar o serviço:
Abro um navegador ou uso curl para acessar o serviço na porta 9090:

curl http://localhost:9090
Devo receber a resposta Hello World!.

## 4. Monitorar o Serviço
Para monitorar o contêiner em execução, uso o comando docker stats, que fornece estatísticas em tempo real sobre o uso de recursos:

docker stats node-test


Isso exibirá o uso de CPU, memória, I/O e outros recursos do contêiner node-test.



# Preparar Ambiente:
## Estrutura de arquivo:
C:.
│   Dockerfile
│   README.md
│
└───app
        app.js
        package.json

## Criação da Build docker: 
cd C:\Users\pytho\Documents\GitHub\gsDocker
docker build -t myusername/myapp:latest .

## Taguear a Imagem com "latest": 
docker tag myusername/myapp:latest myusername/myapp:latest

## Publicar a Imagem no Docker Hub:
docker login

docker push myusername/myapp:latest

## Executar a Imagem Publicada:
    Puxar a imagem do Docker Hub:
        docker pull myusername/myapp:latest

    Executar a imagem em um contêiner:
        docker run -d --name myapp_container -p 8080:8090 myusername/myapp:latest

