<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Details</title>
</head>
<body class="container">
	<div class="jumbotron">
	<h1 class="text-center" style="margin-bottom: 20px">Student Record Management System</h1>
	 <div class="row">
    <div class="col-lg-4 text-center">
      <button type="button" class="btn btn-primary" onclick="window.location.href='showFormForAdd'; return false;">New Student</button>
    </div>
    <div class="col-lg-8 text-center">
      
      <form:form action="search" method="POST" >
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-3 col-form-label">Search Student</label>
    <div class="col-sm-5">
      <input type="text" name="theSearchName" class="form-control" placeholder="Student Name"  required>
    </div>
    <div class="col-sm-3">
      <button type="submit" value="Search" class="btn btn-primary add-button">Search</button>
    </div>
  </div>
      </form:form>
      
      
      
      
    </div>
    </div>

	
    <table class="table table-hover">
    <thead class="thead-dark">
            <tr>
<th>First Name</th>
<th>LastName</th>
<th>Email</th>
<th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="users" items="${users}" >

<!-- construct an "update" link with customer id -->
					<c:url var="updateLink" value="/showFormForUpdate">
						<c:param name="studentId" value="${users.id}" />
					</c:url>					

					<!-- construct an "delete" link with customer id -->
					<c:url var="deleteLink" value="/delete">
						<c:param name="studentId" value="${users.id}" />
					</c:url>	
					
                <tr>
<td>${users.firstName}</td>
<td>${users.lastName}</td>
<td>${users.email}</td>
                              <td>
							<!-- display the update link -->
							<a href="${updateLink}">Update</a>
							|
							<a href="${deleteLink}"
							   onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
						</td>    
                </tr>
            </c:forEach> 
        </tbody>
    </table> 
</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
