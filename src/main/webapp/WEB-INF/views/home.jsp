<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  test
</h1>

<P>  The time on the server is ${serverTime}. </P>
	<form method="post">
	<div class="mb-3 mt-3">
		<label for="id" class="form-label">ID</label> 
		<input type="text" value="${member.memberId}" class="form-control" id="id" placeholder="Enter id" name="id">
	</div>
	<div class="mb-3">
		<label for="pwd" class="form-label">Password</label> 
		<input type="password" value="${member.memberPw}"class="form-control" id="pwd" placeholder="Enter password" name="pw">
	</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</body>
</html>
