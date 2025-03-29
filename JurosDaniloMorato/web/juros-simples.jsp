<%-- 
    Document   : juros-simples
    Created on : 29 de mar. de 2025, 05:52:20
    Author     : morat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juros Simples</title>
    </head>
    <body>

        <%@include file="WEB-INF/jspf/menu.jspf"%>
        
      

<h2>Juros Simples</h2>

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

            double montante = capital * (1 + (taxa * tempo));

            out.println("<h3>Resultado</h3>");
            out.println("Montante Final: R$ " + String.format("%.2f", montante));
        } catch (NumberFormatException e) {
            out.println("<p style='color:red;'>Erro: Insira valores numéricos válidos.</p>");
        }
    }
%>

        
        
        
       
    </body>
</html>
