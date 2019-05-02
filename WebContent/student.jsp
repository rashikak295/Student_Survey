<!-- 
Author: Rashika Koul
SWE 642 : Homework 4
Student retrieved data 
 -->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@ page import="survey.StudentBean" %>
<!DOCTYPE html>
<html>
<head>
<title> CS Department Survey </title>
<meta charset="utf-8" />
<link rel="stylesheet" type="text/css" href="style.css">
<link type="text/css" rel="stylesheet" href="jquery-ui.css">
<style>
td{height:70px}
</style>
</head>
<body>
	<h1>CS Department Survey</h1>
	<div class="container" align="center">
	<section id="index-link">
        Click <a href="survey.jsp">here</a> to fill out another survey. 
    </section>
    <section id="survey">
    <%StudentBean sb = (StudentBean) session.getAttribute("studentBean");%>
	<form>
	<table cellspacing="4">
		<tr><td><font color="red">*</font>Username:<br><%=sb.getUserName()%></td>
		<td><font color="red">*</font>Street Address:<br><%=sb.getAddress()%></td>
		<td><font color="red">*</font>Zip code:<br><%=sb.getZipcode()%></td></tr>
		<tr><td>City:<br><%=sb.getCity()%></td>
		<td>State:<br><%=sb.getState()%></td>
		<td>Telephone number:<br><%=sb.getPhone()==null?"--":sb.getPhone()%></td></tr>
		<tr><td><font color="red">*</font>E-mail:<br><%=sb.getEmail()%></td>
		<td>URL:<br><%=sb.getURL()==null?"--":sb.getURL()%></td>
		<td><font color="red">*</font>Date of Survey:<br><%=sb.getSurveyDate()%></td></tr>
		<tr><td><font color="red">*</font>What do you like the most <br>about the campus?
		<br><%=sb.getLikes()%></td>
		<td><font color="red">*</font>How did you become <br>interested in the university?
		<br><%=sb.getInterest()%></td>
		<td>Additional comments:<br><%=sb.getComments()==null?"--":sb.getComments()%></td></tr>
		<tr><td>High school graduation <br>month:<br> 
		<%=sb.getGradMonth() == null ? "--" : sb.getGradMonth()%></td> 
		<td>High school graduation <br>year:<br><%=sb.getGradYear() == null ? "--" : sb.getGradYear()%></td> 
		<td>How likely are you to<br> recommend GMU?<br><%=sb.getRecommend()==null?"--":sb.getRecommend()%></td></tr>
		<tr>
			<td></td>
		<td><font color="red">*</font>Student ID:<br><%=sb.getStudentID()%><!--<label>Average:<br></label><label id="average"></label>!--></td>
		<!--<label>Maximum:<br></label><label id="maximum"></label>!-->
			<td></td>		
		</tr>
	</table>
	</form>
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