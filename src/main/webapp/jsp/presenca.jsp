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
                    <table>
                        <thead>
                            <tr>
                                <td>Participou</td>
                                <td>Nome</td>
                                <td>CPF</td>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                ResultSet rs;
                                Statement stmt = connection.createStatement(); 

                                String sql = "select id, nome, cpf from participante"; 
                                rs = stmt.executeQuery(sql); 

                                while (rs.next()) { 
                            %>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td><%= rs.getString(2) %></td>
                                    <td><%= rs.getString(3) %></td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </article>

            </div> <!-- #main -->
        </div> <!-- #main-container -->

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="js/main.js"></script>
    </body>
</html>
