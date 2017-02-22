# Compilando o projeto

É preciso ter o maven instalado para compilar o projeto.
Preferencialmente, o projeto pode ser executado a partir de um container do docker.

Para compilar, execute o comando `mvn install`.

Será gerado os arquivos necessários para serem movidos para o tomcat na pasta servlet-sample-1.0-SNAPSHOT

Caso esteja usando Docker, basta rodar `docker-compose up`. O diretório acima já está mapeado para rodar o projeto.

No navegador, acesse `localhost:8080/servlet-sample/index.html` para executar o site.

Caso precise compilar em uma versão diferente do jdk, modifique o arquivo pom.xml, na sessão de build, a counfiguration de build e source desejada.
