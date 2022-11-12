<%-- 
    Document   : VerAlumno
    Created on : 25/10/2022, 22:52:34
    Author     : GERARD
--%>




<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <title>Alumnos Registrados</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        <!--script src="web/img/logo.png"></script-->
        <style>
            *{
                margin: 0;
                padding: 0;
            }
            body{
                min-height: 100vh;
                background-image: url("img/fondo2.jpg");
                background-size: 100%;
                background-position: center center;
                background-attachment: fixed;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
        
        .
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
             
             //listado de la tabla
             
             PreparedStatement ps;
             ResultSet rs;
             ps=conexion.prepareStatement("select * from alumno");
             rs=ps.executeQuery();
             
             //creacion de tabla
             

            %>
         
        <div class="p-3 bd-highlight">
            <a class="btn btn-warning" href="home.jsp" style="float: right;">Back</a>
            <div class="container" id="container2">
                <table class="table table-striped table-hover bg-white">
                    <thead class="table-dark">
                       
                        <tr>
                            <td>Codigo</td>
                            <td>Nombre</td>
                            <td>Apellido</td>
                            <td>Dirección</td>
                            <td>Correo</td>
                            <td>Telefono</td>
                            <td>Sucursal</td>
                            <td>Grado</td>
                            <td>Nivel</td>
                            <td>Fecha</td>
                            <td>Acción</td>
                        </tr>
                     
                    </thead>
                    <tbody id="bodyTable">

                    </tbody>    
                    
                    <%
                        
                        while(rs.next()){

                    %>
                    
                    
                    <tr>
                        <td><%= rs.getInt("numero_carne") %></td>
                        <td><%= rs.getString("nombre_alumno") %></td>
                        <td><%= rs.getString("apellido_alumno") %></td>
                        <td><%= rs.getString("correo_alumno") %></td>
                        <td><%= rs.getString("direccion_alumno") %></td>
                        <td><%= rs.getString("telefono_alumno") %></td>
                        <td><%= rs.getString("sucursal_alumno") %></td>
                        <td><%= rs.getString("grado_alumno") %></td>
                        <td><%= rs.getString("nivel_alumno") %></td>
                        <td><%= rs.getString("fecha_alumno") %></td>
                        <td class="text-center"> 
                        
                           
                            <a href="Editar.jsp?id=<%= rs.getInt("numero_carne")%>" class="btn btn-warning btn-sm ">Editar</a>
                            <a href="Eliminar.jsp?id=<%= rs.getInt("numero_carne")%>" class="btn btn-danger btn-sm ">Eliminar</a>
                           
                        </td>
                    </tr>
                    <% } %>
                    
                </table>
            </div>
        </div> 
        
        
        
        
      
    </body>
    
     
    
</html>


 