<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact_Us.aspx.cs" Inherits="Football.SendEmail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Contact Us</title>
    
    <link href="Style/footer.css" rel="stylesheet" />
    <link href="Style/css/bootstrap.css" rel="stylesheet" />
    <link href="Style/Main.css" rel="stylesheet" />
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
          
          <li class="active"><a href="Contact_Us.aspx">Contact Us</a></li>  
      </ul>

      <ul class="nav navbar-nav navbar-center">
          <li class="Dashboard"><a href="Dashboard.aspx">Dashboard</a></li>
          <li><a href="Login.aspx"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
        
    </div>
  </div>
</nav>

</head>
<body>
    <form id="form1" runat="server">

<div class="container">  
<div class="jumbotron">         
<div class="container">
  
      <h2 style ="text-decoration:underline">Contact Us</h2>
    <p></p> 
   

<div class="col-lg-4 col-md-12 col-sm-12" style="padding-bottom:40px; max-width:400px; margin-left:auto; margin-right:auto; display:block;">  
<div class="container tableForm">
    <p>Enquiry Form:</p>
    <table>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            Full Name:
        </td>
        <td>
            <asp:TextBox ID="txtName" runat="server" Width="200px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            Topic:
        </td>
        <td>
           <asp:DropDownList ID="TopicDD" runat="server" Width="200px">
               <asp:ListItem Value="Complaints">Complaints</asp:ListItem>
               <asp:ListItem Value="Fault with Website">Fault with Website</asp:ListItem>
               <asp:ListItem Value="Feedback">Feedback</asp:ListItem>
               <asp:ListItem Value="Not Specific">Not Specific</asp:ListItem>
               <asp:ListItem Value="Questions">Questions</asp:ListItem>
           </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
           Enquiry:
        
        </td>
        <td>
            <asp:TextBox ID="txtBody" runat="server" TextMode = "MultiLine" Height = "150" Width = "200"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
   <tr>
        <td>
            Email Address:
        </td>
        <td>
            <asp:TextBox ID="txtEmailAddress" runat="server" TextMode ="Email" Width = "200"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    
        
    <tr>
        <td>
        </td>
        <td>
            <asp:Button Text="Send" OnClick="Send_Email" runat="server" />
        </td>
    </tr>
</table>
       
    </div>
    </div>

    
    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
        <p class="googleMapText">Find us at:</p>
        <ul>
            <li>National Football Stadium</li>
            <li>Donegall Ave, Belfast BT12 5LW</li>
            <li></li>
            <li>028 9066 9458</li>
            <li></li>
            <li><a href="mailto:info.nifl.pil@gmail.com">info.nifl.pil@gmail.com</a></li>
        </ul>
            <br />
            <br />
    </div>

    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">

        <div id="googleMap" class="googleMap"></div>

        

        <script>
            function myMap() {
            var mapProp= {
            center: new google.maps.LatLng( 54.58412525016947, -5.955942271694994 ),
            zoom: 15,
            }; 
            var myLatLng = { lat: 54.582436, lng: -5.953914 };
            var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
            var marker = new google.maps.Marker({ position: myLatLng, map: map, title: 'Windsor Park' });
            }
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBg0CrjwB76S4SC1e8r7Vi8ZRh32CAuc54&callback=myMap"></script>
    </div>
  


      </div>
</div>
</div>
    



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

					 <a href="www.facebook.com"><i class="fa fa-facebook"><img src="Images/Icons/fb.png"/></i></a>
					<a href="www.twitter.com"><i class="fa fa-twitter"><img src="Images/Icons/tw.png" /></i></a>
				</div>

			</div>

		</footer>
    </form>
</body>
</html>
