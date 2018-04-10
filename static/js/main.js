/**
 * Created by Enamul on 2016-11-23.
 */
var MMDSet = [];
var currentMMD; //by default


/*$( "#button_next" ).click(function() {
     console.log(new Date().getTime()); //get the timestamp

     var getCurrentMMDIndex = MMDSet.indexOf(parseInt(currentMMD));
     if(getCurrentMMDIndex<MMDSet.length){
          currentMMD = (MMDSet[getCurrentMMDIndex+1]).toString();
          console.log(currentMMD);
          loadMMD(currentMMD);

     }

});
*/

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

function loadMMD(mmdName){
     setTimeout(function () {
     $("#mmdOptions").val(parseInt(mmdName));
     },500);

     console.log(mmdName);

     d3.json("static/data/"+mmdName+".json", function(data){
          $("#theText").html(data.text);
          //console.log('<img src='+data.chart+'');
          $("#visualization").html('<img id="theChart" src="static/'+data.chart+'">' );					
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

     });
}
