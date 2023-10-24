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




  </div>

</body>
</html>
