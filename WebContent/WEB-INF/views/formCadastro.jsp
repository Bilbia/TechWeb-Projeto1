<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	
<title>Cadastro</title>
</head>
<body>
<div class="bg-dark vh-100 container-fluid">
<h2 class="text-light" style="padding:0.5rem;">Cadastre um usuário</h2>
<div style="margin-top:20px"></div>
<form action="Cadastro" method='post'>
<input type='text' placeholder='Enter Username' name='username' class="form-control"><br>
<input type='password' placeholder='Enter Password' name='password' class="form-control"><br>
<button type="submit" class="btn btn-secondary">Cadastre</button>
</form>

</div>
</body>
</html>