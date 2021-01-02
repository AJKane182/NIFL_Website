<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="Football.Admin.AdminHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title>Dashboard</title>

    <link href="../Style/footer.css" rel="stylesheet" />
    <link href="../Style/css/bootstrap.css" rel="stylesheet" />
    <link href="../Style/Main.css" rel="stylesheet" />
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
     <nav class="navbar navbar-default navbar-fixed-top">
  
     <div class="container-fluid">
        
         <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span> 
            </button>
         <p class="navbar-text">NIFL Premier<br /> Intermediate</p>
        </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
          <li><a href="Home.aspx">Home</a></li>
          <li><a href="Teams.aspx">Teams</a></li>
          <li><a href="Contact_Us.aspx">Contact Us</a></li>  
       </ul>
        <ul class="nav navbar-nav" style="padding-left:30px">
          <li class="active"><a href="AdminHome.aspx">Dashboard</a></li>
          <li><a href="../Login.aspx" runat="server" onserverclick="Logout_Click"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
            
      </ul>
        

    </div>
  </div>
</nav>

   

</head>
<body>

    
<div class="container">
  <div class="jumbotron">
    <h1>Dashboard</h1>
      <p>&nbsp;</p> 
    <p></p> 
 
 <form id="form1" runat="server">

        <div class="row text-center">

            <div class="col-md-3 col-sm-4 col-xs-6 hero-feature" runat="server" id="guest1">
                <div class="thumbnail">
                    <span class="glyphicon glyphicon-calendar dashicon" aria-hidden="true"></span>
                    <div class="caption">
                        Make Booking
                    </div>
                         <p>
                            <asp:Button ID="Booking" runat="server" Text="Select"  class="btn btn-primary" OnClick="Booking_Click" />
                        </p>
                </div>
            </div>


            
            <div class="col-md-3 col-sm-4 col-xs-6 hero-feature" runat="server" id="teamrep1">
                <div class="thumbnail">
                    <span class="glyphicon glyphicon-plus dashicon" aria-hidden="true"></span>
                    <div class="caption">
                        Fixture Control
                    </div>
                         <p>
                            <asp:Button ID="Fixtures" runat="server" Text="Select"  class="btn btn-primary" OnClick="Fixtures_Click"/>
                        </p>
                </div>
            </div>

            <div class="col-md-3 col-sm-4 col-xs-6 hero-feature" runat="server" id="teamrep2">
                <div class="thumbnail">
                    <span class="glyphicon glyphicon-plus dashicon" aria-hidden="true"></span>
                    <div class="caption">
                        Add Results
                    </div>
                         <p>
                            <asp:Button ID="AddResult" runat="server" Text="Select"  class="btn btn-primary" OnClick="AddResults_Click"/>
                        </p>
                </div>
            </div>

 
            <div class="row col-lg-12">

                <p runat="server" id="admin2" style="float:left">Admin Controls</p>

            </div>
            <div class="row">
                    

           
           <div class="col-md-3 col col-sm-4 col-xs-6 hero-feature" runat="server" id="admin1">
                <div class="thumbnail">
                    <span class="glyphicon glyphicon-edit dashicon" aria-hidden="true"></span>
                    <div class="caption">
                        User Controls
                    </div>
                    <p>
                        <asp:Button ID="User" runat="server" Text="Select"  class="btn btn-primary" OnClick="User_Click"/>
                    </p>                    
                </div>
           </div>
                

           </div>

        </div>
     </div>
 
</div>
</form>               

    

	<footer class="footer-distributed">

			<div class="footer-left">

				<p style="font-size:24px;color:darkgrey">NIFL Premier Inetrmediate League</p>

				<p class="footer-links">
					<a href="Home.aspx">Home</a>
					·
					<a href="Teams.aspx">Team's</a>
					·
					<a href="Contact_Us.aspx">Contact Us</a>
				</p>

				<p class="footer-company-name">AQ Web Developments &copy; 2018</p>
			</div>

			<div class="footer-center">

				<div>
					<i class="fa fa-map-marker"></i>
					<p><span>National Football Stadium</span> Donegall Ave, Belfast BT12 5LW</p>
				</div>

				<div>
					<i class="fa fa-phone"></i>
					<p>028 9066 9458</p>
				</div>

				<div>
					<i class="fa fa-envelope"></i>
					<p><a href="mailto:info.nifl.pil@gmail.com">info.nifl.pil@gmail.com</a></p>
				</div>

			</div>

			<div class="footer-right">

				<p class="footer-company-about">
					&nbsp;Bringing local football back to the community.
				</p>

				<div class="footer-icons">

					 <a href="www.facebook.com"><img src="../Images/Icons/fb.png" /></i></a>
					<a href="www.twitter.com"><i class="fa fa-twitter"><img src="../Images/Icons/tw.png" /></i></a>
				</div>

			</div>

		</footer>

</body>
</html>

