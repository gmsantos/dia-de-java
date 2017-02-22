package br.ufscar.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.io.IOException;
import org.apache.commons.io.IOUtils;

public class Inscricao extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StringBuilder data = new StringBuilder();
        
        ClassLoader classLoader = getClass().getClassLoader();
        String html = "";

        data.append("<p>O seu cadastro foi realizado com sucesso</p>");
        data.append(String.format("<p>Nome: %s</p>", req.getParameter("nome")));
        data.append(String.format("<p>CPF: %s</p>", req.getParameter("cpf")));
        data.append(String.format("<p>Email: %s</p>", req.getParameter("email")));
        data.append(String.format("<p>Telefone: %s</p>", req.getParameter("telefone")));
        data.append(String.format("<p>Minicurso: %s</p>", req.getParameter("minicurso")));

        try {
            html = IOUtils.toString(classLoader.getResourceAsStream("templates/inscricao.html"), "UTF-8");
        } catch (IOException e) {
            e.printStackTrace();
        }

        html = html.replace("{{{CONTENT}}}", data);

        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter responseOutput = resp.getWriter();

        responseOutput.write(html);        
    }

}