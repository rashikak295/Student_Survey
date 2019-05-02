<!-- 
Author: Rashika Koul
SWE 642 : Homework 4
CS Department survey page
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
	<em><a href="cs.jsp" class="heading_link">Back</a></em> | <em id="greeting"></em>
	<div id = 'dialog' title='Message'></div>
	<div class="form" align="center"><br>
	<form autocomplete="on" method="post" action="StudentServlet"
            onsubmit="return validateForm();" onreset="resetForm();">
	<table cellspacing="4">
		<tr><td><font color="red">*</font>Username:<br><input type="text" id="username" name="username" autocomplete="on" required autofocus></td>
		<td><font color="red">*</font>Street Address:<br><input type="text" id="address" name="address" autocomplete="on" required></td>
		<td><font color="red">*</font>Zip code:<br> <input type="number" pattern="^\d{5}(?:[-\s]\d{4})?$" onblur="validateZip(this.value);" id="zipcode" name="zipcode" autocomplete="on" placeholder="" required><br><font color="red"><label id="zipcode-error" class="error"></label></font></td></tr>
		<tr><td>City:<br> <input type="text" id="city" name="city" value="" readonly></td>
		<td>State:<br> <input type="text" id="state" name="state" value="" readonly></td>
		<td>Telephone number:<br> <input type="tel" name="telephone" id="telephone" autocomplete="on" placeholder=""></td></tr>
		<tr><td><font color="red">*</font>E-mail:<br> <input type="email" id="email" name="email" autocomplete="on" placeholder="username@host.com" required></td>
		<td>URL:<br> <input type="url" name="url" placeholder="www.website.domain" autocomplete="on"></td>
		<td><font color="red">*</font>Date of Survey:<br> <input id="surveyDate" type="date" name="surveyDate" autocomplete="on" placeholder="" required></td></tr>
		<tr><td><font color="red">*</font>What do you like the most <br>about the campus?
		<br><input type="checkbox" value="students" name="likes" >students
		<input type="checkbox" value="location" name="likes" >location<br>
		<input type="checkbox" value="campus" name="likes" >campus
		<input type="checkbox" value="atmosphere" name="likes" >atmosphere<br>
		<input type="checkbox" value="dorm" name="likes" >dorm rooms
		<input type="checkbox" value="sports" name="likes" >sports</td>
		<td><font color="red">*</font>How did you become <br>interested in the university?
		<br><input type="radio" name="interest" value="friends" required>friends
		<input type="radio" name="interest" value="television" required>television<br>
		<input type="radio" name="interest" value="internet" required>internet
		<input type="radio" name="interest" value="other" required>other</td>
		<td>Additional comments:<br><textarea id="comments" rows="4" cols="18" name="comments" autocomplete="on"></textarea></td></tr>
		<tr><td>High school graduation <br>month:<br> 
		<input list="months" id="grad_month" name="grad_month">
		<datalist id="months">
			<option value="January">
			<option value="February">
			<option value="March">
			<option value="April">
			<option value="May">
			<option value="June">
			<option value="July">
			<option value="August">
			<option value="September">
			<option value="October">
			<option value="November">
			<option value="December">
		</datalist></td> 
		<td>High school graduation <br>year:<br> <input type="number" id="grad_year" name="grad_year" placeholder="yyyy" autocomplete="on" min="1900" max="2100"></td> 
		<td>How likely are you to<br> recommend GMU?<br><select id="recommend" name="recommend">
			<option value="">--Select--</option>
			<option value="0">Very Likely</option>
			<option value="1">Likely</option>
			<option value="2">Unlikely</option>
		</select></td></tr>
		<tr>
			<td><font color="red">*</font>Data:<br>
			<input id="data" name="data" type="text" onblur="calc(this.value);" placeholder="1,2,3,4,5,6,7,8,9,10" required/>
			<br/><font color="red"><label id="data-error" class="error"></label></font>
			</td>
		<td><font color="red">*</font>Student ID:<br><input type="text" id="studentID" name="studentID" required><!--<label>Average:<br></label><label id="average"></label>!--></td>
		<!--<label>Maximum:<br></label><label id="maximum"></label>!-->
			<td><input type="reset" value="reset" align="center" /><input type="submit" value="submit" name="submit" onclick="validateForm(event);" align="center"></td>		
		</tr>
	</table>
	</form>
	</div>
	<div class="author">Rashika Koul</div>
	<a href="https://www2.gmu.edu" class="logo" title="Please visit <a href='http://www.gmu.edu'>http://www.gmu.edu</a> for more information." href="https://www2.gmu.edu/"><img src="GMU_logo.png" alt="GMU"></a>
</body>
<script src="scripts.js"></script>
<script type="text/javascript">
    greet();
</script>
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