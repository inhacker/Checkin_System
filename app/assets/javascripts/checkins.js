$(document).ready(function(){

	$("#parent-search").focus();

	$("#parent-search").keydown(function(e){
		checkinClient.searchParent(e.target.value);
	});

	$("#checkin-btn").click(function(){
		checkinClient.checkin();
	})

});

var checkinClient = {
	selectedChildrenIds : [],

	searchParent: function(query){
		if(query == "" || query == undefined || query == null){
			this.UI.clearResult();
		}

		//send and ajax request and get all the parents with such criteria
		$.ajax({
			url:"/parents/find_by_name/"+query,
			method: "GET",
			dataType: "JSON",
			success:function(data, status, xhr){
				checkinClient.UI.updateResult(data);
			},
			error: function(data, status, xhr){
				console.log(data);
			}
		})
	},

	searchKid: function(parent_id){
		$.ajax({
			url:"/parents/get_all_kids/"+parent_id,
			method: "GET",
			dataType: "JSON",
			success:function(data, status, xhr){
				checkinClient.UI.showChildren(data);
			},
			error: function(data, status, xhr){
				console.log(data);
				alert("Something went wrong, please refresh the page");
			}
		});
	},

	parentFound: function(e){
		//clear the search result
		checkinClient.UI.clearResult();


		var el = $(e.target);
		parent_id = el.data("id");
		checkinClient.UI.showFullName(el.text());		

		if(parent_id != undefined || parent_id != null)
			checkinClient.searchKid(parent_id);
	},

	childItemClicked:function(e){
		var el = $(e.target);
		var child_id = el.data("id");

		var index = checkinClient.selectedChildrenIds.indexOf(child_id);

		if(index > -1){
			//they are de selecting the child
			checkinClient.selectedChildrenIds.splice(index,1);	
		}
		else{
			//they are selecting the child
			checkinClient.selectedChildrenIds.push(child_id);
		}

		//selecting OR de-selecting the item in the UI
		checkinClient.UI.childItemToggle(child_id);
	},

	checkin: function(){
		if(this.selectedChildrenIds.length == 0) return;

		$.ajax({
			url:"/kids/checkin",
			method: "POST",
			data:{
				ids: checkinClient.selectedChildrenIds
			},
			dataType: "JSON",
			success: function(data, status, xhr){
				successfulCheckins = data;

				//if everything went okay
				if(checkinClient.selectedChildrenIds.length == successfulCheckins){
					checkinClient.UI.successfullCheckin();
				}
				else{

				}

				//clear the ids
				checkinClient.selectedChildrenIds = [];

			},
			error: function(data, status, xhr){
				console.log(data);
				alert("Error");
			}
		});
	},

	UI : {
		updateResult: function(parents){
			//remove all the existing rows
			$("#parent-search-result ul li").remove();
			for(var i=0;i<parents.length;i++){
				//creating the new element
				var parentItem = $("<li data-id='"+parents[i].id+"'/>").text(parents[i].f_name + " " +  parents[i].l_name);

				//attaching the appropriate event listeners
				parentItem.on("click", checkinClient.parentFound);

				//adding the new element to the list
				$("#parent-search-result ul").append(parentItem);
			}
		},

		clearResult: function(){
			$("#parent-search-result ul li").remove();
		},

		showFullName: function(name){
			// console.log("here", name);
			$("#parent-search").val(name);
		},

		showChildren: function(children){
			//remove all the existing children
			$("#checkin-children ul li").remove();

			if(children.length == 0){
				var notFoundItem = $("<li />").text("No Children Found");
				$("#checkin-children ul").append(notFoundItem);

				return;
			}

			for(var i=0;i<children.length;i++){
				//creating the new element
				var childItem = $("<li data-id='"+children[i].id+"'/>").text(children[i].f_name + " " + children[i].l_name);


				if(children[i].is_checked_in){
					childItem.addClass("checked-in");
				}
				else{
					//attaching the handlers
					childItem.on("click", checkinClient.childItemClicked);	
				}
				

				//add the new element to the list
				$("#checkin-children ul").append(childItem);
			}
		},

		childItemToggle: function(child_id){
			var item = $("#checkin-children ul li[data-id="+child_id+"]");

			item.toggleClass("active");
		},

		successfullCheckin: function(){
			for(var i=0;i<checkinClient.selectedChildrenIds.length;i++){
				$("#checkin-children ul li[data-id="+checkinClient.selectedChildrenIds[i]+"]")
					.toggleClass("active checked-in")
					.off("click");
			}

			this.popup("All kids were successfully checked in.");
		},

		popup:function(message){
			var popup_div = $("<div />", {
				"class": "pop-up"
			});

			var message = $("<p />").text(message);
			popup_div.append(message);

			$("#main").prepend(popup_div);
			
			popup_div.delay(5000).fadeOut("fast", function(){
				this.remove();
			});
		}

	}


}

