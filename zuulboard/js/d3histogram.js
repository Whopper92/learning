function createHistogram() {
  var dataset; // global var to hold dataset once loaded

  d3.json('data/deb_builds.json', function(json) {
    dataset = json; // Make loaded data accessible later on
    drawHisto(dataset);         // Function 3: A histogram for last 10 builds
  });
}

function drawHisto(dataset) {
  var w        = 650;
  var h        = 300;
  var yPadding = 15;
  var xPadding = 40;

  var xScale = d3.scale.ordinal()
            .domain(d3.range(dataset.deb_builds.length))
            .rangeRoundBands([0, w - xPadding], 0.05);

  var yScale = d3.scale.linear()
            .domain([0, d3.max(dataset.deb_builds, function(d)
              { return parseInt(d.buildtime); })])
            .range([h - yPadding, yPadding]);

  // Create the SVG canvas
  var svg = d3.select('body')
            .append('svg')
            .attr({ width: w, height: h });

  // Create the bars
  svg.selectAll('rect')
    .data(dataset.deb_builds)
    .enter()
    .append('rect')
    .attr('class', 'histoBar')
    .attr('x', function(d, i) {
      return xScale(i) + xPadding;
    })
    .attr('y', function(d) {
      return yScale(d.buildtime) - (yPadding);
    })
    .attr('width', xScale.rangeBand())
    .attr('height', function(d) {
      return h - yScale(d.buildtime);
    })
    .attr('fill', function(d) {
      if ( d.success == false ) {
        return 'red';
      } else {
        return 'cornflowerblue';
      }
    })
    .attr('fill-opacity', '0.6')
    .on('click', function(d) {
      var tooltipID = '#dataDisplay';
      displayData(tooltipID, d.builder, d.buildnum, d.package, d.buildtime, d.success, d.builderror);
    })
    .on('mouseover', function(d) {
      var tooltipID = '#tooltip';
      var xPosition = parseFloat(d3.select(this).attr('x')) - 60;
      var yPosition = parseFloat(d3.select(this).attr('y'));

      displayTooltip(tooltipID, xPosition, yPosition, d.package, d.buildtime);

      d3.select(this)
        .transition()
        .duration(250)
        .attr('fill-opacity', '1');
    })
    .on('mouseout', function(d) {
      var tooltipID = '#tooltip';

      hideTooltip(tooltipID);

      d3.select(this)
        .transition()
        .duration(250)
        .attr('fill-opacity', '0.6');
    });

  // Create the labels
  svg.selectAll('text')
      .data(dataset.deb_builds)
      .enter()
      .append('text')
      .text(function (d) {
        return d.package;
      })
      .attr('text-anchor', 'middle')
      .attr('x', function(d, i) {
        return xScale(i) + xScale.rangeBand() + (xPadding/3)
      })
      .attr('y', function(d) {
        return 298;
      })
      .attr('font-family', 'sans-serif')
      .attr('font-size', '10px')
      .attr('fill', 'black');


  // Create the Axes
  var xAxis = d3.svg.axis()
                .scale(xScale)
                .orient('bottom');

  svg.append('g')
      .attr('class', ' x axis xhistoAxis')
      .attr('transform', 'translate(' + xPadding + ',' + (h - yPadding) + ')')
      .call(xAxis)

  var yAxis = d3.svg.axis()
                .scale(yScale)
                .orient('left');
  svg.append('g')
      .attr('class', 'y axis')
      .attr('transform', 'translate(' + xPadding + ', -10)')
      .call(yAxis)


  // Listen for update request
  d3.select('#update')
    .on('click', function() {
      d3.json('data/deb_builds.json', function(json) {
        datasetNew = json;

        // Update Scales and Axes
        yScale.domain([0, d3.max(datasetNew.deb_builds, function(d)
               { return parseInt(d.buildtime); })]);

        svg.select('.x.axis')
          .transition()
          .duration(1000)
          .call(xAxis);

        svg.select('.y.axis')
          .transition()
          .duration(1000)
          .call(yAxis);

        svg.selectAll('rect')
          .data(datasetNew.deb_builds)
          .transition()
          .delay(function(d, i) {
            return i * 100;
          })
          .duration(1000)
          .attr('y', function(d) {
            return yScale(d.buildtime) - (yPadding);
          })
          .attr('height', function(d) {
            return h - yScale(d.buildtime);
          })
          .attr('fill', function(d) {
            if ( d.success == false ) {
               return 'red';
            } else {
               return 'cornflowerblue';
            }
          });

        svg.selectAll('text')
          .data(datasetNew.deb_builds)
          .transition()
          .delay(function(d, i) {
            return i * 100;
          })
          .duration(1000)
          .text(function(d) {
            return d.package;
          })
          .attr('x', function(d, i) {
            return xScale(i) + xScale.rangeBand() + (xPadding/3)
          })
          .attr('y', function(d) {
            return 298;
          });
    });
  });
}

function displayTooltip(tooltipID, xPosition, yPosition, package, buildtime) {

  d3.select(tooltipID)
    .style('left', xPosition + 'px')
    .style('top', yPosition + 'px')
    .select('#value')
    .text(package + ': ' + buildtime + ' seconds');

  d3.select(tooltipID).classed('hidden', false);
}

function hideTooltip(tooltipID) {

  d3.select(tooltipID).classed('hidden', true);
}

function displayData(tooltipID, builder, buildnum, package, buildtime, success, builderror) {

  // Pop up a modal displaying all data for this bar
  d3.select(tooltipID)
    .select('#package')
    .style('margin-left','30px')
    .style('font-weight','bold')
    .style('font-size','24px')
    .text(package);

  d3.select(tooltipID).select('#builder').html('<strong>Builder:</strong>&#160;&#160;&#160;&#160;&#160;&#160;&#160&#160&#160;&#160;' + builder);
  d3.select(tooltipID).select('#buildtime').html('<Strong>Build Time:</strong>&#160;&#160;&#160;' + buildtime + ' Seconds');
  d3.select(tooltipID).select('#success')
    .style('font-size', '12px')
    .style('color', function(d) {
      if (success == true) {
        return 'green';
      } else {
        return 'red';
      }
    })
    .html(function(d) {
      if (success == true) {
        return 'This build completed successfully.'
      } else {
        return 'This build failed! Error log:<br><br>' + builderror;
      }
    });


  d3.select('body').style('pointer-events', 'none');
  d3.select(tooltipID).classed('hidden', false);
  d3.select('#exitButton')
    .classed('hidden', false)
    .style('pointer-events', 'auto')
    .on('click', function() {
      d3.select('body').style('pointer-events', 'auto');
      d3.select('#exitButton').style('pointer-events', 'none');
      d3.select(tooltipID).classed('hidden', true);
    });
}
