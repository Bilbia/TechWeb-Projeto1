<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, java.sql.Date, java.util.Calendar, javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<title>Nova Nota</title>
</head>


<body>
<div class="bg-dark vh-100 container-fluid" >
<h2 class="text-light" style="padding: 0.5rem;"> Nova Nota </h2>
<div style="margin-top:20px"></div>


<form action='Cria' method='post' style="margin: 0.5rem;">
	<input type='text' placeholder='Título' name='title' class="form-control"><br>
	<input type='text' placeholder='Texto' name='texto' class="form-control"><br>
	<input type='text' placeholder='Categoria' name='categoria' class="form-control"><br>
	<% Date data = new Date(Calendar.getInstance().getTime().getTime()); %>
	<input type='hidden' name='data' value='<%= data %>'>
	<%  String username = (String)session.getAttribute("username"); %>
	<input type='hidden' name='user' value='<%= username %>'>
	<button type="submit" class="btn btn-secondary">Criar</button>
</form>
</div>
</body>
</html>