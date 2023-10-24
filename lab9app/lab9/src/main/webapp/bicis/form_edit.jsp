<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="trabajadores" type="com.example.lab9.beans.trabajadores" scope="request" />
<!DOCTYPE html>
<html>
    <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous">
      <title>Editar un trabajador</title>
    </head>
    <body>
        <div class='container'>
          <h1 class='mb-3'>Editar un trabajo</h1>
          <form method="post" action="<%=request.getContextPath()%>/biciServlet?action=e">
            <div class="mb-3">
              <label>Nombres</label>
              <input type="text" class="form-control" name="nombres" value="<%=trabajadores.getNombres()%>">
            </div>
            <div class="mb-3">
              <label>Apellidos</label>
              <input type="text" class="form-control" name="apellidos" value="<%=trabajadores.getApellidos()%>">
            </div>
            <div class="mb-3">
              <label>Correo</label>
              <input type="text" class="form-control" name="correo" value="<%=trabajadores.getCorreo()%>">
            </div>
            <div class="mb-3">
              <label>DNI</label>
              <input type="text" class="form-control" name="DNI" value="<%=trabajadores.getDni()%>">
            </div>
            <div class="mb-3">
              <label>id Sede</label>
              <input type="text" class="form-control" name="idsede" value="<%=trabajadores.getIdsede()%>">
            </div>
            <a href="<%=request.getContextPath()%>/biciServlet" class="btn btn-danger">Regresar</a>
            <button type="submit" class="btn btn-primary">Submit</button>
          </form>
        </div>
    </body>
</html>
