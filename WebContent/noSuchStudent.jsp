 <!-- 
Author: Rashika Koul
SWE 642 : Homework 4
No such student ack. page
 -->
 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title> CS Department Survey </title>
<meta charset="utf-8" />
<link rel="stylesheet" type="text/css" href="style.css">
<link type="text/css" rel="stylesheet" href="jquery-ui.css">
</head>
<body>
	<h1>CS Department Survey</h1>
	<div class="conatiner">
    	<section id="no-student">
    	Student not found!
        </section>
        <section id="index-link">
        Click <a href="survey.jsp">here</a> to fill out another survey. 
        </section>
    </div>
	<div class="author">Rashika Koul</div>
	<a href="https://www2.gmu.edu" class="logo" title="Please visit <a href='http://www.gmu.edu'>http://www.gmu.edu</a> for more information." href="https://www2.gmu.edu/"><img src="GMU_logo.png" alt="GMU"></a>
</body>
<script src="jquery.js"></script>
<script src="jquery-ui.js"></script>
<script>
    $(".logo").tooltip({
        content: function () {
            return $(this).prop('title');
        }
    });
</script>
</html>