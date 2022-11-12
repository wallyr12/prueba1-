<%-- 
    Document   : RegCatedratico
    Created on : 27/10/2022, 16:54:57
    Author     : GERARD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <title>Registro Catedratico</title>
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
        
        <script src="js/script.js"></script>
       
        
    </head>
    <body>       
    
    
    
    <div class="container-sm ">              
            <div class="shadow-lg p-3 bg-white rounded">
        <form method="POST" id="form1" name="form1" action="NewServlet2" >
             <div class="for m-group">                       
                        <img src="https://cdn-icons-png.flaticon.com/512/3077/3077421.png" class="rounded mx-auto d-block" width="100" alt="...">
                        <h2 class="display-8 text-center my-4"> REGISTRO DE CATEDRATICOS </h2>
                                 
                        
                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="codigo">Código</label>
                                    <input class="form-control" type="text" placeholder="Ingrese su código" name="codigo" id="codigo">
                                    <input type="hidden" name="control" value="GUARDAR"> 
                                </div>
                                <div class="col">
                                    <label for="fecha">Fecha de Registro</label>  
                                    <input class="form-control" type="date" name="fecha" id="fecha">
                                                            
                                </div>
                            </div>
                         </div>
                       
                        
           
                   <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="nombre">Nombre catedratico</label>
                                    <input class="form-control" type="text" placeholder="Ingrese nombre" name="nombre" id="nombre">
                                </div>
                                 <div class="col">
                                    <label for="apellido">Apellido catedratico</label>
                                    <input class="form-control" type="text" placeholder="Ingrese apellido" name="apellido" id="apellido">
                                </div>
                            </div>
                    </div>      
                        
                       
                                     
                     <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="correo">Correo</label>
                                    <input class="form-control" type="text" placeholder="Ingrese  correo" name="correo" id="correo">
                                </div>
                                 <div class="col">
                                    <label for="telefono">Telefono</label>
                                    <input class="form-control" type="text" placeholder="Ingrese telefono" name="telefono" id="telefono">
                                </div>
                            </div>
                     </div>
                
                        
                        
                        
           
           
                 <div class="form-group">
                            <div class="row">
                                <div class="col">
                                                     
                            <label for="exampleInputName">Dirección</label>
                             <input type="text" class="form-control"  placeholder="Ingrese dirección" name="direccion" id="direccion"  >
                                
                                </div>
                                <div class="col">
                                    <label for="departamento">Sucursal:</label>  
                                    <select class="form-control" name="sucursal">
                                        <option value="1">Puerto Barrios</option>
                                        <option value="2">Morales</option>
                                        <option value="3">Los Amates</option>
                                        <option value="4">El Estor</option>
                                    </select>
                                </div>
                            </div>
                        </div>       
                        
                        
                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="grado">Grado:</label>
                                    <select class="form-control" name="grado">
                                        <option value="1">Novatos</option>
                                        <option value="2">Expertos</option>
                                    </select>
                                </div>
                                <div class="col">
                                    <label for="nivel">Nivel:</label>  
                                    <select class="form-control" name="nivel">
                                        <option value="1">Principiante I</option>
                                        <option value="2">Principiante II</option>
                                        <option value="3">Avanzado I</option>
                                        <option value="4">Avanzado II</option>
                                    </select>
                                </div>
                            </div>
                        </div> 
                        
                        
                        
                        
            <br>
            
            <button type="button" onclick="enviarFormularioOpcion3()" class="btn btn-success">Guardar</button>
             <button type="reset" class="btn btn-danger">Cancelar</button>
             <a class="btn btn-warning" href="home.jsp" style="float: right;">Atrás</a>
             
        </div>
        </form>   
        </div>
        
      
    
        </div>
    </body>
    
    
    
    
</html>
