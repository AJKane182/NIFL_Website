<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="Football.Admin.Booking" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >

    <title>Booking</title>
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
          <li class="active"><a href="AdminHome.aspx">Dasboard</a></li>
          <li><a href="../Login.aspx" runat="server" onserverclick="Logout_Click"><span class="glyphicon glyphicon-log-in"></span>Logout</a></li>
      </ul>

    </div>
  </div>
</nav>

</head>
<body>

    <form id="form1" runat="server">

<div class="container">
  <div class="jumbotron">
    <h1>Booking</h1>
    <p></p> 
 
<div class="container tableForm">
    <h2>Booking Form:</h2>
    <table class="bookingForm" style="    max-width:400px; margin-left:auto; margin-right:auto; display:block;">
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
            <asp:TextBox ID="txtName" runat="server" Width = "200"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            Select Club:
        </td>
        <td>
           <asp:DropDownList ID="ClubDD" runat="server" Width = "200">
               <asp:ListItem Value="Annagh United">Annagh United</asp:ListItem>
               <asp:ListItem Value="Armagh City">Armagh City</asp:ListItem>
               <asp:ListItem Value="Bandbridge Town">Bandbridge Town</asp:ListItem>
               <asp:ListItem Value="Donegal Celtic FC">Donegal Celtic FC</asp:ListItem>
               <asp:ListItem Value="Dundela">Dundela</asp:ListItem>
               <asp:ListItem Value="Lisburn Distillery">Lisburn Distillery</asp:ListItem>
               <asp:ListItem Value="Moyola Park">Moyola Park</asp:ListItem>
               <asp:ListItem Value="Newington YC">Newington YC</asp:ListItem>
               <asp:ListItem Value="Portstewart">Portstewart</asp:ListItem>
               <asp:ListItem Value="Queen's University">Queen's University</asp:ListItem>
               <asp:ListItem Value="S&L Swifts">S&L Swifts</asp:ListItem>
               <asp:ListItem Value="Tobermore United">Tobermore United</asp:ListItem>
               <asp:ListItem>-----</asp:ListItem>
               <asp:ListItem Value="Guest">Guest</asp:ListItem>
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
            Facility Request:
        </td>
        <td>
           <asp:DropDownList ID="facilityDD" runat="server" Width = "200">
               <asp:ListItem Value="Full Pitch">Full pitch</asp:ListItem>
               <asp:ListItem Value="Half Pitch">Half pitch</asp:ListItem>
               <asp:ListItem Value="Indoor">Indoor hall</asp:ListItem>
               <asp:ListItem Value="Gym">Gym</asp:ListItem>
               <asp:ListItem Value="Other">Other Please Specify</asp:ListItem>
           </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr
    <tr>
        <td>
            Other Facility Request:
        </td>
        <td>
            <asp:TextBox ID="txtOtherRequest" runat="server" Width = "200"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
           Select Date:
        
        </td>
        <td>   
            <asp:Calendar ID="BookingDate" runat="server"  CssClass="bookingCal" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                <NextPrevStyle VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#808080" />
                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" />
                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                <WeekendDayStyle BackColor="LightSkyBlue"/>
            </asp:Calendar>       
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            Select Time:
        </td>
        <td>
           <asp:DropDownList ID="timeDD" runat="server">
               <asp:ListItem Value="9:00">9:00</asp:ListItem>
               <asp:ListItem Value="10:00">10:00</asp:ListItem>
               <asp:ListItem Value="11:00">11:00</asp:ListItem>
               <asp:ListItem Value="12:00">12:00</asp:ListItem>
               <asp:ListItem Value="13:00">13:00</asp:ListItem>
               <asp:ListItem Value="14:00">14:00</asp:ListItem>
               <asp:ListItem Value="15:00">15:00</asp:ListItem>
               <asp:ListItem Value="16:00">16:00</asp:ListItem>
               <asp:ListItem Value="17:00">17:00</asp:ListItem>
               <asp:ListItem Value="18:00">18:00</asp:ListItem>
               <asp:ListItem Value="19:00">19:00</asp:ListItem>
               <asp:ListItem Value="20:00">20:00</asp:ListItem>
               <asp:ListItem Value="21:00">21:00</asp:ListItem>
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
           Other Notes:
        
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
            Contact Number:
        </td>
        <td>
            <asp:TextBox ID="txtContactNo" runat="server" TextMode="Number" Width = "200"></asp:TextBox>
        </td>
    </tr>   
    <tr>
        <td>
            &nbsp
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
					<p><a href="mailto:info@nifl.pil.co.uk">info@nifl.pil.co.uk</a></p>
				</div>

			</div>

			<div class="footer-right">

				<p class="footer-company-about">
					&nbsp;Bringing local football back to the community.
				</p>

				<div class="footer-icons">

					 <a href="www.facebook.com"><i class="fa fa-facebook"><img src="../Images/Icons/fb.png"/></i></a>
					<a href="www.twitter.com"><i class="fa fa-twitter"><img src="../Images/Icons/tw.png" /></i></a>
				</div>

			</div>

		</footer>

    </form>

</body>
</html>

