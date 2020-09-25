<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, java.sql.Date, java.util.Calendar, javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<title>Editando</title>
</head>


<body>
<div class="bg-dark vh-100 container-fluid" >
<h2 class="text-light" style="padding: 0.5rem;"> Editando Nota </h2>
<div style="margin-top:20px"></div>

<form action='Update' method='post'>
<input type='text' name='title' value='${param.title }' class="form-control"><br>
<input type='text' name='texto' value='${param.texto }' class="form-control"><br>
<input type='text' name='categoria' value='${param.categoria }' class="form-control"><br>
<% Date data = new Date(Calendar.getInstance().getTime().getTime()); %>
<input type='hidden' name='data' value='<%= data %>'>
<%  String username = (String)session.getAttribute("username"); %>
<input type='hidden' name='user' value='<%= username %>'>
<input type="hidden" name='id' value='${param.id}'>
<button type="submit" class="btn btn-secondary">Editar</button>
</form>
</div>
</body>
</html>