<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<title>Student Page</title>
<head>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.1/themes/mint-choc/jquery-ui.css" />
	
    <style>
@import url(http://fonts.googleapis.com/css?family=Exo:100,200,400);
@import url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);

body{
	margin: 0;
	padding: 0;
	background: #fff;

	color: #fff;
	font-family: Arial;
	font-size: 12px;
}

.body{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background-image: url(http://ginva.com/wp-content/uploads/2012/07/city-skyline-wallpapers-008.jpg);
	background-size: cover;
	-webkit-filter: blur(5px);
	z-index: 0;
}

.grad{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(100%,rgba(0,0,0,0.65))); /* Chrome,Safari4+ */
	z-index: 1;
	opacity: 0.7;
}

.header{
	position: absolute;
	top: calc(50% - 35px);
	left: calc(50% - 255px);
	z-index: 2;
}

.header div{
	float: left;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 35px;
	font-weight: 200;
}

.header div span{
	color: #5379fa !important;
}

.login{
	position: absolute;
	top: calc(20% - 75px);
	left: calc(20% - 150px);
	height: 150px;
	width: 350px;
	padding: 10px;
	z-index: 2;
}

.login input[type=text]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
}

.login input[type=password]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top: 10px;
}

.login input[type=submit]{
	width: 260px;
	height: 35px;
	background: #fff;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 2px;
	color: #a18d6c;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 6px;
	margin-top: 10px;
}

.login input[type=button]:hover{
	opacity: 0.8;
}

.login input[type=button]:active{
	opacity: 0.6;
}

.login input[type=text]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=password]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=button]:focus{
	outline: none;
}

::-webkit-input-placeholder{
   color: rgba(255,255,255,0.6);
}

::-moz-input-placeholder{
   color: rgba(255,255,255,0.6);
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>  
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/css/bootstrapValidator.min.css"/>
  <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/js/bootstrapValidator.min.js"> </script>
</head>
<body>
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>

<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

<script type="text/javascript">
var j = jQuery.noConflict();
j(document).ready(function(){
    j('#datepicker').datepicker();
})
</script>
<script>
$(document).ready(function() {
    $('#contactForm').bootstrapValidator({
        container: '#messages',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                validators: {
                    notEmpty: {
                        message: 'The full name is required and cannot be empty'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: 'The email address is required and cannot be empty'
                    },
                    emailAddress: {
                        message: 'The email address is not valid'
                    }
                }
            },
            mobile: {
                validators: {
                    notEmpty: {
                        message: 'mobile number is required and cannot be empty'
                    },
                    stringLength: {
                        max: 10,
                        message: 'mobile number must be 10 charecters '
                    }
                }
            },
                          
        }    
            
        
        });   
});
</script>
<h1>
	Add a Student
</h1>

 <div class="body"></div>
 <div class="grad"></div>

<div class="login">
<h1>Enter Student Details</h1>
<c:url var="addAction" value="/student/add"></c:url>

<form:form action="${addAction}" modelAttribute="student" id="contactForm">
<table>
	<c:if test="${!empty student.name}">
	<tr>
		<td>
			<form:label path="id">
				<spring:message text="ID"/>
			</form:label>
		</td>
		<td>
			<form:input path="id" readonly="true" size="8"  disabled="true" />
			<form:hidden path="id" />
		</td> 
	</tr>
	</c:if>
	<tr>
		<td>
			<form:label path="name" class="col-md-3">
				<spring:message text="Name"/>
			</form:label>
		</td>
		<td>
			<form:input path="name" class="form-control"/>
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="address">
				<spring:message text="Address"/>
			</form:label>
		</td>
		<td>
			<form:input path="address" class="form-control" />
		</td>
	</tr>
	
	<tr>
		<td>
			<form:label path="gender">
				<spring:message text="Gender"/>
			</form:label>
		</td>
		<td><form:radiobutton path="gender" value="M" />Male <form:radiobutton
					path="gender" value="F" />Female</td>	</tr>
	
		<tr>
		<td>
			<form:label path="dob">
				<spring:message text="DOB"/>
			</form:label>
		</td>
		<td>
			<form:input path="dob" id="datepicker" />
		</td>
	</tr>
	
	<tr>
		<td>
			<form:label path="email" class="col-md-3">
				<spring:message text="Email" />
			</form:label>
		</td>
		<td>
			<form:input path="email" class="form-control" />
		</td>
	</tr>
	
	<tr>
		<td>
			<form:label path="mobile" class="col-md-3">
				<spring:message text="Mobile"/>
			</form:label>
		</td>
		<td>
			<form:input path="mobile" class="form-control" />
		</td>
	</tr>
	
	<tr>
		<td>
			<form:label path="phone">
				<spring:message text="Phone"/>
			</form:label>
		</td>
		<td>
			<form:input path="phone" />
		</td>
	</tr>
	
	 <div class="form-group">
        <div class="col-md-9 col-md-offset-3">
            <div id="messages"></div>
        </div>
    </div>
	
	<tr>
		<td colspan="2">
			<c:if test="${!empty student.name}">
				<input type="submit"
					value="<spring:message text="Edit Student"/>" class="btn btn-default" />
			</c:if>
			<c:if test="${empty student.name}">
				<input type="submit"
					value="<spring:message text="Add Student"/>" class="btn btn-default"/>
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
<br>

<h3>Students List</h3>
<c:if test="${!empty listStudents}">
	<table class="tg" border="1" style=" border-color:#FFFFFF ">
	<tr bgcolor="#FA58AC">
		<th width="80">Student ID</th>
		<th width="120">Student Name</th>
		<th width="120">Address</th>
		<th width="120">Gender</th>
		<th width="120">DOB</th>
		<th width="120">Email</th>
		<th width="120">Mobile</th>
		<th width="120">Phone</th>		
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listStudents}" var="student">
		<tr bgcolor="#01DFD7">
			<td>${student.id}</td>
			<td>${student.name}</td>
			<td>${student.address}</td>
			<td>${student.gender}</td>
			<td>${student.dob}</td>
			<td>${student.email}</td>
			<td>${student.mobile}</td>
			<td>${student.phone}</td>
			<td><a href="<c:url value='/edit/${student.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/remove/${student.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</div>


 
   
   

</body>
</html>
