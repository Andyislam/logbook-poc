
get_events ()



function get_events(){
	$.ajax({
	  type:'GET', 
	  url: "/log_events", 
	  mimeType:"multipart/form-data",
	  contentType: false,
	  cache: true,
	  processData:false,
	  dataType: "text",
	  success: function(data){
	  	console.log(data)
	  },
	  error: function(data){
	    
	  }
	})
}



function start_event (){
	$.ajax({
	  type:'POST', 
	  url: "/log_events", 
	  mimeType:"multipart/form-data",
	  contentType: false,
	  cache: true,
	  processData:false,
	  dataType: "text",
	  success: function(data){
	  	console.log(data)
	  	get_events ()
	  },
	  error: function(data){
	    
	  }
	})
}