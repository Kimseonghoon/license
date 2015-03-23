var DataForm = {
	getData: function() {
		$("#r-pane").append($(this).html());
		
		var tmpId = COMPANY_ID;		
		$("#r-pane").find("div").each(function() {
			if($(this).hasClass("data-table")) {
				tmpId = UUID;
			}
		});
					
		var request = $.ajax({
			url : "/eigs/getData.do",
			type : "POST", 
			data : {
				id : tmpId,
				viewName : VIEW_NAME,
				type: VIEW_TYPE
			},
			dataType : "json"
		});

		request.done(function(result) {
			for(var i=0; i < result.length; i++) {
				$(".value input").each(function() {
					$id = $(this).parent().parent();
					$input = $(this);

					// ajax로 부터 return된 json이 null이 아닌경우..
					if(result[i] != null) {	
						$.each(result[i], function(k, v) {
							if ($id.attr("id") == k) {							
								switch ($id.attr("class")) {
								case "form-tel":
									DataForm.FormTel($input, v);
									break;
								case "form-email":
									DataForm.FormEmail($input, v);
									break;
								case "form-money":
									DataForm.FormMoney($input, v);
									break;
								case "form-radio":
									DataForm.FormRadio($input, v);
									break;
								default:
									$input.val(v);
									break;
								}								
							}
						});	
					}
					
					// Placeholder 삽입.
					if ($(this).val() == "") {
						$(this).attr("placeholder",	"\"requied\"");
						$(this).parent().addClass("has-error");
					} else {
						$(this).parent().removeClass("has-error");
					}
				});
			}						
		});

		request.fail(function(jqXHR, textStatus) {
			alert("Request failed: " + jqXHR.status);
		});
	},
	FormTel: function($InputTel, v) {		
		//더러운코드 없애버리고싶다ㅡㅡ;;
		telStr = v.split("-");
		if($InputTel.hasClass("form-tel-1")) {
			$InputTel.val(telStr[0]);
		} else if($InputTel.hasClass("form-tel-2")) {
			$InputTel.val(telStr[1]);
		} else if($InputTel.hasClass("form-tel-3")) {
			$InputTel.val(telStr[2]);
		}
	},
	FormEmail: function($InputEmail, v) {
		emailStr = v.split("@");
		if($InputEmail.hasClass("form-email-1")) {
			$InputEmail.val(emailStr[0]);
		} else if($InputEmail.hasClass("form-email-2")) {
			$InputEmail.val(emailStr[1]);
		}
	},
	FormMoney: function($InputMoney, v) {
		$InputMoney.css("direction","rtl");
		if(v!="") {
			$InputMoney.val(v.money());
		}
	},
	FormRadio: function($InputRadio, v) {
		//console.log(v);
		$InputRadio.parent().parent().find(".value").each(function(e) {
			if(e.toString()==v.toString()) {				
				$(this).find("input").attr("checked",true);
			}
		});
	}
	//getData 끝
};

var fnCalendar = {
	pageStart: function() {
		$(".form-calendar .value input").each(function(e) {
			$(this).attr("id","calendar_tmp_id_"+e);
			var $flag = $(this).parent().parent();
			
			if($flag.hasClass("year-only")){
				$(this).bindDate({
					align:"right", 
					valign:"bottom", 
					selectType:"y",
					separator:"-", 
					defaultSelectType:"y", 
					onchange:function(){
					}
				});
			} else if($flag.hasClass("month-only")) {
				$(this).bindDate({
					align:"right", 
					valign:"bottom", 
					selectType:"m",
					separator:"-", 
					defaultSelectType:"m", 
					onchange:function(){
					}
				});
			} else {
				$(this).bindDate({
					align:"right", 
					valign:"bottom", 
					selectType:"d",
					separator:"-", 
					defaultSelectType:"d", 
					onchange:function(){
					}
				});
			}
		});
	}
};

