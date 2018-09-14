<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
	<title>Save Customer</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>

<body>

<div class="container">
<div class="jumbotron">
<h3>Please enter the details</h3>
  <form:form action="saveCustomer" modelAttribute="student" method="POST">
  <form:hidden path="id" />
    <div class="form-group row">
      <label for="firstName" class="col-sm-2 col-form-label">First Name*</label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control" id="firstName" path="firstName" required="required"/>
        
      </div>
    </div>
   <div class="form-group row">
      <label for="lastName" class="col-sm-2 col-form-label">Last Name*</label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control" id="lastName" path="lastName" required="required" />
      </div>
    </div>
     <div class="form-group row">
      <label for="email" class="col-sm-2 col-form-label">Email*</label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control" id="email" path="email" required="required"/>
      </div>
    </div>
    
    
    <div class="form-group row">
      <div class="offset-sm-2 col-sm-10">
        <button type="submit" value="Save" class="save btn btn-primary">Save</button>
      </div>
    </div>
  </form:form>
  <p>
			<a href="${pageContext.request.contextPath}">Back to List</a>
		</p>
	
</div>
</div>
	
	

	
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>

</html>










