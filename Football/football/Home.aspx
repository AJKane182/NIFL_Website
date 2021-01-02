﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Football.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >

    <title>NIFL</title>
    
    <link href="Style/footer.css" rel="stylesheet" />
    <link href="Style/css/bootstrap.css" rel="stylesheet" />
    <link href="Style/Main.css" rel="stylesheet" />
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="Style/js/more.js"></script>

    

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
          <li class="active"><a href="Home.aspx">Home</a></li>
          <li><a href="Teams.aspx">Teams</a></li>
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
    <h2 style ="text-decoration:underline">Bringing you the Lastest in Local Football (NIFL)</h2>
    <p></p> 
  </div>

<form runat="server" id="form2">
    <asp:Panel ID="panEdit" runat="server">
    
<div class="jumbotron">
    <div class="container">
    <asp:SqlDataSource ID="GrabNewsStories" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT TOP 6  Headline, Description, ImagePath, DateCreated FROM News"></asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataSourceID="GrabNewsStories" PagerSettings-Position="Top">
    <PagerStyle Font-Underline="false" CssClass="pageno" Font-Size="X-Large" Font-Bold="True" BorderStyle="None" BorderWidth="0" />
         
  <ItemTemplate>

    <div class="Row">
    <div class="col-md-6">
                              
                     <asp:Label ID="Label1" runat="server" Text='<%# Bind("DateCreated","{0:d MMM yyyy}") %>' Font-Bold="true" style="float:right"/><br />
                     <asp:Label ID="HeadlineLabel" runat="server" Text='<%# Bind("Headline") %>' Font-Bold="true" Font-Size="Large" Font-Underline="true"/><br /> <br/>
       
           <p class="comm" style="font-size:medium"> 
                     <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>'/> 
           </p>
                     
<script>
$(document).ready(function() {
    
	$(".comm").shorten();
	
	$(".comm-small").shorten({showChars: 10});

 });
</script>
    </div>


    <div class="col-md-4 col-sm-12">
        <br />
        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/Images/News/" + (DataBinder.Eval(Container.DataItem, "ImagePath"))%>' CssClass="img-rounded newsimg" /> 
    
        <br />
     </div>
 
    <div class="col-md-2 col-sm-12">
    <asp:SqlDataSource ID="LeagueTable" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT TOP 6 ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS Position, LeagueTable.Points, Teams.LogoPath, Teams.TeamName FROM LeagueTable 
        INNER JOIN Teams ON LeagueTable.TeamID=Teams.TeamID ORDER BY LeagueTable.Points DESC " SelectCommandType="Text">

    </asp:SqlDataSource>
    <asp:GridView ID="LeagueTableHome" runat="server" AutoGenerateColumns="False" DataSourceID="LeagueTable" CssClass="mLeagueTable">
            <Columns>
                
                <asp:BoundField DataField="Position" HeaderText="Pos" ReadOnly="True" SortExpression="Position" />
                <asp:ImageField DataImageUrlField="LogoPath" ControlStyle-CssClass=" img-rounded mLeagueTableBadge"/>
                <asp:BoundField DataField="TeamName" HeaderText="Team" />
                <asp:BoundField DataField="Points" HeaderText="Pts"/>

            </Columns>
        </asp:GridView>

     </div>


    </div>
     

    </ItemTemplate>
        
    </asp:FormView>
  
        </div>
    </div>
    </asp:Panel>


    <h2> Do you want to take our quiz ? <asp:CheckBox ID="chkSignUp" runat="server" AutoPostBack="true" OnCheckedChanged="chkSignUp_CheckedChanged"/></h2>

    <asp:Panel ID="panAdd" runat="server">

<div class="container">
  <div class="jumbotron">
         <h1>NIFL PIL Quiz</h1>
        <br />
        <br />

		<div runat="server" id="quiz">

            <h3>Q1) Who won the 2016/17 League ?</h3>
            <br />

                            <div class="container">
                    <asp:Label ID="results" runat="server"></asp:Label>
                </div>
            <br />

            <asp:RadioButtonList ID="q1" runat="server">
                <asp:ListItem Text="Tobermore" Value="1" />
                <asp:ListItem Text="Moyola" Value="2" />
                <asp:ListItem Text="Armagh" Value="3" />
                <asp:ListItem Text="Annagh" Value="4" />
            </asp:RadioButtonList>
            <br />
            <br />

            <h3>Q1) Where is the cup final played ?</h3>
            <br />

            <asp:RadioButtonList ID="q2" runat="server">
                <asp:ListItem Text="Wembley" Value="1" />
                <asp:ListItem Text="Windsor" Value="2" />
                <asp:ListItem Text="Old Trafford" Value="3" />
                <asp:ListItem Text="Mill Park" Value="4" />
            </asp:RadioButtonList>
            <br />
            <br />

            <h3>Q1) Manager for Moyola ?</h3>
            <br />

            <asp:RadioButtonList ID="q3" runat="server">
                <asp:ListItem Text="Ian Bryce" Value="1" />
                <asp:ListItem Text="Adam Wilson" Value="2" />
                <asp:ListItem Text="Stewart Lennox" Value="3" />
                <asp:ListItem Text="Steven Henry" Value="4" />
            </asp:RadioButtonList>
            <br />
            <br />

            <h3>Q4) Manager for Tobermore ?</h3>
            <br />

            <asp:RadioButtonList ID="q4" runat="server">
                <asp:ListItem Text="Ian Bryce" Value="1" />
                <asp:ListItem Text="Adam Wilson" Value="2" />
                <asp:ListItem Text="Stewart Lennox" Value="3" />
                <asp:ListItem Text="Steven Henry" Value="4" />
            </asp:RadioButtonList>
            <br />
            <br />

            <h3>Q5) Manager for Northern Ireland National Team ?</h3>
            <br />

            <asp:RadioButtonList ID="q5" runat="server">
                <asp:ListItem Text="Martin O'Niell" Value="1" />
                <asp:ListItem Text="Adam Wilson" Value="2" />
                <asp:ListItem Text="Michael O'Niell" Value="3" />
                <asp:ListItem Text="Steven Henry" Value="4" />
            </asp:RadioButtonList>
            <br />
            <br />


            <asp:LinkButton ID="Submit" Text="Submit" runat="server" OnClick="Submit_Click"/>
            <br />

            <asp:Panel ID="score" runat="server">

            </asp:Panel>

            </div>
      </div>


		
		</div>
	    <br />
        
        
	
    </asp:Panel>
    

</form>

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
