<%
    if(session.isNew())
       response.sendRedirect("index.jsp");
%>


<%@page import="DAO.HardwareDAO"%>
<%@page import="model.IssueHardware"%>

<%@page import="model.LoginModel" %>

<%
HardwareDAO pd=new HardwareDAO();
LoginModel LM=new LoginModel();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Issue Hardware</title>
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
          <li class="breadcrumb-item">
            <a href="issue-dashboard.jsp">Issued Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Issue Hardware Department</li>
        </ol>

   <div class="card mb-3">
          <div class="card-body">
                    <form action="IssueSave.jsp" method="post" class="" ">
                          <div class="form-group">
                              <label for="hdname">Hardware Name</label>
                                <select class="form-control" id="hardware-name" name="hdname" >       
                                     <option value="">-Please-Select-</option>
                                     <option value="monitor">Monitor</option>
                                      <option value="cpu">CPU</option>
                                        <option value="keyboard">Keyboard</option>
                                          <option value="mouse">Mouse</option>
                                            <option value="printer">Printer</option>                    
                                </select>                              
                          </div>

                           <div class="form-group">
                              <label for="department">Department Name</label>

                               <select class="form-control" id="dept-name" name="department">   
                                     <option value="">-Please-Select-</option>    
                                     <option value="computer science">Computer Science Eng.</option>
                                     <option value="information technology">CS and Information Technology Eng.</option>
                                     <option value="mechanical">Mechanical Eng.</option>
                                     <option value="civil">Civil Eng.</option> 
                                     <option value="chemical">Chemical Eng.</option>
                                     <option value="electrical">Electrical Eng.</option>
                                     <option value="Fire Technology">Fire Techology.</option>
                                     <option value="electonics and communication">Electronics and Communication Eng.</option>                   
                               </select>
                                                           
                          </div>
                           <div class="form-group">
                              <label for="qu">Quantity</label>
                                  <input type="number" name="quantity" id="qu" class="form-control">                            
                          </div>

                          <div class="form-group">
                              <label for="comp-name">Brand Name</label>       
                                <input type="text" class="form-control" id="comp-name" name="brandname">                             
                          </div>

                          <div class="form-group">
                              <label for="manufacture">Manufacture Year</label>
                               <input type="text" name="manufacture" id="model-code" class="form-control" onkeypress="return isNumberKey(event)">                  
                          </div>

                          <div class="form-group">
                              <label for="date1">Date</label>
                                  <input type="date" name="date" id="date1" class="form-control">                            
                          </div>                  
                          <input type="submit" value="Issued Hardware" class="btn-lg bg-primary" name="">
                    </form>
          </div>
   </div>

   

	  
</div>
         
<script type="text/javascript">
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


function isNumberKey(evt)
{
    var charCode=(evt.which) ? evt.which:evt.keyCode
    if(charCode>31&& (charCode<48 ||charCode>57))
        return false;
    
    return true;
}
</script>

</body>
</html>