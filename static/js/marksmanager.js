(function(){
	var MarksManager = function(marks, img) {
		this.data = marks;
		this.img = img;
		
		this.type = MarksManager.HIGHLIGHT;
		this.current_params = MarksManager.defaultHighlightParams;
		
		this.marks = [];

    this.scale = {
      x: 1,
      y: 1
    };
	};
	MarksManager.defaultHighlightParams = {
		'attributes': {
		},
		'style': {
			'display': 'block'
		},
		'classes': ['visual_reference']
	};
	MarksManager.defaultDesaturateParams = {
		'attributes': {
			'fill': 'white',
			'fill-opacity': 0
		},
		'style': {
			'display': 'block'
		},
		'classes': ['visual_reference']
	}
	MarksManager.HIGHLIGHT = "highlight";
	MarksManager.DESATURATE = "desaturate";
	
  var DESATURATION = 0.7;
	MarksManager.internal = {
		highlights: {
			"highlight": {
				"create": function() {
					var self = this;
					var marks = d3.select(self.overlay).selectAll('rect')
					  .data(self.data, function(d) { return d ? d.id : null; });
					
					marks.enter()
					  .append('rect').attr('x', function(d) { return d.left*self.scale.x; })
					  .attr('y', function(d) { return d.top*self.scale.y; })
					  .attr('width', function(d) { return d.width*self.scale.x; })
					  .attr('height', function(d) { return d.height*self.scale.y; });
				
					marks.exit().remove();
					
					return d3.select(self.overlay).selectAll('rect');
				},
				"highlight": function(tuple_ids) {
					//d3.selectAll(this.marks)
                    d3.select(this.overlay).selectAll('rect')
					  .style('display', function(mark_data) {
						  for(var i=0; i<tuple_ids.length; i++) {
						      if(tuple_ids[i] === mark_data.id) return 'block';
						  }
						  return 'none';
					  });
				},
				"unhighlight": function() {
          d3.selectAll(this.marks).style('display', 'none');
        }
			},
			"desaturate": {
				"create": function() {
					var self = this;
					
					var margin = 1;
					var marks = d3.select(self.overlay).selectAll('rect')
					  .data(self.data, function(d) { return d.id; }).enter()
					  .append('rect')
            .attr('x', function(d) {
              return (d.left-margin)*self.scale.x;
            })
					  .attr('y', function(d) {
              return (d.top-margin)*self.scale.y;
            })
					  .attr('width', function(d) {
              return (d.width+margin*2)*self.scale.x;
            })
					  .attr('height', function(d) {
              return (d.height+margin*2)*self.scale.y;
            })
            .on('click._marksmanager', function(d) {
							if(!d3.select(this).classed('selected')) {
								MarksManager.internal.highlights['desaturate'].highlight.call(self, [d.id]);
							}
							else {
								MarksManager.internal.highlights['desaturate'].unhighlight.call(self);
							}
            });
					// Extract only the marks that are mentioned
					var referenced_marks = self.data.reduce(function(acc, val) {
												if(val.tuple) acc.push(val);
												return acc;
											}, []);
					return marks[0];
					// var hints = d3.select(this.overlay).selectAll('circle')
					// 			  .data(referenced_marks, function(d) { return d.id; })
					// 			  .enter().append('circle')
					// 			  .attr('cx', function(d) { return d.left; })
					// 			  .attr('cy', function(d) { return d.top; })
					// 			  .attr('r', 3).attr('fill', 'red').attr('fill-opacity', 0.5)
					// 			  .classed('reference_hint', true);
				},
				"highlight": function(tuple_ids, animate) {
					var self = this,
						marks = self.getSelectedMarks(tuple_ids);
					//console.log(animate);
            if(animate) {
            	//console.log(marks.selected_marks);

            	if(isArrowsIntervention){
								self.arrowwidth = 25;
                for(var i=0;i<marks.selected_marks.length;i++){
                  var d3mark = d3.select(marks.selected_marks[i]);
                  var mark_data = d3mark.data()[0];
                  var arrowSize = Math.min(10, mark_data.height/2-2);
                  //console.log(mark_data);
                  self.drawArrow(d3.select(this.overlay), mark_data.left+ mark_data.width+self.arrowwidth,
																													mark_data.height/2+ mark_data.top,
																													mark_data.left+ mark_data.width+2,
																													mark_data.height/2+ mark_data.top, arrowSize, 'selectArrow');
                }

							}
							else{
            		console.log('remove');
                 d3.select(this.overlay).selectAll( '.arrow_selectArrow')
                     .transition()
                     .duration(TRANSITION_DURATION)
										 .remove();

              }

              d3.selectAll(marks.selected_marks)
                .attr('stroke', "none")
                  .attr('stroke-width', 2)
                .transition()
                .duration(TRANSITION_DURATION)
                //.attr('fill-opacity', 0)
                  .attr('stroke', function () {
                      //console.log(isBoldingIntervention);
                      return isBoldingIntervention? 'red': 'none';
                  })//Enamul: isBoldingIntervention added
                .each('end', function() {
                  d3.select(this).classed('selected', true);
                  //d3.select(this).classed('selected', !d3.select(this).classed('selected'));
                });
              d3.selectAll(marks.unselected_marks)
                .transition()
                .duration(TRANSITION_DURATION)
                .attr('fill-opacity', function(mark_data) {
                    return marks.selected_marks.length === 0 ? 0 : isDeemphasis? DESATURATION: 0;
                }).each('end', function() {
                    d3.select(this).classed('selected', false);
                });



            } else {
              d3.selectAll(marks.selected_marks)
									//.attr('fill-opacity', 0)
                  .attr('stroke', "none")
                  .attr('stroke-width', 2)
                  .duration(TRANSITION_DURATION)
                  .attr('stroke', function () {
                  	console.log(isBoldingIntervention);
                      return isBoldingIntervention? 'red': 'none';
                  })//Enamul: isBoldingIntervention added

				  .classed('selected', 'true');
              d3.selectAll(marks.unselected_marks)
                  .duration(TRANSITION_DURATION)
                .attr('fill-opacity', function(mark_data) {
                    return marks.selected_marks.length === 0 ? 0 : isDeemphasis? DESATURATION: 0;
                }).classed('selected', false);
            }
				},
				"unhighlight": function() {
					d3.selectAll('.visual_reference')
					  .transition()
					  .attr('fill-opacity', 0)
                        .attr('stroke', 'none') //Enamul: to remove Bolding Intervention
						.duration(TRANSITION_DURATION)
            .each('end', function() {
              d3.select(this).classed('selected', 'false');
            });


				}
			}
		}
	};


  MarksManager.prototype.drawArrow = function(svgElement, x1, y1, x2, y2, size, id){
    this.strokeWidth = 2;
    var angle = Math.atan2(x1 - x2, y2 - y1);
    angle = (angle / (2 * Math.PI)) * 360;
    svgElement.append("path")
        .attr("class", "arrow_" + id)
        .attr("d", "M" + x2 + " " + y2 + " L" + (x2 - size) + " " + (y2 - size) + " L" + (x2 - size) + " " + (y2 + size) + " L" + x2 + " " + y2)
        .attr("transform", "rotate(" + (90 + angle)+ "," + x2 + "," + y2 +")")
        .attr("fill", "black")
        .style("opacity", 0)
        .transition()
        .duration(TRANSITION_DURATION)
        .style("opacity", 1)
    svgElement.append("svg:line")

        .attr("class", "arrow_"+id)
        .attr("x1", x1).attr("y1", y1)
        .attr("x2", x2).attr("y2", y2)
        .style("stroke", "black")
        .style("opacity", 0)
				.style("stroke-width", this.strokeWidth)
        .transition()
        .duration(TRANSITION_DURATION)
        .style("opacity", 1);
  };
	MarksManager.prototype.changeType = function(type) {
		var marks;
		
		if(!type) type = MarksManager.DESATURATE;
		this.type = type;
		
		this.clearMarks();
		
		if(type === MarksManager.HIGHLIGHT) {
			this.current_params = MarksManager.defaultHighlightParams;
		}
		if(type === MarksManager.DESATURATE) {
			this.current_params = MarksManager.defaultDesaturateParams;
		}	
		this.marks = MarksManager.internal.highlights[type].create.call(this);
		this.assignParams(this.current_params);
	};
	MarksManager.prototype.createOverlay = function(type, params) {
		if(!params) params = this.current_params;
		if(type) {
			this.type = type;
		}
		
		/*
		 * Create the overlay
		 */
		var svgns = "http://www.w3.org/2000/svg";
		
		// Create an svg overlay on the image
		var imgParent = this.img.parentNode,
			nextSibling = this.img.nextSibling,
			nodeRect = this.img.getBoundingClientRect(),
			containingDiv,
			marksOverlay;
			
		// Create the containing div
		containingDiv = document.createElement('div');
		containingDiv.setAttribute('class','overlayContainer');
		containingDiv.style.position = 'relative';
		containingDiv.style.width = Math.ceil(nodeRect.width)+'px';
		containingDiv.style.height = Math.ceil(nodeRect.height)+'px';
		
		// Create the overlay
		this.overlay = document.createElementNS(svgns, 'svg:svg');
		d3.select(this.overlay).attr({
			"class": "overlay",
			'height': Math.ceil(nodeRect.height),
			"width": Math.ceil(nodeRect.width)
		}).style({
			'position': 'absolute'
		});
		
		containingDiv.appendChild(this.overlay);
		containingDiv.appendChild(this.img);
		
		imgParent.insertBefore(containingDiv, nextSibling);

    // Set the scale
    this.scale.x = Math.ceil(nodeRect.width) / this.img.naturalWidth;
    this.scale.y = Math.ceil(nodeRect.height) / this.img.naturalHeight;

		// Overlay the marks
		this.current_params = params;
		this.update();
	};
  MarksManager.prototype.removeOverlay = function() {
    this.img.parentNode.parentNode.replaceChild(this.img, this.img.parentNode);
  };
	MarksManager.prototype.assignParams = function(params) {
		if(!this.overlay) throw "No overlay associated with this image."
		
		var marks = d3.select(this.overlay).selectAll('rect'),
			key;
		for(key in params.attributes) {
			if(params.attributes.hasOwnProperty(key)) {
				marks.attr(key, params.attributes[key]);
			}
		}
		for(key in params.style) {
			if(params.style.hasOwnProperty(key)) {
				marks.style(key, params.style[key]);
			}
		}
		params.classes.forEach(function(c) {
			marks.classed(c, true);
		});
	};
	MarksManager.prototype.getSelectedMarks = function(tuple_ids) {
		var self = this;
		var selected_marks = [],
			unselected_marks = [];
	 	for(var j=0; j<self.marks.length; j++) {
			(function(curMark) {
				var d3mark = d3.select(curMark);
				var mark_data = d3mark.data()[0];
				var selected = false;
	        	for(var i=0; i<tuple_ids.length; i++) {
					if(tuple_ids[i] === mark_data.id) {
						selected_marks.push(curMark);
						selected = true;
						return;
					}
				}
				if(!selected) unselected_marks.push(curMark);
			})(self.marks[j]);
	    }
	
		return {
			'selected_marks': selected_marks,
			'unselected_marks': unselected_marks
		};
	};
	MarksManager.prototype.update = function() {
		this.marks = MarksManager.internal.highlights[this.type].create.call(this);
		this.assignParams(this.current_params);
	};
	MarksManager.prototype.highlight = function(tuple_ids, animate) {
		MarksManager.internal.highlights[this.type].highlight.call(
        this, tuple_ids, animate);
	};
	MarksManager.prototype.unhighlight = function() {
		MarksManager.internal.highlights[this.type].unhighlight.call(this);
	};
	MarksManager.prototype.clearMarks = function() {
		d3.select(this.overlay).selectAll('.visual_reference').remove();
	};
	
	window.MarksManager = MarksManager;
})();
