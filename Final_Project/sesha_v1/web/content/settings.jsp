<%-- 
Document   : main
Created on : Nov 30, 2021, 10:05:12 AM
Author     : Tommy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.io.IOException,java.io.PrintWriter,javax.servlet.ServletException,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse"%>
<% 
String uuid = (String) session.getAttribute("uuid");
String email = (String) session.getAttribute("email");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sesha</title>

        <!-- bootstrap 5 CSS followed by global css -->

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
              rel="stylesheet" 
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
              crossorigin="anonymous">
        <link href="./resources/global-styles.css"
              rel="stylesheet"
              type="text/css">
        <link rel="shortcut icon" type="image/ico"
                                  href="./resources/images/favicon.ico">
    </head>

    <body onLoad="modiifyHeader()">

            <!--Site wide header -->
            <div class="container-flex global-shell">

                <jsp:include page="/resources/header.jsp"/>

                <div class="row p-1 align-items-center justify-cosntent-center main">
                    <div class="col-1">
                    </div>
                    <div class="col-10 main-content">

                            <div class="mb-3 col text-center course">
                                <div class="card shadow mb-3" style="max-width: 540px;">
                                    <div class="row g-0">
                                        <div class="col-md-4">
                                            <img src="https://thispersondoesnotexist.com/image" class="img-fluid rounded-start" alt="Your Account.">
                                        </div>
                                        <div class="col-md-8">
                                            <div class="card-body">
                                                <h5 class="card-title"><%= email %></h5>
                                                <p class="card-text">
                                                You are loged in as user #<%= uuid%>.
                                                </p>
                                                <form  action="seshaServlet" method="post">   
                                                    <input type="hidden" name="exit" value="yes">
                                                    <button id="myCoursesButton"
                                                        class="btn btn-secondary"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="bottom"
                                                        title="Hasta manana!"
                                                        type="submit" 
                                                        name="action" 
                                                        value="myCourses">
                                                        Log Out.</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-1">
                    </div>
                </div>            
                <jsp:include page="/resources/footer.jsp"/>
            </div>
            <!-- bootstrap JavaScript followed by Global JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
                    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
                    crossorigin="anonymous"></script>
            <script src="./resources/index.js"></script>
            
             <script src="https://weave.cs.nmt.edu/apollo8/sesha/resources/global-js.js"></script>
    </body>
</html>

