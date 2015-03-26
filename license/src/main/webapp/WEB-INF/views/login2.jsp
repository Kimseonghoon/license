<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>

<link href="resources/login2/login.css" rel="stylesheet">
<link href="resources/axicon/axicon.min.css" rel="stylesheet">
</head> 
<!-- <link href='http://fonts.googleapis.com/css?family=Oxygen:400,300,700|Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'> -->
<body>

<div class="main">
	<div class="user">
		<img src="resources/login2/images/user.png" alt="">
	</div>
	
	<div class="login">
		<div class="inset">
			<form>
		         <div>
					<span><label>Username</label></span>
					<span><input type="text" class="textbox" id="active"></span>
				 </div>
				 <div>
					<span><label>Password</label></span>
				    <span><input type="password" class="password"></span>
				 </div>
				<div class="sign"> 
					<div class="submit">
					  <input type="submit" onclick="myFunction();return false;" value="LOGIN" >
					</div>
					<span class="forget-pass">
						<a href="#">Forgot Password?</a>
					</span>
						<div class="clear"></div>
				</div>
			</form>
		</div>
	</div>
</div>
<div class="copy-right">
	<p>copyright <a href="http://partdb.co.kr"> PARTDB</a></p> 
</div>

<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
});
function myFunction() {
	location.href = "home";  
}
</script>
</body>
</html>