<%-- 
    Document   : fullCoursePage
    Created on : Nov 30, 2021, 1:52:20 AM
    Author     : Natalie
--%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.io.IOException,java.io.PrintWriter,javax.servlet.ServletException,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse"%>
<%
    String courseID = request.getParameter("courseID");
    String sectionID = request.getParameter("displaySection");
 %>
 <%
    String driver = "org.mariadb.jdbc.Driver";
    Class.forName(driver);
    
    String dbURL = "jdbc:mariadb://localhost:3306/apollo8_sesha";
    String username = "apollo8";
    String password = "Ea8AHNGh";
    Connection conn = DriverManager.getConnection(dbURL, username, password);%>      
   
<!DOCTYPE html>
<!doctype html>
<html>
                    
<%  Statement stment = conn.createStatement();
    String sectionsQuery = "SELECT faviconURL, logoImageURL, courseName FROM courses where courseID = " + courseID;
    ResultSet rs = stment.executeQuery(sectionsQuery);                          
    String favicon = null;
    String logo = null;
    String name = null;
    if(rs.next()){
        favicon = rs.getString("faviconURL");
        logo = rs.getString("logoImageURL");
        name = rs.getString("courseName");
    }
    stment.close();
%>
<head>
    <%if(favicon!=null){ %>
	<link rel="shortcut icon" href="<%=favicon%>">
    <% } %>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
	<title>Digital Video Resource Library</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
              rel="stylesheet" 
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
              crossorigin="anonymous">
        <link href="https://weave.cs.nmt.edu/apollo8/sesha/resources/global-styles.css"
              rel="stylesheet"
              type="text/css">
	<link rel="stylesheet" type="text/css" href="https://weave.cs.nmt.edu/apollo8/sesha/content/previewCoursePageStyle.css">
</head>

<body onLoad="modiifyHeader()">

<jsp:include page="../resources/header.jsp"/>
            <div class="row p-1 align-items-center justify-cosntent-center main">
                <div class="col-1">
                </div>
                <div class="col-7 main-content">
                        <div class="row align-items-center justify-content-arround
                            row-cols-auto">

                    <%  stment = conn.createStatement();
                        sectionsQuery = "SELECT * FROM courses where courseID = "+courseID;
                        rs = stment.executeQuery(sectionsQuery);    
                        if(rs.next()){%>
                        <main id="bigContent">
                            <h2><%=rs.getString("courseName")%></h2>
                            <section id="previewPurchase">
                                <video controls id="previewVideo" ><source src="<%=rs.getString("previewVideoUrl")%>"/></video>
                                                                        <%  Statement stmentOwner = conn.createStatement();
                                        String sectionsQueryOwner = "SELECT * FROM courseOwnership WHERE userID=1 and courseID = " + rs.getString("courseID");
                                        ResultSet rsOwner = stment.executeQuery(sectionsQueryOwner);
                                        
                                    if(rsOwner.isBeforeFirst()){%>
                                    <form class="viewCourse" action="seshaServlet" method="post">    
                                        <input type="hidden" name="courseID" value="<%=rs.getString("courseID")%>">
                                        <input type="hidden" name="action" value="viewCourse">
                                        <input class="btn btn-primary" type="submit" value="View Course">
                                    </form>
                                    <%} else {%>
                                    <form action="seshaServlet" method="post">    
                                        <input type="hidden" name="courseID" value="<%=rs.getString("courseID")%>">
                                        <input type="hidden" name="action" value="viewCourse">
                                        <input class="btn btn-primary" type="submit" value="Purchase Course">
                                    </form>
                                    <%} rsOwner.close();
                                        stmentOwner.close();%>
                            </section>
                            <section>
                                <div id="courseDescription"> <%=rs.getString("courseDescription")%></div>
                                <div id="skillList">
                                        <%  
                                            Statement stmentSkills = conn.createStatement();
                                            sectionsQuery = "SELECT skillText FROM `courseSkills` WHERE courseID=" + courseID + " ORDER BY skillOrder";
                                            ResultSet rsSkills = stment.executeQuery(sectionsQuery);
                                            while(rsSkills.next()){
                                        %>
                                        <%if(rsSkills.isFirst()){%>
                                        <p>List of skills</p>
                                        <ul>
                                        <%}%>
                                            <li><%=rsSkills.getString("skillText")%></li>
                                           
                                        <%if(rsSkills.isLast()){%>
                                        </ul>
                                        <%}%>
                                        <% }    rsSkills.close();
                                            stmentSkills.close(); %>
                                </div>
                                <div id="bookInfo"> 
                                    <%if(rs.getString("bookImageURL")!=null){%>
                                    <image id = "bookImage" src="<%=rs.getString("bookImageURL")%>" alt="<%=rs.getString("courseName")%> book image"/>
                                    <%}%>
                                    
                                    <%if(rs.getString("bookImageURL")!=null){%>
                                    <image src="<%=rs.getString("bookDescription")%>" alt="<%=rs.getString("courseName")%> book image"/>
                                    <%}%>
                                </div>
                            </section>
                        </main>
                    <% }rs.close();
                        stment.close(); %>
                    </div>
                </div>                    
                <jsp:include page="../resources/categories.jsp"/>
                <div class="col-1">
                </div>
            </div>     
<div id="tags"></div>
<jsp:include page="../resources/footer.jsp"/>
<script src="https://weave.cs.nmt.edu/apollo8/sesha/content/previewCoursePageScript.js">

</script>

</body>
</html>

<%
    conn.close();
%>