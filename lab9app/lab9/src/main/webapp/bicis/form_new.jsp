<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous">
      <title>Crear un nuevo trabajador</title>
    </head>
    <body>
        <div class="container">
          <h1 class="mb-3">Crear un nuevo trabajador</h1>


          <form method="post" action="<%=request.getContextPath()%>/biciServlet">
            <div class="mb-3">
              <label>Nombre</label>
              <input type="text" class="form-control" name="nombre">
            </div>
            <div class="mb-3">
              <label>Nombre</label>
              <input type="text" class="form-control" name="nombre">
            </div>
            <div class="mb-3">
              <label>Nombre</label>
              <input type="text" class="form-control" name="nombre">
            </div>
            <div class="mb-3">
              <label>Nombre</label>
              <input type="text" class="form-control" name="nombre">
            </div>
            <div class="mb-3">
              <label>Nombre</label>
              <input type="text" class="form-control" name="nombre">
            </div>



          </form>











        </div>
    </body>
</html>
