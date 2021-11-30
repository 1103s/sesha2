<%-- 
    Document   : fullCoursePage
    Created on : Nov 30, 2021, 1:52:20 AM
    Author     : Natalie
--%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.io.IOException,java.io.PrintWriter,javax.servlet.ServletException,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse"%>
<%
    int courseID = 1;
    String driver = "org.mariadb.jdbc.Driver";
    Class.forName(driver);
    
    String dbURL = "jdbc:mariadb://localhost:3306/apollo8_main";
    String username = "apollo8";
    String password = "Ea8AHNGh";
    
    Connection conn = DriverManager.getConnection(dbURL, username, password);
            
%>
<!DOCTYPE html>
<!doctype html>
<html>
<head>
	<link rel="shortcut icon" href="IMG/favicon.ico">
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
	<title>Digital Video Resource Library</title>
	<link rel="stylesheet" type="text/css" href="fullCoursePageStyle.css">
</head>

<body onLoad="displayTags();bySection(1000)">
<div id="videooverlay">
	<div id = "playercontainer">
		<div id = "close" onClick="closeVideo()">Close Video [X]</div>
		<video controls id="player" autoplay></video>
	</div>
	<h1 id="title"></h1>
	<div id = "description"></div>			
</div>
<div id = "background" onClick="closeVideo()"></div>
<div id="redSpacer"></div>	

<div id="displaySection">
	<table>
		<tr>
			<th width="300px">
				<a href="./displaySection1000.html" ><img src="IMG/FUTURES_Channel_logo.png" alt="The Futures Channel Logo" height = "150" ></a>
			</th>
                        <%  Statement stment = conn.createStatement();
                            String sectionsQuery = "SELECT DISTINCT sectionName FROM courseContent where courseID =" + courseID;
                            ResultSet rs = stment.executeQuery(sectionsQuery);
                        %>
                        
                        
			<th id="displaySectionText" valign="bottom">
                            DISPLAY SECTION: 
                            <% while(rs.next()){ %>                            
                            <a href=".&displaySection=<%=rs.getString("sectionName")%>" id="currentLink"><%=rs.getString("sectionName")%></a><a class="spacer"> | </a>                                        
                            <%  }  %>
			</th>
                        <% stment.close(); %>
		</tr>
	</table>
</div>
<div id="searchBox">
	<table class="headder">
		<tr id="searchBoxButton"  valign="bottom">
			<td id="search"><input type="text" id="textBox" name="Search" placeholder="Search All                &#x1F50E;"></td>
		  	<td > <button id="reset" onclick="bySection(1000)">Reset</button></td>
		</tr>
		<tr id="about" valign="bottom">						
		</tr>
	</table>
</div>
<div id="aboutTagContainer">
	<a id="aboutTag"></a>
	<button id="resetTag" onclick="bySection(1000)">Reset</button>
</div>
<div id="mainpage"></div>
<div id="tags"></div>
<footer></footer>
<script src="fullCoursePageScpript.js">

</script>

</body>
</html>

<%
    conn.close();
%>