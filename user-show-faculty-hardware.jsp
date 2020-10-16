<%@page import="model.LoginModel"%>
<%
    if(session.isNew())
       response.sendRedirect("index.jsp");
%>


<%@page import="model.FacultyIssue"%>
<%@page import="DAO.HardwareDAO"%>

<%@page import="java.util.*" %>
<%!
    FacultyIssue FI=new FacultyIssue();
    List<FacultyIssue> mylist1;
    HardwareDAO pd=new HardwareDAO();
    LoginModel LM=new LoginModel();
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Available Hardware in Collage</title>
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
    <%
            String fname,ccode; 
            fname=request.getParameter("faculty-name");
            ccode=request.getParameter("comp-code");
            %>
    
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
            <a href="FacultyDashboard.jsp">Faculty Dashboard</a>
          </li>
          <li class="breadcrumb-item">
            <a href="user-issued-detail.jsp">Issued Detail</a>
          </li> 
            <li class="breadcrumb-item">
            <a href="user-specific-hardware-faculty.jsp">Issued Detail</a>
          </li> 
          <li class="breadcrumb-item active">Details of Issued hardware to Faculty</li>
        </ol>

       
       <div class="card mb-3">
          <div class="card-body">
              <form action="" method="post" class="">
                        <h1 style="text-transform:capitalize">hardware Detail</h1><br>

                            <table class="table-responsive-lg table-striped" style="width:100%" border="1px" cellpadding="10px">
                                 <thead>
                                        <tr class="bg-info text-white"> 
                                            <th >Hardware Name</th>
                                            <th>Quantity</th>
                                            <th>Brand Name</th>
                                            <th>Manufacture Year</th>
                                        </tr>
                                 </thead>
                                 
                                  <%
             mylist1 = pd.specificFacultyIssue(fname, ccode);
              for(FacultyIssue FI:mylist1)
                 {   
        %>
                                 <tbody>
                                   <tr>
                                     <td style="text-transform: uppercase"><%= FI.getHardwarename() %></td>
                                     <td><%=FI.getQuantity()%></td>
                                     <td style="text-transform: uppercase" ><%=FI.getBrandname()%></td>
                                     <td ><%=FI.getManufacture()%></td>
                                   </tr>
                                 </tbody>
                               <%
                }
        %>
                                 
                            </table>
                </form>
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
