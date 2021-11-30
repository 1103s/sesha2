<%-- 
    Document   : test
    Created on : Nov 30, 2021, 12:53:51 PM
    Author     : Natalie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
<form action="seshaServlet" method="post">
    
  <input type="hidden" name="action" value="shop">
  <input type="submit" value="Continue Shopping">
</form>

<form action="seshaServlet" method="post">
    
  <input type="hidden" name="action" value="checkout">
  <input type="submit" value="Checkout">
</form>
    </body>
</html>
