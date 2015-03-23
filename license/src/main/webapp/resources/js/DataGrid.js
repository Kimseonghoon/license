var myGrid = new AXGrid();
var DataGrid = {	
	pageStart: function(){
		DataGrid.grid.bind();
	},
	grid: {
	    bind: function(){
	        myGrid.setConfig({
	        	targetID : "data-grid",
	            //sort:false, 정렬을 원하지 않을 경우 (tip
	            fitToWidth:true, // 너비에 자동 맞춤
	            colHeadAlign: "center", // 헤드의 기본 정렬 값 ( colHeadAlign 을 지정하면 colGroup 에서 정의한 정렬이 무시되고 colHeadAlign : false 이거나 없으면 colGroup 에서 정의한 속성이 적용됩니다.
				colGroup : getColGroup(),
	            body : {
	                onclick: function(){
	                	//기존의 폼은 제거 하고 새로운 뷰만 로드.
	                	$(".data-form").detach();
	                	
	                	VIEW_TYPE = "DataForm";
	                	
	                	UUID = myGrid.getSelectedItem()["item"][UUID_NAME];
	        			LoadView();
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

	        //myGrid.setList(list);
	        DataGrid.grid.dataBind();
	
	    },
	    dataBind: function() {
	    	var request = $.ajax({
	    		url : "/eigs/getData.do",
	    		type : "POST", 
	    		data : {
	    			id : COMPANY_ID,
	    			viewName : VIEW_NAME,
	    			type: VIEW_TYPE
	    		},
	    		dataType : "json"
	    	});
	    	
	    	request.done(function(result) {
	    		myGrid.setList(result);
	    	}); 
	    },
	    getExcel: function(type){
	        var obj = myGrid.getExcelFormat(type);
	    },
	    getSelectedItem: function(){
	        toast.push('콘솔창에 데이터를 출력하였습니다.');
	    }
	}
};

$(document).ready(function() {	
	DataGrid.pageStart();		
});