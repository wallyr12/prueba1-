<%-- 
    Document   : EditarCatedratico
    Created on : 11/11/2022, 09:40:18
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Catedratico</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        
        
        
        
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
             ResultSet rs;
             
             int id=Integer.parseInt(request.getParameter("id")); 
             
             ps=conexion.prepareStatement("select * from catedratico where numero_carne="+id);
             rs=ps.executeQuery();
             
             
             while(rs.next()){
          
            %>
        
            
             <div class="container-sm ">              
            <div class="shadow-lg p-3 bg-white rounded">
        <form method="POST" id="form1" name="form" action="" >
             <div class="for m-group">                       
                        <img src="https://cdn-icons-png.flaticon.com/512/3077/3077421.png" class="rounded mx-auto d-block" width="100" alt="...">
                        <h2 class="display-8 text-center my-4"> MODIFICAR REGISTRO CATEDRATICO</h2>
                     
            
        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="codigo">Código</label>
                                    <input class="form-control" type="text" readonly="" value="<%= rs.getInt("numero_carne")%>"> 
                                    <input type="hidden" name="control" value="GUARDAR"> 
                                </div>
                                
                                <div class="col">
                                    <label for="fecha">Fecha de Registro</label>  
                                    <input class="form-control" type="date" name="fecha"  value="<%= rs.getDate("fecha_catedratico")%>" >
                                </div>
                            </div>
        </div>
                        
        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="nombre">Nombre</label>
                                    <input class="form-control" type="text" placeholder="Ingrese nombre" name="nombre"  value="<%= rs.getString("nombre_catedratico")%>">
                                </div>
                                 <div class="col">
                                    <label for="apellido">Apellido</label>
                                    <input class="form-control" type="text" placeholder="Ingrese apellido" name="apellido"  value="<%= rs.getString("apellido_catedratico")%>">
                                </div>
                            </div>
        </div>
                        
        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="correo">Correo</label>
                                    <input class="form-control" type="text" placeholder="Ingrese correo" name="correo"  value="<%= rs.getString("correo_catedratico")%>">
                                </div>
                                 <div class="col">
                                    <label for="telefono">Telefono</label>
                                    <input class="form-control" type="text" placeholder="Ingrese telefono" name="telefono"  value="<%= rs.getInt("telefono_catedratico")%>">
                                </div>
                            </div>
        </div>
           
                 <div class="form-group">
                            <div class="row">
                                <div class="col">
                                                     
                            <label for="exampleInputName">Direccion</label>
                             <input type="text" class="form-control"  placeholder="Ingrese dirección" name="direccion"  value="<%= rs.getString("direccion_catedratico")%>" >
                                
                                </div>
                                <div class="col">
                                    <label for="departamento">Sucursal:</label>  
                                    <select class="form-control" name="sucursal" value="<%= rs.getString("sucursal_catedratico")%>">
                                        <option value="Puerto Barrios">Puerto Barrios</option>
                                        <option value="Morales">Morales</option>
                                        <option value="Los Amates">Los Amates</option>
                                        <option value="El Estor">El Estor</option>
                                    </select>
                                </div>
                            </div>
                        </div>       
                        
                        
                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="grado">Grado</label>
                                    <select class="form-control" name="grado"  value="<%= rs.getString("grado_catedratico")%>">
                                        <option value="Novatos">Novatos</option>
                                        <option value="Expertos">Expertos</option>
                                    </select>
                                </div>
                                <div class="col">
                                    <label for="nivel">Nivel</label>  
                                    <select class="form-control" name="nivel"  value="<%= rs.getString("nivel_catedratico")%>">
                                        <option value="Principiante I">Principiante I</option>
                                        <option value="Principiante II">Principiante II</option>
                                        <option value="Avanzado I">Avanzado I</option>
                                        <option value="Avanzado II">Avanzado II</option>
                                    </select>
                                </div>
                            </div>
                        </div> 
                        
                                       
                        
                        
            <br>
            
            <input type="submit" value="Guardar" class="btn btn-primary "/>             
             <a class="btn btn-warning" href="VerCatedratico.jsp" style="float: right;">Atrás</a>
           
             
        </div>
        </form>   
                <% } %>
        </div>
        
    
    
    </div>
            
        
    </body>
</html>

<%

        String nombre, apellido, correo, direccion, sucursal, grado, nivel, fecha, telefono;
        
       
        nombre=request.getParameter("nombre");
        apellido=request.getParameter("apellido");
        correo=request.getParameter("correo");
        direccion=request.getParameter("direccion");
        sucursal=request.getParameter("sucursal");
        grado=request.getParameter("grado");
        nivel=request.getParameter("nivel");
        fecha=request.getParameter("fecha");
        telefono=request.getParameter("telefono");

        if(nombre!=null && apellido!=null)
        {

        ps=conexion.prepareStatement("update catedratico set nombre_catedratico='"+nombre+"',apellido_catedratico='"+apellido+"',correo_catedratico='"+correo+"',direccion_catedratico='"+direccion+"',sucursal_catedratico='"+sucursal+"',grado_catedratico='"+grado+"',nivel_catedratico='"+nivel+"',fecha_catedratico='"+fecha+"',telefono_catedratico='"+telefono+"' where numero_carne="+id);
        
        ps.executeUpdate();
        response.sendRedirect("VerCatedratico.jsp");
        
        }
%>