var btnEvent = {
	updateBtn: function() {
		$("#updateBtn").on("click", function() {
			var halfClientHeight = (document.body.clientHeight / 2)-100;
			dialog.push({
			    body:'<b>'+$(".right_title > strong").html()+' </b> 데이터를 수정하시겠습니까?', top:halfClientHeight , type:'Warning', buttons:[
			        {buttonValue:'확인', buttonClass:'Red W60', onClick:btnEvent.updateData, data:'data1'},
			        {buttonValue:'취소', buttonClass:'W60', data:'data1'}
			    ]
			});
			$(".AXNotificationHead").css("visibility","hidden");
			$(".AXNotification").css("height","150px").css("width","330px");
			
			$FOG.css("visibility","visible");
		});
	},
	updateData: function() {
		var i=0;
		jsonArr = [];
		$(".data-form #dg-row > div > div").each(function() {	
			var key = $(this).attr("id");
			var val = $(this).find(".value input").val();
			
			if($(this).hasClass("form-tel")) {
				val = $(this).find(".form-tel-1").val()+"-"+$(this).find(".form-tel-2").val()+"-"+$(this).find(".form-tel-3").val();
			} else if($(this).hasClass("form-email")) {
				val = $(this).find(".form-email-1").val()+"@"+$(this).find(".form-email-2").val();
			} else if($(this).hasClass("form-radio")) {
				val = $(this).find(":input[name=optradio]:radio:checked").val();
			}
			
			jsonArr.push({
				key: key,
				val: val				
			});
		});
					
		var tmpId = COMPANY_ID;		
		$("#r-pane").find("div").each(function() {
			if($(this).hasClass("data-table")) {
				tmpId = UUID;
			}
		});
		
		var request = $.ajax({
			url : "/eigs/updateData.do",
			type : "POST",
			data : {
				id : tmpId,
				viewName : VIEW_NAME,
				type: VIEW_TYPE,
				updateData: jsonArr
			},
			dataType : "html"
		});

		request.done(function(msg) {
			DataForm.getData();	
			toast.push({body:'<b>'+$(".right_title > strong").html()+' </b> 데이터가 수정되었습니다', type:'Warning'});
		});

		request.fail(function(jqXHR, textStatus) {
			alert("Request failed: " + textStatus);
		});
	},
	
	deleteBtn: function() {
		$("#deleteBtn").on("click", function() {
			var halfClientHeight = (document.body.clientHeight / 2)-100;
			dialog.push({
			    body:'<b>'+$(".right_title > strong").html()+' </b> 데이터를 삭제하시겠습니까?', top:halfClientHeight , type:'Caution', buttons:[
			        {buttonValue:'확인', buttonClass:'Red W60', onClick:btnEvent.deleteData, data:'data1'},
			        {buttonValue:'취소', buttonClass:'W60', data:'data1'}
			    ]
			});
			$(".AXNotificationHead").css("visibility","hidden");
			$(".AXNotification").css("height","150px").css("width","330px");
			
			$FOG.css("visibility","visible");			
		});
	},
	deleteData: function() {
		var tmpId = COMPANY_ID;		
		$("#r-pane").find("div").each(function() {
			if($(this).hasClass("data-table")) {
				tmpId = UUID;
			}
		});
		
		var request = $.ajax({
			url : "/eigs/deleteData.do",
			type : "POST",
			data : {
				id : tmpId,
				viewName : VIEW_NAME,
				type: VIEW_TYPE
			},
			dataType : "html"
		});

		request.done(function(msg) {
			toast.push({body:'<b>'+$(".right_title > strong").html()+' </b> 데이터가 삭제되었습니다', type:'Warning'});
			$("#nav-sidebar .active").click();
			
		});

		request.fail(function(jqXHR, textStatus) {
			alert("Request failed: " + jqXHR.status);
		});
	}
};

$(document).ready(function() {
	fnCalendar.pageStart();	
	DataForm.getData();	
	btnEvent.updateBtn();
	btnEvent.deleteBtn();
});