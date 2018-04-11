/**
 * Created by Enamul on 2016-11-23.
 * Edited by Dereck on 2018-04-11.
 */
var MMDSet = [];
var currentMMD; //by default
var group;


d3.json("static/data/conditions.json", function(data){

	 var selectHtml = "";
     MMDSet = data;
     for(var i=0;i<data.length;i++){
          //console.log(data[i]);
          selectHtml+= '<option value="'+data[i]+'">'+data[i]+'</option>';
     }
     $("#mmdOptions").html(selectHtml);

     $("#mmdOptions").change(function() {
          //alert($(this).find("option:selected").text()+' clicked!');
          currentMMD = $(this).find("option:selected").text();
          loadMMD(currentMMD);
     });




});

//Dereck added user_group to determine viz or noviz condition
function loadMMD(mmdName,user_group){
     setTimeout(function () {
     $("#mmdOptions").val(parseInt(mmdName));
     },500);

     console.log(mmdName);

     d3.json("static/data/"+mmdName+".json", function(data){
          $("#theText").html(data.text);
          //console.log('<img src='+data.chart+'');
					if (user_group == "1"){
						$("#visualization").html('<img id="theChart" src="static/'+data.chart+'">' );
					}
					else {
						no_viz = data.chart.slice(0, -4) +"0"+data.chart.slice(-4);
						$("#visualization").html('<img id="theChart" src="static/'+no_viz+'">' );
					}

					// This code is for the coordinate extraction for generating AOIs
					/*
					var coordinatesChars = [];

					var some_text = $("#theTextParagraph").text().trim()

					var refs = data.references[1].reference;

					for (var j = 0, len = refs.length; j < len; j++) {
						var the_phrases = refs[j].phrases;

						for (var k = 0, len2 = the_phrases.length; k < len2; k++) {
							var start = the_phrases[k].start;
							var end = the_phrases[k].end;


							newText = "";
							for (var i = 0, len3 = some_text.length; i < len3; i++) {
								if (i == start)	newText+= '<span>'+some_text[i];
								else if (i == end)	newText+= some_text[i]+ '</span>';
								else newText+=some_text[i];
							}

								$("#theTextParagraph").html(newText);

								$spans = $("#theTextParagraph").find('span');

								$spans.each(function(){
				    			var $span = $(this),
				        	$offset = $span.offset();
				    				$offset.width = $span.innerWidth();
				    				$offset.height = $span.innerHeight();
				    				coordinatesChars.push($offset);
				  			});

				 		}
					}

					console.log(coordinatesChars);
				*/

     });
}
