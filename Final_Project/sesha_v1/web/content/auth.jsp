<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%
//Check to see if they are loged in
//boolean is_loged_in = session.isNew();
// Check to see if they need ot be loged out.
if  (request.getParameter("exit") != null){
    session.invalidate();
    %>
    <jsp:forward page="/content/login.jsp" >
    <jsp:param name="login_status" value="You are now logged out." />
    <jsp:param name="color" value="success" />
    </jsp:forward >
    <%
}
//Get there user id
String uuid = (String) session.getAttribute("uuid");
ResultSet rs;
String sectionsQuery;
String driver = "org.mariadb.jdbc.Driver";
Class.forName(driver);
String dbURL = "jdbc:mariadb://localhost:3306/apollo8_sesha";
String username = "apollo8";
String dbpassword = "Ea8AHNGh";
Connection conn = DriverManager.getConnection(dbURL, username, dbpassword);   
Statement stment = conn.createStatement();
//Make / login if paramters are there
String email = request.getParameter("loginEmail");
String password = request.getParameter("loginPassword");
if ((uuid == null) && (email != null) && (password != null)){
    boolean error = false;
    //if (!email.matches("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$")){
    //   error = true;
    // }
    if (password.length() < 8 ){
        error = true;
    }
    if (password.contains("\"") || password.contains("`") || password.contains("\'") || password.contains("%")) {
        error = true;
    }
    if (error){
        stment.close();
        conn.close();
        %>
        <jsp:forward page="/content/login.jsp" >
        <jsp:param name="login_status" value="Your login is invalid." />
        <jsp:param name="color" value="danger" />
        </jsp:forward >
        <%
    } else {
        sectionsQuery = "SELECT * FROM allUsers WHERE email='" + email +"'";
        rs = stment.executeQuery(sectionsQuery);    
        if(!rs.isBeforeFirst()){
            sectionsQuery = "INSERT INTO `allUsers` (`userID`, `email`, `password`) VALUES (NULL, '" + email + "', '" + password + "');";
            rs = stment.executeQuery(sectionsQuery);    
            %>
            <jsp:forward page="/content/login.jsp" >
            <jsp:param name="login_status" value="Your account has been made! Now you need to log in." />
            <jsp:param name="color" value="success" />
            </jsp:forward >
            <%
            rs.close();
            stment.close();
            conn.close();
        } else {
            while(rs.next()) {
                if (rs.getString("email").equalsIgnoreCase(email) && rs.getString("password").equalsIgnoreCase(password)){
                    uuid = rs.getString("userID");
                    session.setAttribute("uuid", uuid);
                    session.setAttribute("email", email);
                    rs.close();
                    stment.close();
                    conn.close();
                    break;
                }
            }
        }
    }
}


// Get the page the user wants to view;
String courseID = request.getParameter("courseID");
String is_settings = request.getParameter("settings");
//Redirect them if they are not loged in
if ((uuid == null)) {
    stment.close();
    conn.close();
    %>
    <jsp:forward page="/content/login.jsp" >
    <jsp:param name="login_status" value="You are not loged in!" />
    <jsp:param name="color" value="primary" />
    </jsp:forward >
    <%
} else if (is_settings != null) {
        stment.close();
        conn.close();
        %>
        <jsp:forward page="/content/settings.jsp" />
        <%
} else if (courseID != null) {
    //pass to user setings if needed
    sectionsQuery = "SELECT * FROM courseOwnership WHERE userID=" + uuid + ";";
    rs = stment.executeQuery(sectionsQuery);    
    boolean has_course = false;
    if(rs.isBeforeFirst()){
        while(rs.next()) {
            if (rs.getString("courseID").equalsIgnoreCase(courseID)){
                has_course = true;
                break;
            }
        }
    } 
    rs.close();
    stment.close();
    conn.close();
    // Check if user has access
    if (!has_course) {
        %>
        <jsp:forward page="/content/login.jsp" >
        <jsp:param name="login_status" value="You do not have access to this." />
        <jsp:param name="color" value="warning" />
        </jsp:forward >
        <%
    }
}
%>


