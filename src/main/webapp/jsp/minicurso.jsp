<%@page 
    language="java" 
    import="java.io.*,java.sql.*,javax.sql.*,javax.naming.*"
    contentType="text/html" 
    pageEncoding="UTF-8"
%>
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
        <% 
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection connection = DriverManager.getConnection("jdbc:mysql://mysql:3306/evento?autoReconnect=true","root","my-secret"); 
        %> 
        <div class="header-container">
            <header class="wrapper clearfix">
                <h1 class="title">
                    <img src="img/logotipo_ediadejava.png" alt="Logotipo dia de Java"> 
                    16 Dia de Java / UFSCar
                </h1>
                <div class="header-link">
                    <img src="img/home.png">
                    <a href="index.html">Home</a>
                </div>
                <nav class="wrapper clearfix">
                    <ul>
                        <li><a href="minicurso" class="active">Minicurso</a></li>
                        <li><a href="presenca">Confirmar Presensa</a></li>
                    </ul>
                </nav>
            </header>

        </div>

        <div class="main-container">
            <div class="main wrapper clearfix">

                <article>
                    <% if (request.getMethod().equals("POST")) { 

                        ResultSet rs;

                        String query = "insert into minicurso (nome, palestrante, data, local, descricao) VALUES (?, ?, ?, ?, ?)"; 

                        String nome = request.getParameter("nome");
                        String palestrante = request.getParameter("palestrante");
                        String data = request.getParameter("data");
                        String local = request.getParameter("local");
                        String mensagem = request.getParameter("mensagem");

                        PreparedStatement stmt = connection.prepareStatement(query);

                        stmt.setString(1, nome);
                        stmt.setString(2, palestrante);
                        stmt.setString(3, data);
                        stmt.setString(4, local);
                        stmt.setString(5, mensagem);

                        stmt.executeUpdate();
                        
                    %>
                        <p>Minicurso cadastrado com sucesso!</p>
                        <p>Nome: <%= nome %></p>
                        <p>Palestrante: <%= palestrante %></p>
                        <p>Data: <%= data %></p>
                        <p>Local: <%= local %></p>
                        <p>Mensagem: <%= mensagem %></p>

                    <% } else {  %>
                    <p>Preencha o formulário abaixo e clique em gravar: </p>

                    <form action="minicurso" method="POST">
                        <label for="nome">Nome: 
                            <input type="text" required="required" name="nome">
                        </label>

                        <label for="palestrante">Palestrante: 
                            <input type="text" required="required" name="palestrante">
                        </label>

                        <label for="data">Data: 
                            <input type="date" required="required" name="data">
                        </label>

                        <label for="local">Local: 
                            <input type="text" required="required" name="local">
                        </label>

                        <label for="mensagem">Mensagem: 
                            <textarea name="mensagem"></textarea>
                        </label>

                        <input type="submit" value="Gravar">
                    </form>                     
                    <% } %>   
                </article>

            </div> <!-- #main -->
        </div> <!-- #main-container -->

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="js/main.js"></script>
    </body>
</html>
