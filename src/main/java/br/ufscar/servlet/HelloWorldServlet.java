package br.ufscar.servlet;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Exemplo de servlet gravando e recuperando objetos da sessão
 */
public class HelloWorldServlet extends HttpServlet {

    /**
     * Identificação do campo nome no request
     */
    private static final String TXT_USER_NAME = "user-name";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        // Registra o output
        PrintWriter out = resp.getWriter();

        // Efetua um cast de object para String
        String userName = (String) session.getAttribute(TXT_USER_NAME);

        if (StringUtils.trimToEmpty(userName).isEmpty()) {
            writeMessage(out, "Não há um usuário na sessão");
            return;
        }


        // Localizado usuário na sessão
        writeMessage(out, "Seja bem vindo " + userName);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // Recupera a sessão do request
        HttpSession session = req.getSession();

        // Saída buffer para retorno
        PrintWriter out = resp.getWriter();

        String userName = req.getParameter(TXT_USER_NAME);
        if (StringUtils.trimToEmpty(userName).isEmpty()) {
            writeMessage(out, "Campo [Nome do Usuário] não informado");
            return;
        }

        // Regisra o nome do usuário na sessão
        session.setAttribute(TXT_USER_NAME, userName);
        writeMessage(out, "Usuário registrado na sessão!!!");
    }

    /**
     * Escreve uma mensagem no buffer de saída da resposta http
     */
    private void writeMessage(final PrintWriter out, final String message) throws IOException {
        out.println("<html>");
        out.println("<body>");
        out.println("<h1>");
        out.println(message);
        out.println("</h1>");
        out.println("</body>");
        out.println("</html>");
    }
}