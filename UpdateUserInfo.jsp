<%
    if(session.isNew())
       response.sendRedirect("index.jsp");
%>

<%@page import="model.LoginModel" %>
<%@page import="DAO.HardwareDAO" %>
<%!
LoginModel LM=new LoginModel();
LoginModel LM1=new LoginModel();
HardwareDAO pd=new HardwareDAO();
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update User</title>
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
             <a href="manipulateuser.jsp">manipulate User</a>
          </li>
          <li class="breadcrumb-item active">Update User</li>
        </ol>

   <div class="card mb-3">
          <div class="card-body">
               
                 <%
    
        
         String computer_code=request.getParameter("computer_code");
       
         LM1= pd.searchByUser( Integer.parseInt(computer_code));
            if(LM1==null)
            {
                out.println("<font color=red size=7>Record Not Found 404......</font>");
            }
            else
            {
    %>
     
           <form action="updateUsebeanSir.jsp" method="post" class="">
                         <div class="form-group">
                         	 <label for="username">Name</label>
                                 <input type="text" id="username" value="<%=LM1.getUsername()%>" style="text-transform:uppercase" name="username" autocomplete="off" class="form-control"  >
                         </div>
                         <div class="form-group">
                               <label for="gender" >Gender</label>
                               
                               <%
                                     String gen1=  LM1.getGender();
                                     if(gen1.equals("male"))
                                     {
                                         %>
                                         <select name="gender" value="<%=LM1.getGender()%>" id="gender" class="form-control">
                                                 <option value="">-Please-Select-</option>
                                                 <option value="male" selected>Male</option>
                                                 <option value="female">Female</option>
                                             </select>   
                               <%
                                     }
                                     else
                                     {
                                 %>
                                         <select name="gender" value="<%=LM1.getGender()%>" id="gender" class="form-control">
                                                 <option value="">-Please-Select-</option>
                                                 <option value="male">Male</option>
                                                 <option value="female" selected>Female</option>
                                             </select>   
                                         
                                  
                                     <%
                                     }
                               %>
                                    	    
                         </div>
                          <div class="form-group">
                              <!---<label for="computer_code">Computer Code</label><span class="kappu">  &nbsp;&nbsp;&nbsp; *&nbsp COMPUTER CODE CAN'T BE MODIFIED</span>---->
                         	 <input type="hidden" value="<%=LM1.getComputer_code()%>" style="background-color:white" name="computer_code" autocomplete="off"  class="form-control">
                         </div>
                           <div class="form-group">
                               <label for="account_type" >Account Type</label>
                               
                                <%
                                     String acc1=  LM1.getAccount_type();
                                     if(acc1.equals("admin"))
                                     {
                                         %>
                                          <select name="account_type" value="<%=LM1.getAccount_type()%> " id="account_type" class="form-control">
                                      <option value="">-Please-Select-</option>
                                      <option value="admin" selected>Admin</option>
                                      <option value="faculty">Faculty</option>
                               </select>
                               <%
                                     }
                                     else
                                     {
                                 %>
                                          <select name="account_type" value="<%=LM1.getAccount_type()%> " id="account_type" class="form-control">
                                      <option value="">-Please-Select-</option>
                                      <option value="admin">Admin</option>
                                      <option value="faculty" selected>Faculty</option>
                               </select>
                                         
                                  
                                     <%
                                     }
                               %>
                               
                               
                              
                         </div>      

                          <div class="form-group">
                         	 <label for="email">Email</label>
                         	 <input type="email" value="<%=LM1.getEmail()%>" name="email" autocomplete="off"  class="form-control">
                         </div>
                         <div class="form-group">
                         	  <label for="dob">Date Of Birth</label>
                         	  <input type="date" name="dob" value="<%=LM1.getDob()%>" autocomplete="off" class="form-control">
                         </div>

                         <input type="submit" value="Update User" class="btn-lg bg-primary" name="">           
                   
                    
           </form>
           <%
             }
        
         
           
           %>
           
           
          </div>
    </div>
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