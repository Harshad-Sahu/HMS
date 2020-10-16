
<%@page import="DAO.HardwareDAO"%>
<!DOCTYPE html>

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
<title>Dashboard</title>
	 <link rel="stylesheet" type="text/css" href="bootstrapfile\bootstrap.css">
	 <link rel="stylesheet" type="text/css" href="fontstyle\css\font-awesome.min.css">
      <link rel="stylesheet" type="text/css" href="fontawesome\css\all.css">
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
	 		padding: 0px;
	 		letter-spacing:1px;
	 	}
	 	.hd-text
	 	{
	 	   font-size: 18px;
                                         font-weight: 350;
                                         letter-spacing: 2px;
                                         font-family: sans-serif;
	 	}
	 	.bt-text
	 	{
	 	   letter-spacing: 2px;
	 	}	
	 	.footer 
	 	{
             position: fixed;
             left: 0;
             bottom: 0;
             width: 100%;
             height: 120px;
             background-color: #e9ecef;
             color: black;
             text-align: center;
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
        .row-expand
        {
          margin-bottom:100px;
        }
        .card-icon
        {
         position:absolute;
         float:left;
         left:55%; 
         font-size:110px;
         opacity:0.5;
         top:7px;
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
          <li class="breadcrumb-item active">Overview</li>
        </ol>
	  
	  <div class="row row-expand">
	  	  <div class="col-xl-4 col-sm-6 mb-3">
                      <div class="card text-white bg-primary o-hidden " style="height:160px">
                   	 <div class="card-body">      
                   	       <div class="card-body-icon">
                   	            <i class="fas fa-fw fa-comments card-icon"></i>
                           </div>            	   
               			 <div class="mr-5 hd-text">Hardware Details of a Collage</div>
              		 </div>
                 	 <a class="card-footer text-white clearfix small z-1" href="hardware-dashboard.jsp">
                     <span class="float-left bt-text">Click Here !</span> </a>
	  	        </div>
	     </div>
	      <div class="col-xl-4 col-sm-6 mb-3">
	  	  	    <div class="card text-white bg-info o-hidden h-100">
                   	 <div class="card-body">    
                   	     <div class="card-body-icon ">
                            <i class="fa fa-cogs card-icon" aria-hidden="true" ></i>
                          </div> 
               			 <div class="mr-8 hd-text">Details of Issued Hardware</div>
              		 </div>
                 	 <a class="card-footer text-white clearfix small z-1" href="issue-dashboard.jsp">
                     <span class="float-left bt-text">Click Here !</span> </a>
	  	        </div>
	     </div>
	      <div class="col-xl-4 col-sm-6 mb-3">
	  	  	    <div class="card text-white bg-danger o-hidden h-100">
                   	 <div class="card-body">  
                   	       <div class="card-body-icon ">
                            <i class="fas fa-fw fa-users card-icon"></i>
                          </div>
                   	      <div class="mr-8 hd-text">Add New User</div>	
              		 </div>
                 	 <a class="card-footer text-white clearfix small z-1" href="new-user.jsp">
                     <span class="float-left bt-text">Click Here !</span> </a>
	  	        </div>
	     </div>
	    
     </div>   
</div>

  <footer class="footer">
          <div class="copyright text-center">
            <p class="position-text"><br>Copyright © Hardware Management System 2019</p>
            <p class="position-text">Devs:&nbsp;&nbsp;&nbsp; Mohit Parmar &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Harshad Sahu &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Prashant Mehra</p>
          </div>
  </footer>

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