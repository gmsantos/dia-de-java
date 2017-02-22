package br.ufscar.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.io.IOException;
import org.apache.commons.io.IOUtils;

public class Minicurso extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StringBuilder data = new StringBuilder();
        
        ClassLoader classLoader = getClass().getClassLoader();
        String html = "";

        data.append("<p>O cadastro do minicurso foi realizado com sucesso</p>");
        data.append(String.format("<p>Nome: %s</p>", req.getParameter("nome")));
        data.append(String.format("<p>Palestrante: %s</p>", req.getParameter("palestrante")));
        data.append(String.format("<p>Data: %s</p>", req.getParameter("data")));
        data.append(String.format("<p>Local: %s</p>", req.getParameter("local")));
        data.append(String.format("<p>Mensagem: %s</p>", req.getParameter("mensagem")));

        try {
            html = IOUtils.toString(classLoader.getResourceAsStream("templates/minicurso.html"), "UTF-8");
        } catch (IOException e) {
            e.printStackTrace();
        }

        html = html.replace("{{{CONTENT}}}", data);

        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter responseOutput = resp.getWriter();

        responseOutput.write(html);   
    }
}