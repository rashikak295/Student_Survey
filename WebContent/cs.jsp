<!-- 
Author: Rashika Koul
SWE 642 : Homework 4
Department of Computer Science Page
 -->
<!DOCTYPE html>
<html>
<head>
<title> index.jsp </title>
<link rel="stylesheet" type="text/css" href="style.css">
<link type="text/css" rel="stylesheet" href="jquery-ui.css">
</head>
<body>
	<h1>Department of Computer Science</h1>
	<p>
		Welcome to the website of the Computer Science Department at George Mason University! With 50 faculty members, the CS Department at Mason is the largest department in the Volgenau School of Engineering, one of the largest departments on campus, and one of the largest CS departments in the Commonwealth of Virginia.  
	</p>
	<p>
		The department offers two Bachelor of Science programs:  the B.S. in Computer Science and the inter-disciplinary B.S. in Applied Computer Science; four M.S. programs in Computer Science, Information Systems, Information Security and Assurance, and Software Engineering; and a Ph.D. program in Computer Science. 
	</p>
	<h3 class="heading_link">List of MS Degrees:</h3>
	<ul>
		<li>Computer Science</li>
		<ul>
			<li>CS 583 Analysis of Algorithms (from the Theoretical Computer Science area) and two additional core courses from two other areas must be completed with a grade of atleast B-.</li>
			<li>At least four courses (12 credits) must be chosen from the advanced courses in the list of preapproved courses from at least three different areas.</li>
			<li>At least six courses, including two advanced courses, must be designated CS.</li>
			<li>At least eight courses must be taken from the list of preapproved courses. Up to two computer science-related courses that are not on the list of preapproved courses may be taken.</li>
		</ul>
		<li>Information Systems</li>
		<ul>
			<li>INFS 612   Principles and Practices of Communication Networks</li>
			<li>CS 550   Database Systems</li>
			<li>INFS 622   Information Systems Analysis and Design</li>
			<li>ISA 562     Information Security Theory and Practice</li>
		</ul>
		<li>Information Security and Assurance</li>
		<ul>
			<li>ISA 562 Information Security Theory and Practice</li>
			<li>ISA 656 Network Security</li>
			<li>INFS 612 Principles and Practice of Communication Networks OR CS 555 - Computer Communications and Networking</li>
		</ul>
		<li>Software Engineering</li>
		<ul>
			<li>SWE 619   Object-Oriented Software Specification and Construction</li>
			<li>SWE 621   Software Modeling and Architectural Design</li>
			<li>SWE 632   User Interface Design and Development</li>
			<li>SWE 637   Software Testing</li>
		</ul>
	</ul>
	<a class="heading_link" href="survey.jsp">CS Department Survey page</a>
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