<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Football.Admin.Users" %>

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

<form id="form1" runat="server">

<div class="container">
  <div class="jumbotron">

    <asp:Panel runat="server" ID="panEdit">
        
        <h2>Edit User</h2>



    <asp:SqlDataSource ID="GrabUserDetails" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
        SelectCommand="SELECT UserDetails.Username, UserDetails.UserID, UserDetails.FullName, UserDetails.Password, UserDetails.ContactNo, UserDetails.emailAdd, u.Role AS exp2, t.TeamName AS exp1 FROM UserDetails INNER JOIN Teams AS t ON UserDetails.TeamName = t.TeamID INNER JOIN UserRoles AS u ON UserDetails.UserRole = u.UserRoleID"
        UpdateCommand="UPDATE UserDetails SET Username = @Username, FullName= @Fullname, ContactNo= @ContactNo, emailAdd =@emailAdd, Password =@Password, UserRole=@exp2, TeamName=@exp1 WHERE (UserID = @UserID)" ConflictDetection="OverwriteChanges" SelectCommandType="Text">

        <UpdateParameters>
                <asp:Parameter Name="Username" /> 
                <asp:Parameter Name="FullName" />
                <asp:Parameter Name="ContactNo" />
                <asp:Parameter Name="emailAdd" />
                <asp:Parameter Name="Password" />
                <asp:Parameter Name="UserRole" />
                <asp:Parameter Name="TeamsName" />

                

                <asp:FormParameter Name="UserID" Type="String" />  
               
            </UpdateParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SelectTeams" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [TeamID], [TeamName] FROM [Teams]"></asp:SqlDataSource>

    

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="UserID" DataSourceID="GrabUserDetails" Width="99%" CssClass="mydatagrid" HeaderStyle-CssClass="header" RowStyle-CssClass="rows">
            <Columns>
                <asp:CommandField ShowEditButton="True" >
                <ControlStyle ForeColor="Black" />
                <ItemStyle ForeColor="Black" />
                </asp:CommandField>
                <asp:CommandField ShowSelectButton="True" ControlStyle-Font-Bold="true" SelectText="Delete" >
                <ControlStyle Font-Bold="True" ForeColor="Black"></ControlStyle>
                </asp:CommandField>
                
                <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                <asp:BoundField DataField="FullName" HeaderText="Name" SortExpression="FullName" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                <asp:BoundField DataField="ContactNo" HeaderText="Contact" SortExpression="ContactNo"/>
                <asp:BoundField DataField="emailAdd" HeaderText="Email" SortExpression="emailAdd" />               
                <asp:BoundField DataField="exp1" HeaderText="Teams" SortExpression="exp1" />
                <asp:BoundField DataField="exp2" HeaderText="Role" SortExpression="exp2" />
                
               
                
            </Columns>
            <HeaderStyle CssClass="header" />
            <RowStyle CssClass="rows" />
        </asp:GridView>
      

</asp:Panel>

<h2> Add New User ? <asp:CheckBox ID="chkSignUp" runat="server" AutoPostBack="true" OnCheckedChanged="chkSignUp_CheckedChanged"/></h2>

    <asp:Panel ID="panAdd" runat="server">

             <h1>Add User</h1>
      <p>&nbsp;</p> 
        <div class="container tableForm bookingForm" style="max-width:400px; margin-left:auto; margin-right:auto; display:block;">

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT  [TeamName], [TeamID] FROM Teams"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SelectRole"  runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT  [Role], [UserRoleID] FROM UserRoles"></asp:SqlDataSource>
    
        <h4>Full Name:</h4>
            <asp:TextBox ID="SetFullName" runat="server" Width="200px"></asp:TextBox>
            <br />

        <h4>Username:</h4>
            <asp:TextBox ID="SetUsername" runat="server" Width="200px"></asp:TextBox>
            <br />

        <h4>Password:</h4>
            <asp:TextBox ID="SetPassword" runat="server" Width="200px"></asp:TextBox>
            <br />

        <h4>Email Address:</h4>
            <asp:TextBox ID="SetEmail" runat="server" Width="200px"></asp:TextBox>
            <br />

        <h4>Contact Number:</h4>
            <asp:TextBox ID="SetNumber" runat="server" TextMode="Number" Width="200px"></asp:TextBox>
            <br />

        <h4>Role:</h4>
            <asp:DropDownList ID="SetRole" runat="server" DataSourceID="SelectRole" DataTextField="Role" DataValueField="UserRoleID" Width="200px" ></asp:DropDownList>
            <br />

        <h4>Club:</h4>
            <asp:DropDownList ID="SetTeam" runat="server" DataSourceID="SelectTeams" DataTextField="TeamName" DataValueField="TeamID">
                <asp:ListItem >Guest/Other</asp:ListItem></asp:DropDownList>
            <br />
            <br />
 

            <asp:Button ID="CreateUser" runat="server" Text="Create User" OnClick="CreateUser_Click" CssClass="btn btn-primary"/>

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

