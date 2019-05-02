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
<link rel="stylesheet" type="text/css" href="style.css">
<link type="text/css" rel="stylesheet" href="jquery-ui.css">
<style type= "text/css">
         h3
		 {
		   text-align: center;
		   color: navy;
		 }
		 div.img
         {
         	display: block;
         	margin-left: auto;
            margin-right: auto;
            text-align: center;
         }
         img.withAttributes
         {
            height: 150px;
            width:112px;
          display: block;
          margin-left: auto;
            margin-right: auto;
         }
</style>
</head>
<body> 
 <h3> 
   Rashika Koul <br>
   SWE 642 Homepage<br>
 </h3> 
 <img class="withAttributes" src="rashika.jpg" alt="Rashika Koul" /><br><br>
<br><br><br>
<div class="conatiner">
<div id="tabs">
   <ul>
   <li><a href="home.jsp">Homework 1</a></li>
   <li><a href="cs.jsp">Homework 2</a></li>
   <li><a href="survey.jsp">Homework 3</a></li>
   </ul>
</div> 
</div>  
<div class="img">
  <br><br><br><br><br><br><br><br>
<a class="logo" title="Please visit <a href='http://www.gmu.edu'>http://www.gmu.edu</a> for more information."href="https://www2.gmu.edu/"><img class = "logoimg" src="GMU_logo.png" alt="GMU Logo"/></a></div>
</body>
<script src="jquery.js"></script>
<script src="jquery-ui.js"></script>
<script>
    // $("#tabs").tabs();
    $(".logo").tooltip({
        content: function () {
            return $(this).prop('title');
        }
    });
</script>
</html>