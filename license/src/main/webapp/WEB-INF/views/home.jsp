<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head><meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Home</title>
<link href="resources/css/default.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- axisj css block -->
<link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="resources/axisj/css/cocker/AXJ.min.css" rel="stylesheet">
<link href="resources/axisj/css/cocker/AXGrid.css" rel="stylesheet">
<link href="resources/axicon/axicon.min.css" rel="stylesheet">

<link href="resources/metroui/css/metro-bootstrap.css" rel="stylesheet">
<link href="resources/metroui/css/metro-bootstrap-responsive.css" rel="stylesheet">
<link href="resources/metroui/css/iconFont.min.css" rel="stylesheet">

<style type="text/css">
html, body {
	margin: 0 auto;
	font-family: "Nanum Gothic" !important;
}
body{
	font-size:100%;
	background: url(resources/login2/images/bg.jpg);
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
	background-size: cover;
}
a {text-decoration: none !important;} 
</style>	
</head>
<body class="metro">
<div class="container" style="width:100% !important;padding-right:0 !important;padding-left:0 !important;">
	<div class="navigation-bar dark" style="margin-bottom:18px;">
		<div class="navbar-content">
			<a class="element"><i class="axi axi-circle-check"></i>
				TITLE <sup>1.0</sup></a>
			<span class="element-divider"></span>
 			
 			<a class="pull-menu" href="#"></a>
			
			<ul class="element-menu">
				<li><a class="dropdown-toggle" href="#">Base CSS</a></li>
				<li><a class="element" href="#">Community</a></li>
			</ul>

			<div class="no-tablet-portrait">
				<span class="element-divider"></span> 
				<a class="element brand" href="#"><span class="icon-spin"></span></a> 
				<a class="element brand" href="#"><span class="icon-printer"></span></a>
				
				<span class="element-divider"></span>

				<div class="element input-element">
					<form>
						<div class="input-control text">
							<input type="text" placeholder="Search...">
							<button class="btn-search"></button>
						</div>
					</form>
				</div>

				<div class="element place-right">
					<a class="dropdown-toggle" href="#"><span class="icon-cog"></span></a>
					<ul class="dropdown-menu place-right" data-role="dropdown">
						<li><a href="#">Products</a></li>
					</ul>
				</div>
				<span class="element-divider place-right"></span>
				<button class="element image-button image-left place-right">
					Kim Seonghoon<img src="resources/metroui/images/me.jpg" />
				</button>
			</div>
		</div>
	</div>
	
	<div class="data-pane">
		<p class="right_title"><strong>M＆S</strong></p> 		
		<div id="MnS" class="content"></div>
	</div>	
	
	<div class="data-pane">
		<p class="right_title"><strong>Lab</strong></p> 		
		<div id="Lab" class="content"></div>
	</div>
	
	<div class="data-pane">
		<p class="right_title"><strong>HO</strong></p> 		
		<div id="HO" class="content"></div>
	</div>
	
	<div class="data-pane">
		<p class="right_title"><strong>GB</strong></p> 		
		<div id="GB" class="content"></div>
	</div>
	
	<div class="data-pane" >
		<p class="right_title"><strong>President</strong></p> 		
		<div id="President" class="content" style="height:140px;"></div>
	</div>
	<!-- 
	<div class="data-pane">
		<p class="right_title"><strong>HO</strong></p> 		
		<div id="HO" class="content"></div>
	</div> -->
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

<!-- metroui js block -->
<script src="resources/metroui/js/metro.min.js"></script>
<!-- <script src="resources/metroui/js/jquery/jquery.min.js"></script> -->
<script src="resources/metroui/js/jquery/jquery.mousewheel.js"></script>
<script src="resources/metroui/js/jquery/jquery.widget.min.js"></script>
<script src="resources/metroui/js/jquery/jquery.dataTables.js"></script>
<script src="resources/metroui/js/jquery/jquery.easing.1.3.min.js"></script>

<script type="text/javascript">
var getColGroup = function(){
    return [
        {key : "comp_id", 			label: "comp_id", 			align: "center", width:"70", display: false},
        {key : "comp_location", 	label: "사용위치", 			align: "center", width:"150"},
        {key : "comp_user",  		label: "현재사용자",  		align: "center", width:"70"},
        {key : "comp_name", 		label: "PC명", 				align: "center", width:"80"},
        {key : "comp_type", 		label: "PC유형", 			align: "center", width:"70"},
        {key : "comp_os_lic", 		label: "라이선스(OS)", 		align: "center", width:"*"},
        {key : "comp_office_lic", 	label: "라이선스(Office)", 	align: "center", width:"*"},
        {key : "comp_description", 	label: "비고", 				align: "center", width:"*"}        
    ];
};

$(document).ready(function() {
	DataGrid.pageStart();
});

var myGrid = new AXGrid();
var gridList = [];

$(".content").each(function() {
	gridList.push({
		key:$(this).attr("id"),
		val:new AXGrid()
	});
});

var DataGrid = {	
	pageStart: function(){
		for(var i=0;i<gridList.length; i++) {
			DataGrid.grid.bind(i);			
		}
	},
	grid: {
	    bind: function(i){
	        gridList[i].val.setConfig({
	        	targetID : gridList[i].key,
	            /* sort:false, */
	            fitToWidth:true, // 너비에 자동 맞춤
	            colHeadAlign: "center", // 헤드의 기본 정렬 값 ( colHeadAlign 을 지정하면 colGroup 에서 정의한 정렬이 무시되고 colHeadAlign : false 이거나 없으면 colGroup 에서 정의한 속성이 적용됩니다.
				colGroup : getColGroup(),
	            body : {
	                onclick: function(){
	                	UUID = gridList[i].getSelectedItem()["item"][UUID_NAME];
	                },
	                /* ondblclick 선언하면 onclick 이벤트가 0.25 초 지연 발생 됩니다. 주의 하시기 바람니다. */
/* 	                ondblclick: function(){	                    
	                }, */
	                addClass: function(){
	                    // red, green, blue, yellow, white, gray
	                    if(this.index % 2 == 0){							
	                        return "white";
	                    }else{
	                        return "white";
	                    }	
	                }
	            },
	            page: {
	                paging: false
	            }
	        });

	        DataGrid.grid.dataBind(i, gridList[i].key);	
	    },
	    dataBind: function(i, id) {
	    	var request = $.ajax({
	    		url : "computer/group/"+id,
	    		type : "GET",
	    		data : {
	    			id : id
	    		},
	    		dataType : "json"
	    	});
	    	
	    	request.done(function(result) {
	    		gridList[i].val.setList(result);
	    	}); 
	    },
	    getExcel: function(type){
	        var obj = gridList[i].val.getExcelFormat(type);
	    },
	    getSelectedItem: function(){
	        toast.push('콘솔창에 데이터를 출력하였습니다.');
	    }
	}
};

</script>
</body>
</html>

