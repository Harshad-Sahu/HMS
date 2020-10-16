
<%
    if(session.isNew())
       response.sendRedirect("index.jsp");
%>
<%@page import="model.LoginModel"%>
<%@page import="model.Hardware"%>
<%@page import="model.Hardware"%>
<%@page import="DAO.HardwareDAO"%>

<%@page import="java.util.*" %>
<%!
  Hardware H=new Hardware();
  LoginModel LM=new LoginModel();
  HardwareDAO pd=new HardwareDAO();
  List<Hardware> mylist;
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View All Hardware Available in Collage</title>
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
           <li class="breadcrumb-item">
            <a href="hardware-dashboard.jsp">Hardware Dashboard</a>
          </li>
           <li class="breadcrumb-item">
            <a href="view-all-hardware-collage.jsp">View Hardware</a>
          </li>
          <li class="breadcrumb-item active">Update Hardware</li>
        </ol>
       
       
        <div class="card mb-3">
          <div class="card-body">
               
                 <%
    
        
         String hardname2=null;
         hardname2= request.getParameter("hardname1");
         String brand1=null;
         brand1=request.getParameter("brand11");
         String manu2=null;
         manu2=request.getParameter("manu11");     
         
       if(hardname2!=null)
         {
            
            H= pd.searchByHardname(hardname2,brand1,manu2) ;
            if(H==null)
            {
                out.println("<font color=red size=7>Record Not Found 404......</font>");
            }
            else
            {
    %>
     
           <form action="UpdateHardwareUseBean.jsp" method="post" class="">
                         <div class="form-group">
                         	 <label for="hdname">Hardware Name</label>
                                 <input type="text"  value="<%=H.getHdname() %> " style="text-transform:uppercase" name="hdname" autocomplete="off" class="form-control" >
                         </div>
               
               
                          <div class="form-group">
                         	 <label for="quantity">Quantity</label>
                                 <input type="number"  value="<%=H.getQuantity() %>" name="quantity" autocomplete="off" class="form-control"  >
                         </div>
               
               
                        <div class="form-group">
                         	 <label for="brandname">Brand Name</label>
                                 <input type="text" value="<%=H.getBrandname() %> " style="text-transform:uppercase" name="brandname" autocomplete="off" class="form-control"  >
                         </div>
               
                          <div class="form-group">
                         	 <label for="manufacture">Manufacture Year</label>
                                 <input type="text" value="<%=H.getManufacture() %> " style="text-transform:uppercase" name="manufacture" autocomplete="off" class="form-control"  >
                         </div>
               
                           <!----<div class="form-group">
                         	 <label for="date">Date</label>
                                 <input type="Date" id="txtname" value="" style="text-transform:uppercase" name="hdname" autocomplete="off" class="form-control"  >
                         </div>
                                         --->
                                  
                         <input type="submit" value="Update Hardware Info" class="btn-lg bg-primary" name="">           
                   
                    
           </form>
           <%
             }
        
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