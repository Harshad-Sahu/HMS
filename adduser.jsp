
<%@page import="DAO.HardwareDAO"%>
<%
    if(session.isNew())
       response.sendRedirect("index.jsp");
%>


<%@page import="model.LoginModel" %>

<%
HardwareDAO pd=new HardwareDAO();
LoginModel LM=new LoginModel();
%>
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
          .kappu
        {
            color:red;
            font-size: 12px;
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
                LM= pd.getYourEmail(user1);
                
               
                
                
%>
          
          <a class="dropdown-item active"  href="#"><%= LM.getEmail() %></a> 
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
          <li class="breadcrumb-item active">Add New User</li>
        </ol>

    <div class="card mb-3">
          <div class="card-body">
               <form action="registeruser.jsp" method="post" class=""  onsubmit="return checkValidation()" >
                         
                         <div class="form-group">
                         	 <label for="username">Name</label>
                         	 <input type="text" name="username" id="user_name" autocomplete="off" class="form-control">
                         </div>
                         <div class="form-group">
                               <label for="gender" >Gender</label>
                               <select name="gender" id="gender" class="form-control">
                                      <option value="">-Please-Select-</option>
                                      <option value="male">Male</option>
                                      <option value="female">Female</option>
                               </select>
                         </div>
                          <div class="form-group">
                         	 <label for="computer_code">Computer Code</label><span class="kappu">  &nbsp;&nbsp;&nbsp; *&nbsp COMPUTER CODE CAN'T BE MODIFIED ENTER CAREFULLY</span>
                         	 <input type="text" name="computer_code" id="com_code" autocomplete="off" class="form-control">
                         </div>
                        <div class="form-group">
                               <label for="account_type" >Account Type</label>
                               <select name="account_type" id="accounttype" class="form-control">
                                      <option value="">-Please-Select-</option>
                                      <option value="admin">Admin</option>
                                      <option value="faculty">Faculty</option>
                               </select>
                         </div>      

                          <div class="form-group">
                         	 <label for="email">Email</label>
                                 <input type="email" name="email"  id="mail" autocomplete="off"  class="form-control">
                         </div>
                         <div class="form-group">
                         	  <label for="dob">Date Of Birth</label>
                         	  <input type="date" name="dob" id="dod" autocomplete="off" class="form-control">
                         </div>
                         
                         <div class="form-group">
                         	 <label for="password">Password</label>
                         	 <input type="password" name="password"  id="pass" autocomplete="off" class="form-control">
                         </div>
                         <input type="submit" value="Add User" class="btn-lg bg-primary" name="">           
                </form>
          </div>
    </div>
 </div>

          
            <script>
  
  function checkValidation() {
	var usename= document.getElementById('user_name').value;
	var gen1= document.getElementById('gender').value;
	var code= document.getElementById('com_code').value;
	var acctype =document.getElementById('accounttype').value;
	var mail1 = document.getElementById('mail').value;
                   var dob1 = document.getElementById('dod').value;
                    var pass1 = document.getElementById('pass').value;
	
    	if(usename=="")
		{
                                   alert("Enter User Name");
                                    return false;
		}
    	else if(gen1=="")
    	{
                            alert("Select Gender of User");
                            return false;
                  }	
    	else if(code=="")
		{
		alert("Enter computer code of user");
                                     return false;
		}
    	else if(acctype=="")
		{
		alert("Select Account Type Of User");
                                     return false;
		}
    	else if(mail1=="")
		{
		alert("Enter e-mail of user");
                                     return false;
		}
                else if(pass1=="")
		{
		alert("Enter  Password");
                                   return false;
		}
                
    	else
        {
    		 return true;
        }
	
}

</script>

          
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