<!-- prepareData.php
  Flush data from ZuulWeb DB into JSON files for easy parsing by D3
-->

<?php

  class prepareData {
    function connectdb() {
      define ('DB_USER', 'whopper');
      define ('DB_PASSWORD', 'pass');
      define ('DB_HOST', 'localhost');
      define ('DB_NAME', 'zuul');
      $dbc = @mysql_connect (DB_HOST, DB_USER, DB_PASSWORD) or die('Failure: ' . mysql_error() );
      mysql_select_db(DB_NAME) or die ('Could not select database: ' . mysql_error() );
    }

    function itemPoptoJSON() {
      $extractQuery   = 'SELECT itemname, purchased FROM inventory ORDER BY purchased desc';
      $extractQuerydo = mysql_query($extractQuery);

      if (! $extractQuery ) {
        echo mysql_error();
        die;
      }

      $data = array();
      for ($x = 0; $x < mysql_num_rows($extractQuerydo); $x++) {
        $data[] = mysql_fetch_assoc($extractQuerydo);
      }

      return json_encode($data);
      mysql_close($dbc);
    }
  }
?>
