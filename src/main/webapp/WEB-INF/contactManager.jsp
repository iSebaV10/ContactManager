<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta >
<title>Contact Manager</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
<h1>Mantenedor de contactos </h1>
	<form:form action="/contactManager/addContact"
		class="fluid-container my-3 mx-1 border border-dark"
		method="post" modelAttribute="usuario">
		<div class="row  g-3 align-items-center p-1">
			<div class="col">
				<label class="visually-hidden" for="nombre">Nombre</label>
				<div class="input-group border border-dark">
					<div class="input-group-text">Nombre</div>
					<input type="text" class="form-control" id="nombre"
						 name="nombre" value="<c:out value="${selectContact.getNombre()}"></c:out> "> 
				</div>
			</div>
			<div class="col">
				<label class="visually-hidden" for="apellidoPaterno">Apellido
					paterno</label>
				<div class="input-group border border-dark">
					<div class="input-group-text">Apellido paterno</div>
					<input type="text" class="form-control" id="apellidoPaterno"
						 name="apellidoPaterno" value="<c:out value="${selectContact.getApellidoPaterno()}"></c:out> ">
				</div>
			</div>
			<div class="col">
				<label class="visually-hidden" for="apellidoMaterno">Apellido
					materno</label>
				<div class="input-group border border-dark">
					<div class="input-group-text">Apellido materno</div>
					<input type="text" class="form-control" id="apellidoMaterno"
						 name="apellidoMaterno" value="<c:out value="${selectContact.getApellidoMaterno()}"></c:out> ">
				</div>
			</div>
		</div>

		<div class="row g-3 align-items-center p-1 ">
			<div class="col-8">
				<label class="visually-hidden" for="direccion">Dirección</label>
				<div class="input-group border border-dark">
					<div class="input-group-text">Dirección</div>
					<input type="text" class="form-control" id="direccion"
						 name="direccion" value="<c:out value="${selectContact.getDireccion()}"></c:out> ">
				</div>
			</div>
			<div class="col-4">
				<label class="visually-hidden border border-dark" for="telefono">Telefono</label>
				<div class="input-group border border-dark">
					<div class="input-group-text">Teléfono</div>
					<input type="text" class="form-control" id="telefono"
						 name="telefono" value="<c:out value="${selectContact.getTelefono()}"></c:out> ">
				</div>
			</div>
		</div>

		<div class="row g3 align-items-start p-1 ">
			<div class="col-4 ">
				<button type="submit" class="btn border border-dark">Agregar</button>
				<span> <a href="/contactManager/deleteContact?id=${selectContact.getId()}"><button type="button" class="btn border border-dark">Eliminar</button></a></span>
			</div>
		</div>
	</form:form>

<h2>Lista de contactos</h2>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Nombre</th>
				<th scope="col">Apellido Paterno</th>
				<th scope="col">Apellido Materno</th>
				<th scope="col">Direccion</th>
				<th scope="col">Teléfono</th>
			</tr>
		</thead>
		<tbody>
		 <c:forEach var="contact" items="${contacts}" >
			<tr>
			
				<td> <a href="/contactManager/selectContact?id=${contact.getId()}"><c:out value="${contact.getId()}"></c:out> </a> </td>
				<td> <c:out value="${contact.getNombre()}"></c:out> </td>
				<td> <c:out value="${contact.getApellidoPaterno()}"></c:out></td>
				<td><c:out value="${contact.getApellidoMaterno()}"></c:out></td>
				<td> <c:out value="${contact.getDireccion()}"></c:out></td>
				<td><c:out value="${contact.getTelefono()}"></c:out></td>
			</tr>
		 </c:forEach>
		</tbody>
	</table>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>