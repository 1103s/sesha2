<%-- 
    Document   : fullCoursePage
    Created on : Nov 30, 2021, 1:52:20 AM
    Author     : Natalie
--%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.io.IOException,java.io.PrintWriter,javax.servlet.ServletException,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse"%>
<jsp:include page="/content/auth.jsp" />
<%
    String courseID = request.getParameter("courseID");
    String sectionID = request.getParameter("displaySection");
    
    String search = request.getParameter("search");
    
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
    rs.close();
    stment.close();
%>
<head>
    <%if(favicon!=null){ %>
	<link rel="shortcut icon" href="<%=favicon%>">
    <% } %>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
	<title><%if (name==null){%>Sesha<%}else{%><%=name%><%}%></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
              rel="stylesheet" 
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
              crossorigin="anonymous">
        <link href="https://weave.cs.nmt.edu/apollo8/sesha/resources/global-styles.css"
              rel="stylesheet"
              type="text/css">
	<link rel="stylesheet" type="text/css" href="https://weave.cs.nmt.edu/apollo8/sesha/content/fullCoursePageStyle.css">
</head>

<body onLoad="modifyHeader()">
<div id="videooverlay">
	<div id = "playercontainer">
		<div id = "close" onClick="closeVideo()">Close Video [X]</div>
		<video controls id="player" autoplay></video>
	</div>
	<h1 id="title"></h1>
	<div id = "description"></div>			
</div>
<div id = "background" onClick="closeVideo()"></div>

<jsp:include page="../resources/header.jsp"/>

<div id="displaySection">
	<table>
		<tr>    
			<th width="300px">
                            <%if(logo!=null){ %>                            
				<a href="" ><img src="<%=logo%>" alt="<%=name%> logo" width = "250" ></a>                                
                            <% } %>
                                
			</th>       
                        
                        <%  stment = conn.createStatement();
                            sectionsQuery = "SELECT DISTINCT sectionName, sectionID FROM courseSections where courseID = " + courseID + " ORDER BY sectionOrder";
                            rs = stment.executeQuery(sectionsQuery);        

                        %>
                        
			<th id="displaySectionText" valign="bottom">
                            <p>
                            DISPLAY SECTION: 
                            </p>
                            <% while(rs.next()){                            
                                if(sectionID == null){
                                    sectionID = rs.getString("sectionID");
                                } 
                                String curSectionID = rs.getString("sectionID");
                                %>
                                
                                    <form action="seshaServlet" method="post">    
                                        <input type="hidden" name="displaySection" value="<%=curSectionID%>">
                                        
                                        <input type="hidden" name="action" value="viewCourse">
                                        <input type="hidden" name="courseID" value="<%=courseID%>">
                                        <input 
                                   <% if(sectionID.equals(curSectionID)){ %> 
                                         id="currentLink"
                                   <% }else{%>                                    
                                         class="otherLink" 
                                   <% } %>
                                        type="submit" value="<%=rs.getString("sectionName")%>">
                                         <% if(!rs.isLast()) {%>
                                            <a class="spacer"> | </a>  
                                        <% } %>
                                        
                                    </form>
                            <%  }  %>
			</th>
                        <% rs.close();
                            stment.close(); %>
		</tr>
	</table>
</div>\
<form action="seshaServlet" method="post">   
                                        
                <input type="text" 
                       name="search"
                       <%if (search!=null){%>value ="<%=search%>"<%}%>
                    class="form-control" 
                    placeholder="Search this course &#x1f50e;" 
                    aria-label="Search" 
                    aria-describedby="button-addon1">
                                        <input type="hidden" name="courseID" value="<%=courseID%>">
                        <button class="btn btn-outline-secondary" 
                        type="submit" name="action" value="viewCourse" id="button-addon1">Search</button>
                    </form>
<div id="mainpage">
                    <%  
                            stment = conn.createStatement();
                            sectionsQuery = "SELECT * FROM `courseContent` WHERE courseID=" + courseID + " AND sectionID='"+ sectionID  + "' ORDER BY contentOrder";
                            
                            if(search !=null){

                                String searcher = search;
                                searcher = searcher.replaceAll("\\'","\\'\\'");
                                searcher = searcher.replace("\"", "\\\"");
                                searcher = searcher.replace("\\", "\\\\");
                                searcher =  searcher.replace("%", "\\%");
                                searcher = searcher.replace("_", "\\_");                                
                                sectionsQuery =     "SELECT DISTINCT * from (SELECT * FROM `courseContent` WHERE courseID='" 
                                    +courseID+"' and mainContentName LIKE '%"+searcher+"%'   UNION ALL SELECT * FROM `courseContent` WHERE courseID='" 
                                    +courseID+"' and extraName LIKE '%"
                                    +searcher+"%'UNION ALL  SELECT * FROM `courseContent` WHERE courseID='" 
                                    +courseID+"' and contentDesc LIKE '%"+searcher+"%')s";
                            }
                            
                            rs = stment.executeQuery(sectionsQuery);
                        %>
                        
                    <% while(rs.next()){ %> 
                        <div class="element">
                            <div class="row1">
                                <% if(rs.getInt("mainContentType")== 0){
                                    
                                    
                                    String contentDesc = rs.getString("contentDesc");
                                    
                                    if(contentDesc != null){
                                    contentDesc = contentDesc.replace("\"", "");
                                    contentDesc = contentDesc.replace("\'","\\\'");
                                    }
                                    String contentName = rs.getString("mainContentName");
                                    contentName = contentName.replace("\"", "");
                                    contentName = contentName.replace("\'","\\\'");
                                %>
                                    <a class="video" onclick="displayVideo('<%=rs.getString("mainContentURL")%>','<%=contentName%>','<%=contentDesc%>')"><%=rs.getString("mainContentName")%></a>
                                 <% } else if(rs.getInt("mainContentType")== 2){%>
                                    <a class="pdf" href="<%=rs.getString("mainContentURL")%>" target="_blank"><%=rs.getString("mainContentName")%></a>
                                 <% } %>
                                 <% if(rs.getString("extraURL")!=null) {%>       
                                    <a class="spacer">&nbsp;&nbsp;|&nbsp;&nbsp;</a>                             
                                    <% if(rs.getInt("extraType")== 2){%>
                                        <a class="pdf" href="<%=rs.getString("extraURL")%>" target="_blank"><%=rs.getString("extraName")%></a>
                                    <%} else if(rs.getInt("extraContentType")== 0){%>
                                       <a class="video" onclick="displayVideo('<%=rs.getString("extraContentURL")%>','<%=rs.getString("extraContentName")%>','<%=rs.getString("contentDesc")%>')"><%=rs.getString("extraContentName")%></a>
                                    <% } %>
                                 <% } %>
                            </div>
                            <div class="row2">
                                <%if(rs.getString("contentDesc")!=null){%>
                                <%=rs.getString("contentDesc")%>
                                <% } %>
                            </div>
                            <div class="row3"></div>
                        </div>
                    <%  }  rs.close();
                    stment.close(); %>
                </div>
<div id="tags"></div>
<jsp:include page="../resources/footer.jsp"/>

        

<script src="https://weave.cs.nmt.edu/apollo8/sesha/content/fullCoursePageScpript.js">
    

</script>
<script>
    function modiifyHeader(){
    document.getElementById("myCoursesButton").classList.add("active");
}
</script>

</body>
</html>

<%
    conn.close();
%>
