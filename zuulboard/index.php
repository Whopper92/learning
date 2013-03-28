<?php
  require '/home/whopper/dev-whopper/zuulboard/lib/prepareData.php';

  $dbConnection = new prepareData();
  $dbConnection->connectdb();
  $pop_data  = $dbConnection->itemPoptoJSON();
?>

<!DOCTYPE HTML>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="style/itempop.css" />
    <script type="text/javascript" src="js/itempop.js"></script>
    <meta charset="utf-8">
    <script type="text/javascript" src="d3/d3.v3.js"></script>
    <title>ZuulBoard</title>
  </head>
  <body>

    <div id='MainContainer'>
      <div id='itemPopContainer'>
          <!-- title -->
          <p id='itemPopTitle'>All Time Item Popularity</p>
          <hr id='itemPopTitleBar'>
          <!-- Create Item Popularity Histogram -->
          <script type='text/javascript'>
            var pop_item_data = <?php echo $pop_data; ?>;
            //console.log(pop_item_data);
            createItemPopHistogram(pop_item_data)
          </script>

          <!-- Create hover tooltip for bars -->
          <div id='itemPopToolTip' class='hidden tooltip'>
            <p><strong><span id='itemPopToolTipTitle'</span></strong></p>
          </div>
      </div>
    </div>
  </body>
</html>
