<%
    if(session.isNew())
       response.sendRedirect("index.jsp");
%>

<%@page import="DAO.HardwareDAO" %>
<%@page import="model.LoginModel" %>

<%
HardwareDAO pd=new HardwareDAO();
LoginModel LM=new LoginModel();
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
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
      <i class="icon-user"></i>  Account
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
    </ol>      

   <div class="card mb-3">
          <div class="card-body">
              
               <form action="changePassword.jsp" method="post" class=""   onsubmit="return validation()">
                        <h1>Change Password</h1>
                        
                      <!--   <div class="form-group">
                              <label for="users">Enter UserName</label>
                              <input type="text"    class="form-control"  id="users" name="users">
                            <!--   <select class="form-control" id="faculty-name" name="faculty-name">   
                                     <option value="">-Please-Select-</option>   
                                      
                                                 agar koi faculty ko hardware issue hota h toh uska name runtime pe aayega is dropdown list me  
                                           
                               </select> 
                               
                          </div>   --->      
                          <div class="form-group">
                              <label for="newpass">Enter New Password</label>
                               <input type="password" class="form-control" id="newpass" name="newpass">                                        
                          </div>        
                            
                            <div class="form-group">
                              <label for="newpass2">Confirm Password</label>
                               <input type="password" class="form-control" id="newpass2" name="newpass2">                                        
                          </div>        

                         <input type="submit" value="Change Password" class="btn-lg bg-primary" name="">           
                </form>
          </div>
   </div>  
</div>	 
    
        
    <script type="text/javascript">
	
	
    function validation() 
    {
    	//var username=document.getElementById('users').value;
	    var password =document.getElementById('newpass').value;
                      var password2=document.getElementById('newpass2').value;
    	/*if(users=="")
    	{
    		alert("Please Enter Username");
    		return false;
    	}*/
    	 if(password=="" && password2=="" ) 
    	{
    	   alert("Please Enter New Password");
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
    
    
    <%
     
        String users1=null, newPass=null, newPass2=null;
       users1= (String)(session.getAttribute("user"));
        newPass= request.getParameter("newpass");
        newPass2=request.getParameter("newpass2");
        if(newPass==null &&newPass2==null)
        {
        %>
        
            <script  type="text/javascript">
                   
                        alert("Enter New Password....");
                   </script>
        <%
        }
        else
        {
            if(newPass.equals(newPass2))
            {
                 if(HardwareDAO.changePass(users1, newPass) )
            {
        
       %>
       
        <script  type="text/javascript">
                   
                        alert("Password change Sucessfully :) ....");
                        document.location.href='dashboard.jsp'
                   </script>
       
       <%
        
        }
            }
    else
        {
        %>
        
         <script  type="text/javascript">
                   
                        alert("Error........ Please Check that Password and Confirm Password are same or not :(");
                   </script>
        
        <%
           
        }
        }
    
    %>
    

    
    
</body>
</html>