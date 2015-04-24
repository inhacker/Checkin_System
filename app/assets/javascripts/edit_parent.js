$(document).ready(function(){

	$("#primary_parent_btn").click(function(){
		editParentClient.changePrimaryParent();
	});
	$("#add_parent_btn").click(function(){
		editParentClient.addParent();
	});
	
});

var editParentClient = {
	changePrimaryParent : function(){
		var selected_parent_id = $("#kid_parents option:selected").val();
		
		$.ajax({
			url: "change_primary_parent",
			data: {
				parent_id : selected_parent_id,
			},
			method: "PUT",
			dataType: "JSON",
			success: function(data, status, xhr){
				if(data.status == "saved"){
					checkinClient.UI.popup("Primary parent was successfully changed");
					window.location.reload();
				}
				else{
					alert("Something went wrong while chaning the primary parent, refresh and try again");
				}
			},
			error: function(data, status, xhr){
				console.log("Error",data);
			}
		});
	},
	
	addParent : function(){
		var selected_parent_id = $("#all_parents option:selected").val();

		$.ajax({
			url: "add_parent",
			data: {
				parent_id : selected_parent_id,
			},
			method: "PUT",
			dataType: "JSON",
			success: function(data, status, xhr){
				if(data.status == "saved"){
					checkinClient.UI.popup("Parent was successfully added");
					window.location.reload();
				}
				else{
					alert("Something went wrong while chaning the primary parent, refresh and try again");
				}
			},
			error: function(data, status, xhr){
				console.log("Error",data);
			}
		});
	}
}
