<%-- 
    Document   : main
    Created on : Nov 30, 2021, 10:05:12 AM
    Author     : Natalie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.io.IOException,java.io.PrintWriter,javax.servlet.ServletException,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse"%>
<jsp:include page="/content/auth.jsp?strict=false" /> 
<%     
    String categoryID = request.getParameter("categoryID");
    String uuid = (String) session.getAttribute("uuid");
    String search = request.getParameter("search");
    
    if(uuid == null){
        uuid="-1";
    }
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

        <!--Site wide header -->
        <div class="container-flex global-shell">
            
            <jsp:include page="./resources/header.jsp"/>
            
            <div class="row p-1 align-items-center justify-cosntent-center main">
                <div class="col-1">
                </div>
                <div class="col-10 col-lg-7  main-content">
                        

                    <%  Statement stment = conn.createStatement();
                        String sectionsQuery = "Select * from categoryName LIMIT 4";
                        
                        if (categoryID!=null)
                        {
                            sectionsQuery = "Select * from categoryName WHERE categoryID = "+categoryID;
                        }
                        ResultSet rs = stment.executeQuery(sectionsQuery);
                        
                        if(search==null && (categoryID==null || !categoryID.equals("0"))){
                        
                        while(rs.next()){%>
                        <div id="category<%=rs.getString("categoryID")%>">
                            <h2 class="row align-items-center justify-content-arround
                            row-cols-auto categoryText" width="100%" ><%=rs.getString("categoryText")%></h2>
                            
                            <div class="row align-items-center justify-content-arround
                                 row-cols-auto">
                                <%  
                                    int limit=3;
                                    if(rs.getString("categoryID").equals(categoryID))
                                    {
                                        limit = 50;
                                    }
                                
                                sectionsQuery = "Select courses.* FROM courses join categoryLinks on courses.courseID = categoryLinks.courseID WHERE categoryLinks.categoryID="+rs.getString("categoryID");
                            ResultSet rsInner = stment.executeQuery(sectionsQuery);
                            int numCourses = 0;
                            while( rsInner.next() ){numCourses++;%>
                            <div class="mb-3 col course <%if( numCourses > limit){%> dispNone <%}%>">
                                   <div class="card shadow" style="width: 18rem;">
                                       <img src="<%=rsInner.getString("previewImageURL")%>"
                                            class="card-img-top" alt="<%=rsInner.getString("courseName")%> course image">
                                       <div class="card-body">
                                           <h5 class="card-title">
                                               <%=rsInner.getString("courseName")%>
                                           </h5>
                                           <p class="card-text">
                                               <%=rsInner.getString("courseDescription")%>
                                           </p>

                                           <%  
                                               String sectionsQueryOwner = "SELECT * FROM courseOwnership WHERE userID="+uuid+" and courseID = " + rsInner.getString("courseID");
                                               ResultSet rsOwner = stment.executeQuery(sectionsQueryOwner);

                                            %>
                                            <form id="view_<%=rsInner.getString("courseID")%>" class="viewCourse invisible" action="seshaServlet" method="post">    
                                                <input type="hidden" name="courseID" value="<%=rsInner.getString("courseID")%>">
                                                <input type="hidden" name="action" value="viewCourse">
                                            </form>
                                            <form id="preview_<%=rsInner.getString("courseID")%>" class="viewPreview invisible" action="seshaServlet" method="post">    
                                                <input type="hidden" name="courseID" value="<%=rsInner.getString("courseID")%>">
                                                <input type="hidden" name="action" value="viewPreview">
                                            </form>
                                            <div class="btn-group text-center">

                                            <%

                                           if(rsOwner.isBeforeFirst()){%>
                                                <input form="view_<%=rsInner.getString("courseID")%>"  class="btn btn-primary" type="submit" value="Open">
                                           <%} rsOwner.close();
                                               %>
                                                <input form="preview_<%=rsInner.getString("courseID")%>"  class="btn btn-primary" type="submit" value="Preview">
                                            
                                            </div>
                                            
                                       </div>
                                   </div>
                               </div>
                            <%}%> 
                            </div>
                            <%if(numCourses>limit){%>
                            <div class="align-items-center justify-content-end
                                 row expander"> 
                                <div class="col-5">
                                </div>
                                <div class="col-5">
                            
                                           
                                <input class="btn px-3 btn-light btn-sm" onclick="expandSection('category<%=rs.getString("categoryID")%>')" type="submit" value="Show More">
                                </div>
                                <div class="col-2">
                                </div>
                                           

                            </div> <%}%>
                            </div>
                            
                            <%rsInner.close();
                            }

                        rs.close();
                        stment.close(); %>
                        
                            <form class="pill-nav" action="seshaServlet" method="post">    
                                <input type="hidden" name="categoryID" value="0">                    
                                <button  class="mb-3 btn btn-info" type="submit" name="action" value="store">View All Courses</button>
                            </form>
                        <%}
                        else{
                        if(search!=null){
                        stment = conn.createStatement();
                        String searcher = search;
                        searcher = searcher.replaceAll("\\'","\\'\\'");
                        searcher = searcher.replace("\"", "\\\"");
                        searcher = searcher.replace("\\", "\\\\");
                        searcher =  searcher.replace("%", "\\%");
                        searcher = searcher.replace("_", "\\_");
                        
                        %><h3 class="row align-items-center justify-content-arround
                                 row-cols-auto">Search Results for: <%=search%></h3><%
                        sectionsQuery = "SELECT DISTINCT * from (SELECT * FROM `courses` WHERE courseName LIKE '%"+searcher+"%'    UNION ALL SELECT * FROM `courses` WHERE courseDescription LIKE '%"+searcher+"%'	UNION ALL  SELECT * FROM `courses` WHERE bookDescription LIKE '%"+searcher+"%')s";
                        
                        }else{
                            sectionsQuery = "Select * FROM courses";
                        }
                        rs = stment.executeQuery(sectionsQuery);%>
                        <div class="row align-items-center justify-content-arround
                                 row-cols-auto">
                        
                         <%while( rs.next() ){%>
                            <div class="mb-3  col course">
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

                                           <%  
                                               String sectionsQueryOwner = "SELECT * FROM courseOwnership WHERE userID="+uuid+" and courseID = " + rs.getString("courseID");
                                               ResultSet rsOwner = stment.executeQuery(sectionsQueryOwner);
                                            %>
                                            <form id="view_<%=rs.getString("courseID")%>" class="viewCourse invisible" action="seshaServlet" method="post">    
                                                <input type="hidden" name="courseID" value="<%=rs.getString("courseID")%>">
                                                <input type="hidden" name="action" value="viewCourse">
                                            </form>
                                            <form id="preview_<%=rs.getString("courseID")%>" class="viewPreview invisible" action="seshaServlet" method="post">    
                                                <input type="hidden" name="courseID" value="<%=rs.getString("courseID")%>">
                                                <input type="hidden" name="action" value="viewPreview">
                                            </form>
                                            <div class="btn-group text-center">

                                            <%

                                           if(rsOwner.isBeforeFirst()){%>
                                                <input form="view_<%=rs.getString("courseID")%>"  class="btn btn-primary" type="submit" value="Open">
                                           <%} rsOwner.close();
                                               %>
                                                <input form="preview_<%=rs.getString("courseID")%>"  class="btn btn-primary" type="submit" value="Preview">
                                            
                                            </div>

                                       </div>
                                   </div>
                               </div>
                            
                        <%}%></div><%}%>
                    </div>
                    
                <div class="col-md-12 col-lg-3  align-self-start text-center text-wrap main-sidebar">
                    <div class="align-items-start justify-content-arround
                        row-cols-auto text-center text-wrap">

                        <div class="col pill-nav">

                                
                                
                            <form action="seshaServlet" method="post">   
                                <div class="input-group mb-3">
                                        
                                <input type="text" 
                                       name="search"
                                       <%if (search!=null){%>value ="<%=search%>"<%}%>
                                    class="form-control" 
                                    placeholder="search courses &#x1f50e;" 
                                    aria-label="Search" 
                                    aria-describedby="button-addon1">
                                        <button class="btn btn-outline-secondary" 
                                        type="submit" name="action" value="store" id="button-addon1">Search</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="row px-1 align-items-start justify-content-arround
                        text-center text-nowrap">
                        <%   stment = conn.createStatement();
                         sectionsQuery = "SELECT * FROM categoryName";
                         rs = stment.executeQuery(sectionsQuery);
                        while(rs.next()){%>
                            <div class="col p-1">
                            <form class="pill-nav" action="seshaServlet" method="post">    
                                <input type="hidden" name="categoryID" value="<%=rs.getString("categoryID")%>">                    
                                <button  class="mb-3 btn btn-info" type="submit" name="action" value="store"><%=rs.getString("categoryText")%></button>
                            </form>
                            </div>
                        <%} rs.close();
                            stment.close();%>
                            
                                
                                               <%   if (categoryID!=null || search!=null)
                                            {%>
                                    <form action="seshaServlet" method="post">   
                                        <button class="btn btn-outline-secondary" 
                                        type="submit" name="action" value="store" id="button-addon1">Reset</button>
                                    </form>
                                    <%}%>
                    </div>
                </div>
                <%--<jsp:include page="./resources/categories.jsp"/>--%>
                <div class="col-1">
                </div>
            </div>            
            <jsp:include page="./resources/footer.jsp"/>
        </div>
        <!-- bootstrap JavaScript followed by Global JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
            crossorigin="anonymous"></script>
        <script src="./resources/index.js"></script>
        <script src="./resources/global-js.js"></script>
    </body>
</html>


<%
    conn.close();
%>
