
var sellers = sellers || {};
sellers.Init = (function () {
	$("#seller_products").on("click",function(e){		
		var from = $("#from").val();
		var to = $("#to").val();
		if (from.length == 0 || to.length == 0){
			
			return false;
		}else{
			var url = "/sellers/ajax_products"
			var data = {
				from: from,
				to: to
			}
			sellers.getAjax(url, data);
		}
	});
	
});

$(document).ready(function(){	
	sellers.Init();
	$(".date").datepicker();
});
sellers.getAjax = function(url, inputData){
	$.get(url, inputData, function(response){
		$("#graph").html(response.graph);
		$("#plist").html(response.list);
	});
}

