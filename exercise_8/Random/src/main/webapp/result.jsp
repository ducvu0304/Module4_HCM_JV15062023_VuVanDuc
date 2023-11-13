<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result</title>
    <style>
        .even {
            background-color: green;
        }
        .odd {
            background-color: yellow;
        }
    </style>
</head>
<body>
    <table>

        <tr class="">
            <th>STT</th>
            <th>Number</th>
        </tr>
        <%
            List list =  new ArrayList<>();
        %>
        <%
            int[] numbers = (int[]) request.getAttribute("numbers");
            for (int i = 0; i < numbers.length; i++) {
                String rowClass = (i % 2 == 0) ? "even" : "odd";
        %>

        <tr class="<%= rowClass %>">
            <td><%= i + 1 %></td>
            <td><%= numbers[i] %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>