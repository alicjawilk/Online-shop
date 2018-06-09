<%@ page import="pl.javastart.model.Product" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Alicja Wilk
  Date: 08.06.2018
  Time: 18:50
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Twój koszyk</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
</head>
<body>
    <h1>Twoje zakupy</h1>
    <table class="table table-striped" style="width:20%">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Nazwa</th>
            <th scope="col">Cena</th>
        </tr>
        </thead>
        <tbody>
        <%
            ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products");
            int i=0;
            for (Product product : products) {
                i++;
        %>
        <tr>
            <th scope="row"><%= i%></th>
            <td><%= product.getName()%></td>
            <td><%= product.getPrice()%></td>
            <%
                }
            %>
        </tr>
        </tbody>
    </table>
    <%double sum = (Double) request.getAttribute("sum");
        double average = (Double) request.getAttribute("average");%>
    <h2>Suma: <%=sum%></h2>
    <h2>Średnia cena za produkt: <%=average%></h2>

    <a href="\glowna.html">Powrót do strony głównej</a>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>
</html>
