<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="css/normalize.min.css">
        <link rel="stylesheet" href="css/main.css">

        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>
    <body>

        <div class="header-container">
            <header class="wrapper clearfix">
                <h1 class="title">
                    <img src="img/logotipo_ediadejava.png" alt="Logotipo dia de Java"> 
                    16 Dia de Java / UFSCar
                </h1>
                <div class="header-link">
                    <img src="img/administrador.png">
                    <a href="admin.html">Administrador</a>
                </div>
                <nav class="wrapper clearfix">
                    <ul>
                        <li><a href="index.html">Inicio</a></li>
                        <li><a href="#">Local</a></li>
                        <li><a href="#">Organização</a></li>
                        <li><a href="#">Programação</a></li>
                        <li><a href="#">Palestras</a></li>
                        <li><a href="#">Mini-cursos</a></li>
                        <li><a href="inscricao.html" class="active">Inscrições</a></li>
                        <li><a href="#">Contato</a></li>
                    </ul>
                </nav>
            </header>

        </div>

        <div class="main-container">
            <div class="main wrapper clearfix">

                <article>
                    <p>O seu cadastro foi realizado com sucesso</p>
                    <p>Nome: <%= request.getParameter("nome") %></p>
                    <p>CPF: <%= request.getParameter("cpf") %></p>
                    <p>Email: <%= request.getParameter("email") %></p>
                    <p>Telefone: <%= request.getParameter("telefone") %></p>
                    <p>Minicurso: <%= request.getParameter("minicurso") %></p>
                </article>

            </div> <!-- #main -->
        </div> <!-- #main-container -->

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="js/main.js"></script>
    </body>
</html>
