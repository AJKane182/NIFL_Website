<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddResults.aspx.cs" Inherits="Football.Admin.AddResults" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >

    <title>Add Result</title>
    
 <link href="../Style/footer.css" rel="stylesheet" />
    <link href="../Style/css/bootstrap.css" rel="stylesheet" />
    <link href="../Style/Main.css" rel="stylesheet" />
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="../Style/css/Gridview.css" rel="stylesheet" />
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
          <li><a href="../Login.aspx" runat="server" onserverclick="Logout_Click"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      </ul>

    </div>
  </div>
</nav>

</head>
<body>


<div class="container">
  <div class="jumbotron">
    <h1>Add Result</h1>
      <p>&nbsp;</p> 
    <p></p> 


    <h2>Select Fixture:</h2>
 
      <form runat="server" id="form1">

    <asp:SqlDataSource ID="GrabFixtures" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Fixtures.HomeTeam, t1.TeamName, Fixtures.AwayTeam, t2.TeamName AS Expr1, Fixtures.Date, Fixtures.HomeScore, Fixtures.AwayScore, Fixtures.FixtureID FROM Fixtures INNER JOIN Teams AS t1 ON Fixtures.HomeTeam = t1.TeamID INNER JOIN Teams AS t2 ON Fixtures.AwayTeam = t2.TeamID">
    </asp:SqlDataSource>

       <div class="jumbotron"> 
        
    <asp:GridView ID="ShowFixtures" runat="server" AutoGenerateColumns="False" DataSourceID="GrabFixtures" Width="75%" CssClass="mydatagrid" AllowSorting="true" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" OnSelectedIndexChanged="ShowFixtures_SelectedIndexChanged">
        <Columns>
            
            <asp:CommandField ShowSelectButton="True" SelectText="Update Result" >
            <ControlStyle ForeColor="Black" />
            </asp:CommandField>
            <asp:BoundField DataField="FixtureID" HeaderText="FixtureID" SortExpression="FixtureID" />
            <asp:BoundField DataField="TeamName" HeaderText="Home" SortExpression="TeamName" />
            <asp:BoundField DataField="HomeScore" HeaderText="Score" SortExpression="HomeScore" />
            <asp:BoundField DataField="AwayScore" HeaderText="Score" SortExpression="AwayScore"  />
            <asp:BoundField DataField="Expr1" HeaderText="Away" SortExpression="Expr1" />
            <asp:BoundField DataField="AwayTeam" HeaderText="AwayTeam" SortExpression="AwayTeam" Visible="false" />
            <asp:BoundField DataField="HomeTeam" HeaderText="HomeTeam" SortExpression="HomeTeam" Visible="false"/>
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
        </Columns>

<HeaderStyle CssClass="header"></HeaderStyle>

<RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
    </form>


    </div>
    </div>

    
    


	
	<footer class="footer-distributed">

			<div class="footer-left">

				<p style="font-size:24px;color:darkgrey">NIFL Premier Inetrmediate League</p>

				<p class="footer-links">
					<a href="../Home.aspx">Home</a>
					·
					<a href="../Teams.aspx">Team's</a>
					·
					<a href="../Contact_Us.aspx">Contact Us</a>
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

    </form>

</body>
</html>

