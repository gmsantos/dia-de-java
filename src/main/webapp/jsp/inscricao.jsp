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
                    <img src="img/administrador.png">
                    <a href="minicurso">Administrador</a>
                </div>
                <nav class="wrapper clearfix">
                    <ul>
                        <li><a href="index.html">Inicio</a></li>
                        <li><a href="inscricao" class="active">Inscrições</a></li>
                        <li><a href="certificado">Certificado</a></li>
                    </ul>
                </nav>
            </header>

        </div>

        <div class="main-container">
            <div class="main wrapper clearfix">
                <article>
                    <% if (request.getMethod().equals("POST")) { 

                        ResultSet rs;

                        String query = "insert into participante (nome, cpf, email, celular, minicurso_id, presenca) VALUES (?, ?, ?, ?, ?, ?)"; 

                        String nome = request.getParameter("nome");
                        String cpf = request.getParameter("cpf");
                        String email = request.getParameter("email");
                        String telefone = request.getParameter("telefone");
                        String minicurso = request.getParameter("minicurso");
                        String presenca = "N";

                        PreparedStatement stmt = connection.prepareStatement(query);

                        stmt.setString(1, nome);
                        stmt.setString(2, cpf);
                        stmt.setString(3, email);
                        stmt.setString(4, telefone);
                        stmt.setString(5, minicurso);
                        stmt.setString(6, presenca);

                        stmt.executeUpdate();
                        
                    %>
                        <p>O seu cadastro foi realizado com sucesso</p>
                        <p>Nome: <%= nome %></p>
                        <p>CPF: <%= cpf %></p>
                        <p>Email: <%= email %></p>
                        <p>Telefone: <%= telefone %></p>
                        <p>Minicurso: <%= minicurso %></p>
                    <% } else { 

                        ResultSet rs;
                        Statement stmt = connection.createStatement(); 

                        String sql = "select id, nome from minicurso"; 
                        rs = stmt.executeQuery(sql);     
                        
                    %> 
                        <p>Preencha o formulário abaixo e clique em gravar: </p>

                        <form action="inscricao" method="POST">
                            <label for="nome">Nome: 
                                <input type="text" required="required" name="nome">
                            </label>

                            <label for="cpf">Cpf: 
                                <input type="text" required="required" name="cpf">
                            </label>

                            <label for="email">Email: 
                                <input type="email" required="required" name="email">
                            </label>

                            <label for="telefone">Telefone: 
                                <input type="tel" required="required" name="telefone">
                            </label>

                            <label for="minicurso">Minicurso: 
                                <select name="minicurso">
                                    <% while (rs.next()) { %>
                                        <option value="<%= rs.getString(1) %>"><%= rs.getString(2) %></option>
                                    <% } %>
                                </select>
                            </label>

                            <input type="submit" value="Efetuar inscrição">
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
