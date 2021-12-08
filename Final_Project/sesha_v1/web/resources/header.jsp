<%  String uuid2 = (String) session.getAttribute("uuid");
    if(uuid2 == null){
        uuid2="-1";
    }
    String alert = request.getParameter("alert");
    String action = request.getParameter("action");
    String is_active = "";
    if (action != null && action.equals("myCourses")){
        is_active = " active "; 
    } 
    %>
    
        <!-- Popup pages -->
            <div class="modal fade" tabindex="-1" id="enter_code_modal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Enter Code</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p>Enter the class code given to you by your instructor.</p>
                        <form  id="add_code" action="seshaServlet" method="post">   
                            <input type="hidden" name="settings" value="yes">
                            <input type="text" id="codeTextBox" name="codeText" onkeyup="addHyphen(this)" placeholder="xxxx-xxxx-xxxx" maxlength="14">

                        </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button class="btn btn-outline-primary" type="submit" name="action" value="purchaseCourse" form="add_code">Add Class</button>
                        </div>
                    </div>
                </div>
            </div>

<div class="row p-4 rounded-bottom shadow-lg align-items-center justify-content-around header-top">
    <div class="col-1">
    </div>
    <div class="col-1 logo">
        <a href="https://weave.cs.nmt.edu/apollo8/sesha/">
        <img src="https://weave.cs.nmt.edu/apollo8/static/logo.png"
             alt="site logo"
             width="50px"/>
        </a>
    </div>
    <div class="col-5 text-center site-name">
        <h1 id="siteName" class="text-start">
            <a id="seshaLogo" href="https://weave.cs.nmt.edu/apollo8/sesha/">
                SESHA
            </a>
        </h1>
    </div>
    <div class="col-4 text-end login">
        <form  action="seshaServlet" method="post">   
            <input type="hidden" name="settings" value="yes">
            <button id="loginButton" class="btn btn-outline-primary" type="submit" name="action" value="myCourses">
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
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <form id="go_to_courses" class="invisible" action="seshaServlet" method="post">   </form>


  <%if(alert!=null){ %>  
  
  
  <div class="alert alert-warning" id="warning-alert">      
    <button type="button" class="close" data-dismiss="alert">x</button>
    <%=alert%>
  </div>
  
  <script>
      $(document).ready(function() {
  $("#warning-alert").hide();
    $("#warning-alert").fadeTo(2000, 500).slideUp(500, function() {
      $("#warning-alert").slideUp(500);
    });
});
  </script>
  <%}%>
<div class="row p-3 align-items-center text-center header-nav rounded">
    <div class="col-sm-12 col-12 nav-link">
        <table class="btn-group" role="group">
            <tr>
                <td><button  id="storeButton"  onclick="location.href='https://weave.cs.nmt.edu/apollo8/sesha/'" type="button"
                class="navButton btn btn-outline-primary">Store</button> </td>
            <td><button form="go_to_courses"  id="myCoursesButton" class="navButton btn btn-outline-primary <%= is_active%>" type="submit" name="action" value="myCourses">My Courses</button></td>
            <td><button type="button" id="enterCodeButton" 
                data-bs-toggle="modal"
                href="#enter_code_modal"
                class="navButton btn btn-outline-primary">Enter Code</button></td>
            <td><button type="button" id="supportButton" 
                onclick="javascript:alert('Requested Empy By Instructor')"
                class="navButton btn btn-outline-primary">Get Support</button></td>
            <td><button type="button" id="instructorButton"
                onclick="javascript:alert('Requested Empy By Instructor')"
                class="navButton btn btn-outline-primary">Instructor Portal</button></td>
            </tr>
        </table>
    </div>
</div>
            
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

  
