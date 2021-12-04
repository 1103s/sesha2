<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // First get the session 
    HttpSession session = request.getSession(true);
    // Get the page the user wants to view;
    String courseID = request.getParameter("courseID");
    //Check to see if they are loged in
    boolean is_loged_in = session.isNew();
    //Get there user id
    String uuid = (String) session.getAttribute("uuid");
    //Redirect them if they are not loged in
    if (!is_loged_in || (uuid == null)) {
    %>
        <jsp:forward page="/content/login.jsp" />
    <%
    } else if (courseID != null) {
        // get user acl 
        String acl = (String) session.getProperty("acl")
        // Check if user has access
        if (!acl.contains(courseID)) {
        %>
            <jsp:forward page="/content/denied.jsp" />
        <%
        }
    }
%>
        
        
