<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.lab9.beans.trabajadores" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="lista" scope="request" type="ArrayList<trabajadores>" />


<html>
  <head>
    <title>Trabajadores</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">
  </head>
<body>
  <div class="container">
    <div class="clearfix mt-3 mt-2">
      <a href="<%=request.getContextPath()%>/biciServlet">
        <h1 class="float-start link-dark">Lista de trabajadores en Bicicentro</h1>
      </a>
      <a class="btn btn-primary float-end mt-1" href="<%=request.getContextPath() %>/biciServlet?action=new">Crear trabajador</a>
    </div>
    <hr/>
    <table class="table table-striped mt-3">
      <tr class="table-primary">
        <th>Nombre</th>
        <th>Apellido</th>
        <th>Correo</th>
        <th>DNI</th>
        <th></th>
        <th></th>
      </tr>
      <% for (trabajadores trabajadores : lista) { %>
      <tr>
        <td><%=trabajadores.getNombres()%>
        </td>
        <td><%=trabajadores.getApellidos()%>
        </td>
        <td><%=trabajadores.getCorreo()%>
        </td>
        <td><%=trabajadores.getDni()%>
        </td>
        <td><a class="btn btn-success" href="<%=request.getContextPath()%>/biciServlet?action=edit&id=<%= trabajadores.getDni() %>"> </a>Editar</td>
        <td><a onclick="return confirm('¿Esta seguro de borrar?')" class="btn btn-danger" href="<%=request.getContextPath()%>/biciServlet?action=del&id=<%= trabajadores.getDni() %>">Borrar</a></td>
      </tr>
      <% } %>
    </table>
  </div>
</body>
</html>
