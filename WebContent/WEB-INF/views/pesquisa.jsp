<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<title>Pesquisa</title>
</head>


<body>
<div class="bg-dark container-fluid" style="min-height: 100vh;" >
<nav class="navbar navbar-dark bg-dark">
  <a class="navbar-brand">Bem Vindo, <%=(String)session.getAttribute("username")%></a>
  <form class="form-inline" action="Pesquisa" method='post'>
    <input class="form-control mr-sm-2" type="search" placeholder="Search" name="pesquisa">
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
  </form>
</nav>
<div style="margin-top:10px"></div>

<form action="Cria" method='get'>
		<button type='submit' class="btn btn-secondary btn-block" > Nova Nota </button>
</form>

<div style="margin-top:20px"></div>



<div class="card-columns" >
	<c:forEach var='note' items="${results }">
	<div class="card" style="padding:0.5rem;">
	<c:if test="${note.title != null }">
	<h5 class="card-title">${note.title}</h5>
	</c:if>
	<p class="card-text">${note.texto}</p>
<p><small class="text-muted">${note.date} 
	<c:if test="${not empty note.categoria}">- ${note.categoria} 
	</c:if>- by ${note.user} </small></p>	<div class="container"><div class="well">	 
	<form action="Deleta" method='post' style="display: table-cell; padding-left:0.5rem; padding-rigt:0.5rem;">
		<input type="hidden" name='id' value='${note.id}'>
		<button type='submit' class="btn btn-secondary btn-sm"> Del </button>
	</form>
	<form action="Update" method='get' style="display: table-cell; padding-left:0.5rem; padding-rigt:0.5rem;">
		<input type="hidden" name='id' value='${note.id}'>
		<input type="hidden" name='title' value='${note.title}'>
		<input type="hidden" name='texto' value='${note.texto}'>
		<input type="hidden" name='categoria' value='${note.categoria}'>
		<input type="hidden" name='data' value='${note.date}'>
		<input type="hidden" name='user' value='${note.user}'>
		<button type='submit' class="btn btn-secondary btn-sm"> Edit </button>
	</form></div></div>
	</div>
	</c:forEach>
</div>
</div>
</body>
</html>