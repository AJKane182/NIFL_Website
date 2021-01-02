<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Football.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Log In</title>

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
          <li><a href="Contact_Us.aspx">Contact Us</a></li>  
      </ul>

      <ul class="nav navbar-nav navbar-center">
          <li class="Dashboard"><a href="Admin/AdminHome.aspx">Dashboard</a></li>
          <li class="active"><a href="Login.aspx"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
        
    </div>
  </div>
</nav>
</head>
<body>


<div class="container">
  <div class="jumbotron">
    <h1>Please Sign In</h1>
      <p>&nbsp;</p> 

    <form id="form2" runat="server">
        <asp:Panel id="panLogin" runat="server">
            <div class="row" style="    max-width:400px; margin-left:auto; margin-right:auto; display:block;">
            <div class="col-xs-12"> 
            <div class="input-group" ">
                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                <asp:TextBox ID="UsernameEnter" runat="server" placeholder="Username" CssClass="form-control" ></asp:TextBox> 
            </div>
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"  ></i></span>
                <asp:TextBox ID="PasswordEnter" runat="server" TextMode="Password" placeholder="Password" CssClass="form-control"></asp:TextBox>
            <br />
            </div>
                <asp:RequiredFieldValidator ID="UsernameValidate" runat="server" ControlToValidate="UsernameEnter" ErrorMessage="Please enter username" CssClass="alert-danger"/> <br />
                <asp:RequiredFieldValidator ID="PasswordValidate" runat="server" ControlToValidate="PasswordEnter" ErrorMessage="Please enter password" CssClass="alert-danger" /><br />
                <asp:Button ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click"   CssClass="btn-primary" />
            </div>
            </div>
        </asp:Panel>

            <br />
            <h2> Sign up ? <asp:CheckBox ID="chkSignUp" runat="server" AutoPostBack="true" OnCheckedChanged="chkSignUp_CheckedChanged"/></h2>
            <br />

        <asp:Panel ID="panSignUp" runat="server">
            <div class="container tableForm" runat="server">
            <h2>Sign up Form:</h2>
    <table class="bookingForm">
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
            Password Request:
        </td>
        <td>
            <asp:TextBox ID="txtPasswordReq" runat="server" Width = "200"></asp:TextBox>
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
            Select Role:
        </td>
        <td>
           <asp:DropDownList ID="roleDD" runat="server" Width = "200">
               <asp:ListItem Value="Player">Player</asp:ListItem>
               <asp:ListItem Value="Committee">Committee</asp:ListItem>
               <asp:ListItem Value="Coaching Staff">Coaching Staff</asp:ListItem>
               <asp:ListItem Value="Other">Other Please Specify</asp:ListItem>
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
            Other Role Title:
        </td>
        <td>
            <asp:TextBox ID="txtOtherRole" runat="server" Width = "200"></asp:TextBox>
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
        </asp:Panel>
  
</form>
     
         
  

 
 
  </div>
  <p></p> 
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


</body>
</html>

