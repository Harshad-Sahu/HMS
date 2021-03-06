<%@page import="DAO.HardwareDAO"%>
<%@page session="true" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title></title>  
    <link rel="stylesheet" type="text/css" href="bootstrapfile\bootstrap.css">
	<link rel="stylesheet" href="fontstyle\css\font-awesome.min.css">
	<link rel="stylesheet" href="fontawesome\css\all.css">
    <style type="text/css">
 	
 	body
 	{
 		background-color: #f1f1f1;
 		min-height: 100vh;
 	}
     .login-form
     {
     	width: 400px;
     	height: 365px;
     	background-color: white;
                   border-radius: 10px;
     	position: absolute;
    	left:50%;
    	top:50%;
    	transform: translate(-50%,-50%);

     }
     .textfield
     {
     	width: 90%;
     	margin-left: 17px;
        margin-bottom: 10px;
     }
     .label-data
     {
     		margin-left: 19px;
     		font-size: 16px;
     		letter-spacing: 1px;
           
     }
     .login
     {
     	margin-top: 20px;
     	margin-left: 17px;
     	margin-bottom: 10px;
     	text-transform: uppercase;
     	font-size: 20px;
       font-weight: bold;
        letter-spacing: 2px;
       
     }
     .bt-login
     {
     	margin-top: 5px;
     	margin-left: 17px;
     	width: 20%;
        padding: 5px;
        font-size: 18px;
     }
     .accounttype
     {
        width: 90%;
     	margin-left: 17px;
     	color:#495057;
     }
 </style>
</head>
<body>

<div class="container">
	    
	       <form action="index.jsp" method="post" class="login-form" onsubmit="return validation()">
	       	     <h1 class="login">Log in</h1>

                  <div class="form=group">                 	 
                  	  <label for="username" class="label-data"><i class="icon-user"></i> Username</label>
                  	  <input type="text"  id="username" name="username" placeholder="Enter Username" autocomplete="off" class="form-control textfield">   
                  </div> 

                   <div class="form=group">
                  	  <label for="password" class="label-data"><i class="icon-lock"></i> Password</label>
                  	  <input type="password" id="password" name="password" placeholder="Enter Password" class="form-control textfield">
                      
                  </div> 
                     
                     <div class="form-group">
                  	  <label for="account_type" class="label-data"><i class="fa fa-users"></i> Account Type</label>
                  	  <select id="account_type" name="account_type" class="form-control accounttype ">
                  	  		<option value="admin">Admin</option> 
                  	  		<option value="faculty">Faculty</option>
                  	  </select>
                      
                  </div> 

                     
                 <div class="form-group">
                 	  <input type="submit" name="submit-btn" onclick="" value="Login" class="btn-sm btn-primary bt-login">
                 </div>
                 
	       </form>
</div>

    
  
    
    
<script type="text/javascript">
	
	
    function validation() 
    {
    	var username=document.getElementById('username').value;
	    var password =document.getElementById('password').value;

    	if(username=="")
    	{
    		alert("Please Enter Username");
    		return false;
    	}
    	else if(password=="") 
    	{
    	   alert("Please Enter Password");
    		return false;
    	}
    	else
    		{
    		 return true;
    		}
    }

</script>

    
      <%
        String user=null,pass=null,acc=null;
        user=request.getParameter("username");
        pass=request.getParameter("password");
        acc=request.getParameter("account_type");
       
              if(user!=null && pass!= null && acc!=null) 
               
               if(HardwareDAO.checkLogin(user, pass,acc))
               {
                    
                   session.setAttribute("user", user);
                session.setAttribute("pass", pass);
                session.setAttribute("acc",acc);
                
               if(acc.equals("admin") )
                   response.sendRedirect("dashboard.jsp");
                  
               if(acc.equals("faculty") )
                    response.sendRedirect("FacultyDashboard.jsp");
               }
               else
               {
                   %>
                   
                   <script  type="text/javascript">
                   
                        alert("Sorry!..... Invalid UserName or Password or Account type");
                   </script>
                   
                   <%
                }
      
    %>

    
</body>
</html>