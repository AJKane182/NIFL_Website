<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Teams.aspx.cs" Inherits="Football.Teams" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >

    <title>Team's</title>
    
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

          <li class="active"><a href="Teams.aspx">Teams</a></li>
          
          <li><a href="Contact_Us.aspx">Contact Us</a></li>  
      </ul>

      <ul class="nav navbar-nav navbar-center">
          <li class="Dashboard"><a href="Admin/AdminHome.aspx">Dashboard</a></li>
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

      <h1>Team's </h1> 
      <p></p>

      <p class="btnTable"><asp:Button ID="btnShowTable" runat="server" OnClick="showTable_Click" CssClass="btn btn-primary" Text="Show Table"/><asp:Button ID="btnHideTable" runat="server" OnClick="hideTable_Click" CssClass="btn btn-primary" Text="Hide Table"/></p>

<asp:Panel id="panTable" runat="server">     
         <asp:SqlDataSource ID="GrabLeagueTable" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT         ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS Position, Teams.TeamName, LeagueTable.Played, LeagueTable.Win, LeagueTable.Draw, LeagueTable.Scored, LeagueTable.Loss, LeagueTable.Conceded, 
                    LeagueTable.Points
                    FROM LeagueTable 
                    INNER JOIN Teams 
                    ON LeagueTable.TeamID = Teams.TeamID
                    ORDER BY LeagueTable.Points DESC">

        </asp:SqlDataSource>

       <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="GrabLeagueTable" Width="99%" CssClass="mLeagueTbl" HeaderStyle-CssClass="header" RowStyle-CssClass="rows">
          <Columns>
              <asp:BoundField DataField="Position" HeaderText="Position" ReadOnly="True" SortExpression="Position" />
              <asp:BoundField DataField="TeamName" HeaderText="Team Name" SortExpression="TeamName" />
              <asp:BoundField DataField="Played" HeaderText="Played" SortExpression="Played" />
              <asp:BoundField DataField="Win" HeaderText="Win" SortExpression="Win" />
              <asp:BoundField DataField="Draw" HeaderText="Draw" SortExpression="Draw" />
              <asp:BoundField DataField="Loss" HeaderText="Loss" SortExpression="Loss" />
              <asp:BoundField DataField="Scored" HeaderText="Scored" SortExpression="Scored" />
              <asp:BoundField DataField="Conceded" HeaderText="Conceded" SortExpression="Conceded" />
              <asp:BoundField DataField="Points" HeaderText="Points" SortExpression="Points" />
          </Columns>
      </asp:GridView>
</asp:Panel>
    </div>

  <div class="jumbotron">
        
      <a href="Team_Profile.aspx?ID=1&Team=Annagh+United">
         <div class="col-md-3 col-sm-4 col-xs-6">
            <img src="Images/Badges/1.jpg" class="img-rounded crest"/>
            <h3>Annagh United</h3>
         </div>
      </a>

      <a href="Team_Profile.aspx?ID=2&Team=Armagh+City">        
        <div class="col-md-3 col-sm-4 col-xs-6">
            <img src="Images/Badges/2.jpg" class="img-rounded crest"/>
            <h3>Armagh City</h3>
        </div>
      </a>
      
      <a href="Team_Profile.aspx?ID=3&Team=Bandbridge+Town">
        <div class="col-md-3 col-sm-4 col-xs-6">
            <img src="Images/Badges/3.jpg" class="img-rounded crest"/>
            <h3>Bandbridge Town</h3>
        </div>
      </a>
        
      <a href="Team_Profile.aspx?ID=4&Team=Donegal+Celtic+FC">
        <div class="col-md-3 col-sm-4 col-xs-6">
            <img src="Images/Badges/4.jpg" class="img-rounded crest"/>
            <h3>Donegal Celtic FC</h3>
        </div>
      </a>
          
      <a href="Team_Profile.aspx?ID=5&Team=Dundela">         
         <div class="col-md-3 col-sm-4 col-xs-6">
            <img src="Images/Badges/5.jpg" class="img-rounded crest"/>
            <h3>Dundela</h3>
        </div>
      </a>    

      <a href="Team_Profile.aspx?ID=6&Team=Lisburn+Distillery">
        <div class="col-md-3 col-sm-4 col-xs-6">
             <img src="Images/Badges/6.jpg" class="img-rounded crest"/>
            <h3>Lisburn Distillery</h3>
        </div>
      </a>
        
      <a href="Team_Profile.aspx?ID=7&Team=Moyola+Park">
        <div class="col-md-3 col-sm-4 col-xs-6">
            <img src="Images/Badges/7.jpg"  class="img-rounded crest"/>
            <h3>Moyola Park</h3>
        </div>
      </a>

      <a href="Team_Profile.aspx?ID=8&Team=Newington+YC">        
        <div class="col-md-3 col-sm-4 col-xs-6">
            <img src="Images/Badges/8.jpg" class="img-rounded crest"/>
            <h3>Newington YC</h3>
        </div>
      </a>
 
      <a href="Team_Profile.aspx?ID=9&Team=Portstewart">
        <div class="col-md-3 col-sm-4 col-xs-6">
            <img src="Images/Badges/9.jpg" class="img-rounded crest"/>
            <h3>Portstewart</h3>
        </div>
      </a>

      <a href="Team_Profile.aspx?ID=10&Team=Queen%27s+University">  
        <div class="col-md-3 col-sm-4 col-xs-6">
            <img src="Images/Badges/10.jpg" class="img-rounded crest"/>
            <h3>Queen's University</h3>
        </div>
      </a>
        
      <a href="Team_Profile.aspx?ID=11&Team=S%26L+Swifts">
        <div class="col-md-3 col-sm-4 col-xs-6">
            <img src="Images/Badges/11.jpg" class="img-rounded crest"/>
            <h3>S&L Swifts</h3>
        </div>
      </a>

      <a href="Team_Profile.aspx?ID=12&Team=Tobermore+United">        
        <div class="col-md-3 col-sm-4 col-xs-6">
             <img src="Images/Badges/12.jpg" class="img-rounded crest"/>
            <h3>Tobermore United</h3>
        </div>
      </a>
       
        <p>&nbsp</p>
 
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
					<a href="www.twitter.com"><i class="fa fa-twitter"><img src="Images/Icons/tw.png"/></i></a>
				</div>

			</div>

		</footer>

    </form>

</body>
</html>

