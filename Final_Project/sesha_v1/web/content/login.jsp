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
    String actionFWD = request.getParameter("actionFWD");
    if(actionFWD==null){
        actionFWD = "myCourses";
    }
    String courseID = request.getParameter("courseID");
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
        <!-- Popup pages 
            <div id="codeEntryOverlay" class="invisible">
            <div id="background" onClick="hideEnterCode()"></div>
            <div id="codeEntry">
            <h2>Enter code</h2>
            <input type="text" id="codeTextBox" name="Search" placeholder="xxxx-xxxx-xxxx">
            <button onClick="hideEnterCode()">Enter</button>
            </div>
            </div>-->

            <!--Site wide header -->
            <div class="container-flex global-shell">

                <jsp:include page="/resources/header.jsp"/>

                <div class="row p-1 align-items-center justify-cosntent-center main">
                    <div class="col-1">
                    </div>
                    <div class="col-5 main-content">
                        <div class="row align-items-center justify-content-center
                                    row-cols-auto">

                            <div class="mb-3 col align-center course">
                                <div class="card shadow" style="width: 18rem;">
                                    <div class="card-body">
                                        <h5 class="card-header">
                                            Login / Register
                                        </h5>
                                        <p class="card-text">
                                        If you don't already have an account it
                                        will be automagically made for you.
                                        </p>
                                        <form action="seshaServlet" method="post">
                                            <input type="hidden" name="action" value="<%=actionFWD%>">
                                            <%if(courseID!=null){%>
                                                <input type="hidden" name="courseID" value="<%=courseID%>">                                            
                                            <%}%>
                                            <div class="mb-3">
                                                <label for="loginEmail" class="form-label">Email address</label>
                                                <input type="email" class="form-control" id="loginEmail" aria-describedby="emailHelp" name="loginEmail">
                                                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="loginPassword" class="form-label">Password</label>
                                                <input type="password" class="form-control" id="loginPassword" name="loginPassword">
                                            </div>
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </form>
                                    </div>
                                </div>     
                            </div>

                        </div>
                    </div>
                    <div class="col-5 main-content">
                        <div class="row align-items-center justify-content-center
                                    row-cols-1">


                            <div class="mb-3 col align-center course">
                                <div class="card shadow" style="width: 18rem;">
                                    <div class="card-body">
                                        <p class="card-text">
                                            <% 
                                            String login_status = request.getParameter("login_status"); 
                                            String color = request.getParameter("color"); 
                                            if (login_status != null){
                                            %>
                                            <div class="alert alert-<%= color%>" role="alert">
                                                <%= login_status%>
                                              
                                            </div>
                                            <%
                                            }
                                            %>
                                        <ul> 
                                            <li> Your email must be valid </li>
                                            <li> Your password be 8 or more symbols </li>
                                            <li> Your password may not contain " ' ` or % </li>
                                        </ul>
                                    </div>
                                </div>     
                            </div>

                            <div class="mb-3 col align-center course">
                                <div class="card shadow" style="width: 18rem;">
                                    <div class="card-body">
                                        <h5 class="card-header">
                                           OAuth2.0
                                        </h5>
                                        <p class="card-text">
                                        Login with any of these services.
                                        </p>
                                        <form>
                                            <% 
                                            StringBuilder oauthUrl = new StringBuilder();
                                            oauthUrl.append("https://accounts.google.com/o/oauth2/auth")
                                            .append("?client_id=").append("412919532344-nmjojrndr95e02e6acrfg4gsgt064p20.apps.googleusercontent.com") 
                                            .append("&response_type=code")
                                            .append("&scope=profile%20email") 
                                            .append("&redirect_uri=").append("https://weave.cs.nmt.edu/apollo8/sesha/") 
                                            .append("&state=").append(request.getSession().getId())
                                            .append("&approval_prompt=force"); 
                                            %>
                                            <a href="<%= oauthUrl%>" class="btn btn-primary">Google oAuth2.0</a>
                                        </form>
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
    </body>
</html>

