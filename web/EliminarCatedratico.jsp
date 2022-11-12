<%-- 
    Document   : EliminarCatedratico
    Created on : 11/11/2022, 09:40:33
    Author     : GERARD
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Catedratico</title>
    </head>
    <body>
      
        <%
            //conectando a base de datos
            Connection conexion=null;
            String url="jdbc:mysql://localhost:3306/rapidito";//url de MySQL
            String usuario="root";// usuario de mysql local
            String clave="Umg$2019"; 
           
            
             Class.forName("com.mysql.jdbc.Driver");
             conexion=DriverManager.getConnection( url, usuario,clave);
             
             //listado de la tabla pero de la fila seleccionada
             
             PreparedStatement ps;
             
             
             int id=Integer.parseInt(request.getParameter("id")); 
             
             ps=conexion.prepareStatement("delete  from catedratico where numero_carne="+id);
             ps.executeUpdate();
             response.sendRedirect("VerCatedratico.jsp");
             

             
             
            
          
            %>
        
         
        
    </body>
</html>
