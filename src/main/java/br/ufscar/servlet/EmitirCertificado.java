package br.ufscar.servlet;

import java.sql.*;
import javax.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.io.IOException;
import org.apache.commons.io.IOUtils;

public class EmitirCertificado extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String participante = req.getParameter("participante");

        if (participante.isEmpty()) {
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter responseOutput = resp.getWriter();

            responseOutput.write("Participante nao encontrado");   
        } else {
            StringBuilder data = new StringBuilder();

            try {               
                Class.forName("com.mysql.jdbc.Driver"); 
                Connection connection = DriverManager.getConnection("jdbc:mysql://mysql:3306/evento?autoReconnect=true","root","my-secret"); 
                ResultSet rs;

                String query = "select nome, cpf from participante where id = ?;"; 

                PreparedStatement stmt = connection.prepareStatement(query);
                stmt.setString(1, participante);

                rs = stmt.executeQuery();


                if(rs.next()) {
                    data.append(String.format("%s, CPF %s", rs.getString(1), rs.getString(2)));
                }

                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            String html = "";
            ClassLoader classLoader = getClass().getClassLoader();

            try {
                html = IOUtils.toString(classLoader.getResourceAsStream("templates/certificado.html"), "UTF-8");
            } catch (IOException e) {
                e.printStackTrace();
            }

            html = html.replace("{{{CONTENT}}}", data);

            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter responseOutput = resp.getWriter();

            responseOutput.write(html);   
        }
    }
}