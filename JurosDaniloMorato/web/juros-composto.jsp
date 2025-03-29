<%-- 
    Document   : juros-composto
    Created on : 29 de mar. de 2025, 05:53:14
    Author     : morat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juros Compostos</title>
    </head>
    <body>
        
        <%@ include file="WEB-INF/jspf/menu.jspf" %>

<h2>Juros Compostos</h2>

<form method="post">
    Capital Inicial: <input type="text" name="capital" required><br>
    Taxa de Juros (% ao mês): <input type="text" name="taxa" required><br>
    Tempo (meses): <input type="text" name="tempo" required><br>
    <input type="submit" value="Calcular">
</form>

<% 
    String capitalStr = request.getParameter("capital");
    String taxaStr = request.getParameter("taxa");
    String tempoStr = request.getParameter("tempo");

    if (capitalStr != null && taxaStr != null && tempoStr != null) {
        try {
            double capital = Double.parseDouble(capitalStr);
            double taxa = Double.parseDouble(taxaStr) / 100;
            int tempo = Integer.parseInt(tempoStr);

            out.println("<h3>Resultado</h3>");
            out.println("<table border='1'><tr><th>Mês</th><th>Montante</th></tr>");

            double montante = capital;
            for (int i = 1; i <= tempo; i++) {
                montante *= (1 + taxa);
                out.println("<tr><td>" + i + "</td><td>R$ " + String.format("%.2f", montante) + "</td></tr>");
            }
            out.println("</table>");
        } catch (NumberFormatException e) {
            out.println("<p style='color:red;'>Erro: Insira valores numéricos válidos.</p>");
        }
    }
%>

    </body>
</html>
