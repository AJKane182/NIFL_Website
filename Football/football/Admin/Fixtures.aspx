<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fixtures.aspx.cs" Inherits="Football.Admin.Fixtures" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >

    <title>User Control</title>
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



<form id="form2" runat="server">

<div class="container">
  <div class="jumbotron">
      <br />
      <br />

<asp:Panel runat="server" ID="panEdit">

    
    <asp:SqlDataSource ID="GrabTeams" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [TeamID], [TeamName] FROM [Teams]">

    </asp:SqlDataSource>
    <h2>Search Fixture's by Team</h2>
    <asp:DropDownList ID="ListTeams" runat ="server" AutoPostBack="True" DataSourceID="GrabTeams" CssClass="ListTeams" DataTextField="TeamName" DataValueField="TeamID" OnSelectedIndexChanged="ListTeams_SelectedIndexChanged" AppendDataBoundItems="true" Width="150px">
     <asp:ListItem Value="0" Text="Select Team" Enabled="False"></asp:ListItem>
     </asp:DropDownList>
    

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


</asp:Panel>

<h2> Add Fixture ? <asp:CheckBox ID="chkSignUp" runat="server" AutoPostBack="true" OnCheckedChanged="chkSignUp_CheckedChanged"/></h2>

<asp:Panel ID="panAdd" runat="server">

      <div class="container  tableForm bookingForm" style="max-width:400px; margin-left:auto; margin-right:auto; display:block;">
      <h1>Add Fixtures</h1>
      <p>&nbsp;</p> 
    <p></p> 

    <asp:SqlDataSource ID="SelectTeams" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [TeamName], [TeamID] FROM [Teams]"></asp:SqlDataSource>
    <h4>Gameweek</h4>
    <asp:DropDownList ID="SelectGameWeek" runat="server"> 
        <asp:ListItem Enabled="False">Select Gameweek: </asp:ListItem>
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
        <asp:ListItem>5</asp:ListItem>
        <asp:ListItem>6</asp:ListItem>
        <asp:ListItem>7</asp:ListItem>
        <asp:ListItem>8</asp:ListItem>
        <asp:ListItem>9</asp:ListItem>
        <asp:ListItem>10</asp:ListItem>
        <asp:ListItem>11</asp:ListItem>
        <asp:ListItem>12</asp:ListItem>
        <asp:ListItem>13</asp:ListItem>
        <asp:ListItem>14</asp:ListItem>
        <asp:ListItem>15</asp:ListItem>
        <asp:ListItem>16</asp:ListItem>
        <asp:ListItem>17</asp:ListItem>
        <asp:ListItem>18</asp:ListItem>
        <asp:ListItem>19</asp:ListItem>
        <asp:ListItem>20</asp:ListItem>
        <asp:ListItem>21</asp:ListItem>
        <asp:ListItem>22</asp:ListItem>
        <asp:ListItem>23</asp:ListItem>
        <asp:ListItem>24</asp:ListItem>
        <asp:ListItem>25</asp:ListItem>
        <asp:ListItem>26</asp:ListItem>
        <asp:ListItem>27</asp:ListItem>
        <asp:ListItem>28</asp:ListItem>
        <asp:ListItem>29</asp:ListItem>
        <asp:ListItem>30</asp:ListItem>
        <asp:ListItem>31</asp:ListItem>
        <asp:ListItem>32</asp:ListItem>
        <asp:ListItem>33</asp:ListItem>
        <asp:ListItem>34</asp:ListItem>
        <asp:ListItem>35</asp:ListItem>
        <asp:ListItem>36</asp:ListItem>
        <asp:ListItem>37</asp:ListItem>
        <asp:ListItem>38</asp:ListItem>
        <asp:ListItem>39</asp:ListItem>
        <asp:ListItem>40</asp:ListItem>
        <asp:ListItem>41</asp:ListItem>
        <asp:ListItem>42</asp:ListItem>
        <asp:ListItem>43</asp:ListItem>
        <asp:ListItem>44</asp:ListItem>
        <asp:ListItem>45</asp:ListItem>

    </asp:DropDownList>

    <h4>Home Team:</h4>
    <asp:DropDownList ID="SelectHomeTeam" runat="server" AutoPostBack="True" DataSourceID="SelectTeams" DataTextField="TeamName" DataValueField="TeamID"></asp:DropDownList><br />
    <h4>Away Team:</h4>
    <asp:DropDownList ID="SelectAwayTeam" runat="server" DataSourceID="SelectTeams" DataTextField="TeamName" DataValueField="TeamID"></asp:DropDownList> <br />
   <h4>Date:</h4>    
    <asp:TextBox ID="FixtureDate" runat="server" type="date" placeholder="MM/DD/YYYY" Width="200px" ></asp:TextBox> <br />
   <h4>Time:</h4>
    <asp:DropDownList ID="SelectHour" runat="server">
        <asp:ListItem Enabled="False">Select Time</asp:ListItem>
        <asp:ListItem>9</asp:ListItem>
        <asp:ListItem>10</asp:ListItem>
        <asp:ListItem>11</asp:ListItem>
        <asp:ListItem>12</asp:ListItem>
        <asp:ListItem>13</asp:ListItem>
        <asp:ListItem>14</asp:ListItem>
        <asp:ListItem>15</asp:ListItem>
        <asp:ListItem>16</asp:ListItem>
        <asp:ListItem>17</asp:ListItem>
        <asp:ListItem>18</asp:ListItem>
        <asp:ListItem>19</asp:ListItem>
        <asp:ListItem>20</asp:ListItem>
        <asp:ListItem>21</asp:ListItem>
        <asp:ListItem>22</asp:ListItem>
</asp:DropDownList>

	<asp:DropDownList ID="SelectMinutes" runat="server">
        <asp:ListItem>00</asp:ListItem>
        <asp:ListItem>05</asp:ListItem>
        <asp:ListItem>10</asp:ListItem>
        <asp:ListItem>15</asp:ListItem>
        <asp:ListItem>20</asp:ListItem>
        <asp:ListItem>25</asp:ListItem>
        <asp:ListItem>30</asp:ListItem>
        <asp:ListItem>35</asp:ListItem>
        <asp:ListItem>40</asp:ListItem>
        <asp:ListItem>45</asp:ListItem>
        <asp:ListItem>50</asp:ListItem>
        <asp:ListItem>55</asp:ListItem>
    </asp:DropDownList>

<br /><br />
 

    <asp:Button ID="CreateFixture" runat="server" Text="Create Fixture" OnClick="CreateFixture_Click" CssClass="btn btn-primary"/>

    </div>
    
</asp:Panel>

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

					 <a href="www.facebook.com"><img src="../Images/Icons/fb.png" /></i></a>
					<a href="www.twitter.com"><i class="fa fa-twitter"><img src="../Images/Icons/tw.png" /></i></a>
				</div>

			</div>

		</footer>

    </form>

</body>
</html>


