<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link href="resources/css/default.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- axisj css block -->
<link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="resources/axisj/css/cocker/AXJ.min.css" rel="stylesheet">
<link href="resources/axisj/css/cocker/AXGrid.css" rel="stylesheet">
<link href="resources/axicon/axicon.min.css" rel="stylesheet">

<style type="text/css">
html, body {
	margin: 0 auto;
}
body{
	font-family: 'Droid Sans', sans-serif;
	font-size:100%;
	background: url(resources/login/images/bg.jpg);
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
	background-size: cover;
}
.container {
width:100%;
background:red;
}
</style>	
</head>
<body>
<div class="container" >
	<div style="width:100%;height:60px;background:#AAA"></div>
</div>

<!--  script area -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.3/jquery-ui.min.js"></script>
<script src="resources/jquery/ajaxForm/jquery.form.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<script src="resources/bootstrap/js/addon/bootstrap-filestyle.min.js"></script>

<!-- axisj js block -->
<script src="resources/axisj/js/AXJ.min.js"></script>
<script src="resources/axisj/js/AXGrid.js"></script>
<script src="resources/axisj/js/AXCore.js"></script>

<script>
var request = $.ajax({
	url : "computer",
	type : "GET",
	dataType : "json"
});

request.done(function(msg) {
	$("#result").html(JSON.stringify(msg));
});

request.fail(function(jqXHR, textStatus) {
	alert("Request failed: " + textStatus);
});
</script>
</body>
</html>
