<%-- 
    Document   : main
    Created on : Nov 30, 2021, 10:05:12 AM
    Author     : Natalie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import = "java.io.IOException,java.io.PrintWriter,javax.servlet.ServletException,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse"%>
<jsp:include page="/content/auth.jsp" />
 <%
    String categoryID = request.getParameter("categoryID");
    String search = request.getParameter("search");
    
    String driver = "org.mariadb.jdbc.Driver";
    
    Class.forName(driver);
    
    String dbURL = "jdbc:mariadb://localhost:3306/apollo8_sesha";
    String username = "apollo8";
    String password = "Ea8AHNGh";
    Connection conn = DriverManager.getConnection(dbURL, username, password);%>   
<!DOCTYPE html>
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

    <body onLoad="modifyHeader()">
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
            
            <jsp:include page="../resources/header.jsp"/>
            
            <div class="row p-1 align-items-center justify-cosntent-center main">
                <div class="col-1">
                </div>
                <div class="col-7 main-content">

                    <%  
                        String uuid = (String) session.getAttribute("uuid");
                        Statement stment = conn.createStatement();
                        String sectionsQuery = "Select courses.* FROM courses join courseOwnership on courses.courseID = courseOwnership.courseID WHERE courseOwnership.userID=" + 
                                uuid;
                        if(categoryID!=null){
                            sectionsQuery = "Select courses.* FROM courses join courseOwnership on courses.courseID = courseOwnership.courseID join categoryLinks ON courses.courseID = categoryLinks.courseID WHERE courseOwnership.userID=" + 
                                    uuid + " and categoryLinks.categoryID=" + categoryID ;
                        }
                        if(search!=null){
                        String searcher = search;
                        searcher = searcher.replaceAll("\\'","\\'\\'");
                        searcher = searcher.replace("\"", "\\\"");
                        searcher = searcher.replace("\\", "\\\\");
                        searcher =  searcher.replace("%", "\\%");
                        searcher = searcher.replace("_", "\\_");
                        
                        %><div id="results" class="row align-items-center justify-content-arround
                                 row-cols-auto">Search Results for: <%=search%> in My Courses</div><%
                            sectionsQuery += " and (courses.courseName LIKE '%"+searcher+"%' or courses.courseDescription LIKE '%"+searcher+"%' or courses.bookDescription LIKE '%"+searcher+"%')";
                        
                        
                        }
                        sectionsQuery +=" order by courseOwnership.accessDate  DESC";
                        
                        ResultSet rs = stment.executeQuery(sectionsQuery);    
                        if(!rs.isBeforeFirst()){
                                 if(search==null){%>
                        
                        <div class="row align-items-center justify-content-arround
                            row-cols-auto"> There's nothing to show! Browse courses 
                            <form class="shoppingButton" action="seshaServlet" method="post">    
                                <button id="myCoursesButton" type="submit" value="shop" name="action">Here</button>
                            </form>
                        </div>
                        <%}else{%>
                        
                        <div class="row align-items-center justify-content-arround
                            row-cols-auto"> There's nothing to show! Search courses 
                            <form class="shoppingButton" action="seshaServlet" method="post">
                                
                                        <input type="hidden" name="search" value="<%=search%>">
                                <button id="myCoursesButton" type="submit" value="shop" name="action">Here</button>
                            </form>
                        </div><% }}
                        
                        if(categoryID!=null){
                        Statement stment2 = conn.createStatement();
                        ResultSet rs2 =stment2.executeQuery("Select * from categoryName where categoryID = " +categoryID);
                        if(rs2.next()){
                       %>
                            
                            <h2 class="row align-items-center justify-content-arround
                            row-cols-auto categoryText" width="100%" >My <%=rs2.getString("categoryText")%> Courses</h2>
                        <%rs2.close();
                            stment2.close();}} %> 
                            
                        <div class="row align-items-center justify-content-arround
                            row-cols-auto"><%
                        
                       
                        
                     while(rs.next()){%>
                        <div class="mb-3 col course">
                            <div class="card shadow" style="width: 18rem;">
                                <img src="<%=rs.getString("previewImageURL")%>"
                                     class="card-img-top" alt="<%=rs.getString("courseName")%> course image">
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <%=rs.getString("courseName")%>
                                    </h5>
                                    <p class="card-text">
                                        <%=rs.getString("courseDescription")%>
                                    </p>
                                    
                                    <form id="view_<%=rs.getString("courseID")%>" class="viewCourse invisible" action="seshaServlet" method="post">    
                                        <input type="hidden" name="courseID" value="<%=rs.getString("courseID")%>">
                                        <input type="hidden" name="action" value="viewCourse">
                                    </form>
                                    <form id="preview_<%=rs.getString("courseID")%>" class="viewPreview invisible" action="seshaServlet" method="post">    
                                        <input type="hidden" name="courseID" value="<%=rs.getString("courseID")%>">
                                        <input type="hidden" name="action" value="viewPreview">
                                    </form>
                                    <div class="btn-group">
                                        <input form="view_<%=rs.getString("courseID")%>"  class="btn btn-primary" type="submit" value="Open">
                                        <input form="preview_<%=rs.getString("courseID")%>"  class="btn btn-primary" type="submit" value="Preview">
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    <%} rs.close();
                        stment.close(); %>
                    </div>
                </div>

                                <div class="col-3 align-self-start text-center text-wrap main-sidebar">
                    <div class="align-items-start justify-content-arround
                        row-cols-auto text-center text-wrap">

                        <div class="col pill-nav">

                                
                                
                            <form action="seshaServlet" method="post">   
                                <div class="input-group mb-3">
                                        
                                <input type="text" 
                                       name="search"
                                       <%if (search!=null){%>value ="<%=search%>"<%}%>
                                    class="form-control" 
                                    placeholder="search my courses &#x1f50e;" 
                                    aria-label="Search" 
                                    aria-describedby="button-addon1">
                                        <button class="btn btn-outline-secondary" 
                                        type="submit" name="action" value="myCourses" id="button-addon1">Search</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="row px-1 align-items-start justify-content-arround
                        text-center text-nowrap">
                        <%   stment = conn.createStatement();
                         sectionsQuery = "SELECT DISTINCT  categoryName.categoryID, categoryName.categoryText FROM categoryName join categoryLinks on categoryLinks.categoryID = categoryName.categoryID  JOIN courseOwnership on categoryLinks.courseID = courseOwnership.courseID where courseOwnership.userID = " + uuid;
                         rs = stment.executeQuery(sectionsQuery);
                        while(rs.next()){%>
                            <div class="col p-1">
                            <form class="pill-nav" action="seshaServlet" method="post">    
                                <input type="hidden" name="categoryID" value="<%=rs.getString("categoryID")%>">                    
                                <button  class="mb-3 btn btn-info" type="submit" name="action" value="myCourses"><%=rs.getString("categoryText")%></button>
                            </form>
                            </div>
                        <%} rs.close();
                            stment.close();%>
                            
                                
                                               <%   if ( search!=null||categoryID!=null)
                                            {%>
                            <div class="col p-1">
                                    <form action="seshaServlet" method="post">   
                                        <button class="btn btn-outline-secondary" 
                                        type="submit" name="action" value="myCourses" id="button-addon1">Reset</button>
                                    </form>
                            </div>
                                    <%}%>
                    </div>
                </div>
                <div class="col-1">
                </div>
            </div>            
                    

            <jsp:include page="../resources/footer.jsp"/>
        </div>
        <!-- bootstrap JavaScript followed by Global JS -->
        <script>
            function modifyHeader(){
                document.getElementById("myCoursesButton").classList.add("active");
            }</script>
        <script src="https://weave.cs.nmt.edu/apollo8/sesha/content/myCoursesPageScript.js"></script>
        <script src="https://weave.cs.nmt.edu/apollo8/sesha/resources/global-js.js"></script>
    </body>
</html>


<%
    conn.close();
%>
