<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Team_Profile.aspx.cs" Inherits="Football.Team_Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Team Profile</title>

    <link href="Style/footer.css" rel="stylesheet" />
    <link href="Style/css/bootstrap.css" rel="stylesheet" />
    <link href="Style/Main.css" rel="stylesheet" />
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="Style/css/Gridview.css" rel="stylesheet" />

     <form id="form1" runat="server">

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


<div class="container">
  <div class="jumbotron">
      <h2>Select Team:</h2>
    <asp:SqlDataSource ID="GrabTeams" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [TeamID], [TeamName] FROM [Teams]">

    </asp:SqlDataSource>

    <asp:DropDownList ID="ListTeams" runat ="server" AutoPostBack="True" DataSourceID="GrabTeams" CssClass="ListTeams" DataTextField="TeamName" DataValueField="TeamID" OnSelectedIndexChanged="ListTeams_SelectedIndexChanged" AppendDataBoundItems="true" Width="150px">
     <asp:ListItem Value="0" Text="Select Team" Enabled="False"></asp:ListItem>
     </asp:DropDownList>
    </div>
      




    <asp:SqlDataSource ID="TeamDetails" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [TeamName] FROM [Teams] WHERE ([TeamID] = @TeamID)">
          <SelectParameters>
              <asp:SessionParameter Name="TeamID" SessionField="TeamID" Type="Int32" />
          </SelectParameters>
    </asp:SqlDataSource>
      
      
  <div class="jumbotron">
     <div class="row">
  
     <div class="col-sm-8">     
     <h2><asp:Label ID="ShowTeamName" runat="server" Text="Label"></asp:Label></h2>
     <h3><asp:Label ID="Players" runat="server" Text="Team Sheet"></asp:Label></h3> <br />
     <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="GrabPlayers" Width="95%" CssClass="mydatagrid" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
                <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                <asp:BoundField DataField="Position" HeaderText="Position" SortExpression="Position" />
            </Columns>
      </asp:GridView>
      </div>
  
         <div class="col-sm-4"><asp:Image ID="TeamLogo" runat="server" CssClass="img-rounded profilepic" /></div>
  
      </div>
      </div>
    


    <asp:SqlDataSource ID="GrabPlayers" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT PlayerProfile.FirstName, PlayerProfile.Surname, PlayerProfile.Age, PlayerProfile.Position FROM PlayerProfile INNER JOIN TeamPlayers ON PlayerProfile.PlayerID = TeamPlayers.PlayerID WHERE (TeamPlayers.TeamID = @TeamID)">
        <SelectParameters>
            <asp:SessionParameter Name="TeamID" SessionField="TeamID" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="GrabTeamFixtures" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Fixtures.HomeTeam, t1.TeamName, Fixtures.AwayTeam, t2.TeamName AS Expr1, Fixtures.Date, Fixtures.HomeScore, Fixtures.AwayScore FROM Fixtures INNER JOIN Teams AS t1 ON Fixtures.HomeTeam = t1.TeamID INNER JOIN Teams AS t2 ON Fixtures.AwayTeam = t2.TeamID WHERE (Fixtures.HomeTeam = @TeamID) OR (Fixtures.AwayTeam = @TeamID)">
        <SelectParameters>
            <asp:SessionParameter Name="TeamID" SessionField="TeamID" />
        </SelectParameters>
    </asp:SqlDataSource>

       <div class="jumbotron"> 
        
    <asp:GridView ID="ShowFixtures" runat="server" AutoGenerateColumns="False" DataSourceID="GrabTeamFixtures" Width="75%" CssClass="mydatagrid" HeaderStyle-CssClass="header" RowStyle-CssClass="rows">
        <Columns>
            
            <asp:BoundField DataField="TeamName" HeaderText="Home" SortExpression="TeamName" />
            <asp:BoundField DataField="HomeScore" HeaderText="Score" SortExpression="HomeScore" />
            <asp:BoundField DataField="AwayScore" HeaderText="Score" SortExpression="AwayScore"  />
            <asp:BoundField DataField="Expr1" HeaderText="Away" SortExpression="Expr1" />
            <asp:BoundField DataField="AwayTeam" HeaderText="AwayTeam" SortExpression="AwayTeam" Visible="false" />
            <asp:BoundField DataField="HomeTeam" HeaderText="HomeTeam" SortExpression="HomeTeam" Visible="false"/>
            
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
        </Columns>
    </asp:GridView>
   
    
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
