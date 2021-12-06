<%  String uuid2 = (String) session.getAttribute("uuid");
    if(uuid2 == null){
        uuid2="-1";
    }
    String alert = request.getParameter("alert");
    %>
    
        <!-- Popup pages -->
            <div id="codeEntryOverlay">
                <div id="codeBackground" onClick="hideEnterCode()"></div>
                <div id="codeEntry">
                <h2>Enter code</h2>
                
                <form  action="seshaServlet" method="post">   
                    <input type="hidden" name="settings" value="yes">
                        <input type="text" id="codeTextBox" name="codeText" onkeyup="addHyphen(this)" placeholder="xxxx-xxxx-xxxx" maxlength="14">
                        <button class="btn btn-outline-primary" type="submit" name="action" value="purchaseCourse">Enter</button>

                </form>
                </div>
            </div>
<div class="row p-4 rounded-bottom shadow-lg align-items-center justify-content-around header-top">
    <div class="col-1">
    </div>
    <div class="col-1 logo">
        <a href="https://weave.cs.nmt.edu/apollo8/sesha/">
        <img src="https://weave.cs.nmt.edu/apollo8/static/logo.png"
             alt="site logo"
             width="60%"/>
        </a>
    </div>
    <div class="col-5 text-center site-name">
        <h1 id="siteName" class="text-start">
            <a id="seshaLogo" href="#">
                SESHA
            </a>
        </h1>
    </div>
    <div class="col-4 text-end login">
        <form  action="seshaServlet" method="post">   
            <input type="hidden" name="settings" value="yes">
            <button id="myCoursesButton" class="btn btn-outline-primary" type="submit" name="action" value="myCourses">
                <%if (uuid2.equals("-1")){%>
                Login
                <%}else{%>
                My Account
                <%}%>
            </button>
        </form>
            <!--
            <img 
            src="https://icons.veryicon.com/png/o/business/cloud-desktop/user-138.png" 
            width="9%"/>
            -->
    </div>
    <div class="col-1">
    </div>
</div>
  <%if(alert!=null){ %>  
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


  <div class="alert alert-warning" id="warning-alert">      
    <button type="button" class="close" data-dismiss="alert">x</button>
    <%=alert%>
  </div>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  
  <%}%>
<div class="row p-3 align-items-center justify-content-center text-center header-nav rounded">
    <div class="col-3">
    </div>
    <div class="col-5 nav-link">
        <div class="btn-group" role="group">
            <a type="button" id="storeButton"
                href="https://weave.cs.nmt.edu/apollo8/sesha/"
                class="btn btn-outline-primary">Store</a> 
            <form  action="seshaServlet" method="post">   
                <button id="myCoursesButton" class="btn btn-outline-primary" type="submit" name="action" value="myCourses">My Courses</button>
            </form>
            <a type="button" id="enterCodeButton"
                onclick="displayEnterCode()"
                class="btn btn-outline-primary">Enter Code</a>
            <a type="button" id="supportButton"
                onclick="javascript:alert('Requested Empy By Instructor')"
                class="btn btn-outline-primary">Get Support</a>
            <a type="button" id="instructorButton"
                onclick="javascript:alert('Requested Empy By Instructor')"
                class="btn btn-outline-primary">Instructor Portal</a>
        </div>
    </div>
    <div class="col-4">
    </div>
</div>
