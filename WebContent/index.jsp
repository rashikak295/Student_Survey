<!-- 
Author: Rashika Koul
SWE 642 : Homework 4
Homepage
 -->
<!DOCTYPE html>
<html>
<head>
<title> index.jsp </title>
<meta charset="utf-8" />
<link type="text/css" rel="stylesheet" href="jquery-ui.css">
</head>
<body> 
<div class="conatiner">
<div id="tabs">
   <ul>
   <li><a href="home.jsp">Homework 1</a></li>
   <li><a href="cs.jsp">Homework 2</a></li>
   <li><a href="survey.jsp">Homework 3</a></li>
   </ul>
</div> 
</div>  
</body>
<script src="jquery.js"></script>
<script src="jquery-ui.js"></script>
<script>
    $("#tabs").tabs();
</script>
</html>