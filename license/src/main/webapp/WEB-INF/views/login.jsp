<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>

<link href="resources/login/login.css" rel="stylesheet">
<link href="resources/axicon/axicon.min.css" rel="stylesheet">

</head>
<body>
	 
<div class="message warning">
<div class="inset">
	<div class="login-head">
		<h1>Login Form</h1>
		 <div style="font-size:22px;color:#AAA;" class="alert-close">
		 	<i class="axi axi-ion-close-round"></i>
		 </div> 			
	</div>
	<div class="form">
		<div class="li">
			<input type="text" class="text" value="Username" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Username';}">
			<i style="font-size:22px;color:#AAA;" class="axi axi-ion-person"></i>
		</div>
		<div class="clear"></div> 
		<div class="li">
			<input type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">
			<i style="font-size:22px;color:#AAA;" class="axi axi-lock2"></i>
		</div>
		<div class="clear"></div>
		
		<div class="submit">
			<input type="submit" onclick="myFunction()" value="Sign in" >
			<h4><a href="#">Lost your Password ?</a></h4>
			<div class="clear"></div>	
		</div>			
	</div>
</div>		
</div>
<div class="clear"> </div>

<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
});
function myFunction() {
	location.href="home";
}
</script>
</body>
</html>