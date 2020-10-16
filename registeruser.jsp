<%
    if(session.isNew())
       response.sendRedirect("index.jsp");
%>

<%@page import="DAO.HardwareDAO"%>
<%@page import="model.LoginModel" %>

<%
HardwareDAO pd=new HardwareDAO();
//LoginModel LM=new LoginModel();
LoginModel LM1 =new LoginModel();
%>

<jsp:useBean class="model.LoginModel" id="LM">
    <jsp:setProperty name="LM" property="*"></jsp:setProperty>
</jsp:useBean>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New User</title>
		 <link rel="stylesheet" type="text/css" href="bootstrapfile\bootstrap.css">
     <link rel="stylesheet" type="text/css" href="fontstyle\css\font-awesome.min.css">
	 <style type="text/css">
	   body
	   {
	   	min-height: 100%;
	   }
	 	.breadcrumb
	 	{
	 		margin-top: 10px;
	 	}
	 	.position-text
	 	{
	 		padding: 30px;
	 	}
	 .show {
         display: block;
         }
	   .dropbtn 
	   {
         cursor: pointer;
         font-size: 16px;  
         border: none;
         outline: none;
         color: white;
         padding: 8px 12px;
         background-color: inherit;
         font-family: inherit;
         margin: 0;
        }
	 </style>
</head>
<body>
<nav class="navbar navbar-expand navbar-dark bg-dark static-top">
    <a class="navbar-brand mr-1" href="dashboard.jsp">Hardware Management System</a>
      <ul class="navbar-nav ml-auto mr-0 mr-md-20 my-2 my-md-0">
    <li class="nav-item dropdown ">
        <button class="dropbtn" onclick="myFunction()">
      <i class="icon-user"></i>  Setting
      </a>
      <div class="dropdown-menu dropdown-menu-right" id="myDropdown">
          
          
          <%
              String user1=null;
                user1=(String)(session.getAttribute("user"));
                LM1= pd.getYourEmail(user1);
                
                
%>
          
<a class="dropdown-item active"  href="#"> <%= LM1.getEmail() %> </a>
          <a class="dropdown-item" href="AccountInfo.jsp">Account</a>  
        <a class="dropdown-item" href="changePassword.jsp">Change Password</a>
        <a class="dropdown-item" href="Signout.jsp">Logout</a>  
      </div>
    </li>
 </ul>
</nav>

<div class="container-fluid">   
       <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="dashboard.jsp">Dashboard</a>
          </li>
          <li class="breadcrumb-item">
             <a href="new-user.jsp">New User</a>
          </li>
           <li class="breadcrumb-item">
               <a href="adduser.jsp">Add User</a>
          </li>
          <li class="breadcrumb-item active">Register User</li>
        </ol>
      
       <%
               
            for(int i=0; i<5;i++)
                out.println("<br>");
        
           // HardwareDAO pd=new HardwareDAO();
            if(pd.addNewUser(LM))
            {
            %>
       
               <script type="text/javascript">
                      
                       alert("RECORD ADDED SUCCESSFULLY..........");
                      document.location.href='new-user.jsp'
                      
                  </script>
       <%
            
            }
            
        %>
       
       
       
</div>
        
        
        <script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(e) {
  if (!e.target.matches('.dropbtn')) {
  var myDropdown = document.getElementById("myDropdown");
    if (myDropdown.classList.contains('show')) {
      myDropdown.classList.remove('show');
    }
  }
}

</script>
</body>
</html>