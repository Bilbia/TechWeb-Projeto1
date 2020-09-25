<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<title>Notas</title>
</head>


<body>
<jsp:useBean id="dao" class="mvc.model.DAO"/>

<div class="bg-dark container-fluid">
<h2 class=text-light style="padding:1rem;"> Bem Vindo, <%=(String)session.getAttribute("username")%></h2>

<form action="Cria" method='get'>
		<button type='submit' class="btn btn-secondary btn-block" > Nova Nota </button>
</form>

<div style="margin-top:20px"></div>


<div class="card-columns" >
	<c:forEach var='note' items="${notes }">
	<div class="card" style="padding:0.5rem;">
	<c:if test="${note.title != null }">
	<h5 class="card-title">${note.title}</h5>
	</c:if>
	<p class="card-text">${note.texto}</p>
	<p class="card-text"><small class="text-muted">${note.date}	- by ${note.user}</small></p>
	<div class="container"><div class="well">	 
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