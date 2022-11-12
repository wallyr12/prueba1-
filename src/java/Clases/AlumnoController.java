/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class AlumnoController {
      Alumno[] tablaALumno;
    int indiceArray;
    private ConexionBaseDeDatos conectorBD;
    private Connection conexion;
    private PreparedStatement statement = null;
    private ResultSet result = null;
    
    public AlumnoController(){
        this.tablaALumno = new Alumno[100];
        this.indiceArray=0;
    }
    
     public void guardarAlumno(Alumno alumno){
        this.tablaALumno[this.indiceArray]=alumno;  
        this.indiceArray=this.indiceArray+1;
        // procedimiento para almacenar en la Base de Datos
    }
    
    public Alumno[] getAlumnos(){
        return this.tablaALumno;
    }
    
    public void abrirConexion(){
        conectorBD= new ConexionBaseDeDatos();
        conexion=conectorBD.conectar();
    }    
   
    
    public String guardarAlumno2(Alumno alumno){        
        String sql = "INSERT INTO rapidito.alumno(numero_carne, nombre_alumno, apellido_alumno, correo_alumno, direccion_alumno, telefono_alumno, sucursal_alumno, grado_alumno, nivel_alumno, fecha_alumno) ";
             sql += " VALUES(?,?,?,?,?,?,?,?,?,?)";              
       try{     
            abrirConexion();
            statement = conexion.prepareStatement(sql); 
            statement.setInt(1, alumno.getCodigo());
            statement.setString(2, alumno.getNombre());
            statement.setString(3, alumno.getApellido());
            statement.setString(4, alumno.getCorreo());
            statement.setString(5, alumno.getDireccion());
            statement.setInt(6, alumno.getTelefono());
            statement.setString(7, alumno.getSucursal());
            statement.setString(8, alumno.getGrado());
            statement.setString(9, alumno.getNivel());
            statement.setString(10, alumno.getFecha());
            
                int resultado = statement.executeUpdate(); 
                if(resultado > 0){
                    return String.valueOf(resultado);
                }else{
                    return String.valueOf(resultado);
                }
        }catch(SQLException e){ 
            return e.getMessage();
        }
    }
    
    public void getAlumnos2(StringBuffer respuesta){   
        String sql="select * from rapidito.alumno";
        try{
        abrirConexion();
        respuesta.setLength(0); 
        statement= conexion.prepareStatement(sql);                        
        result = statement.executeQuery();            
            if (result!=null){
                while (result.next()){
                respuesta.append("<tr bd-dark>");
                respuesta.append("<td >").append(result.getString("numero_carne")).append("</td>");
                respuesta.append("<td >").append(result.getString("nombre_alumno")).append("</td>");
                respuesta.append("<td >").append(result.getString("apellido_alumno")).append("</td>");
                respuesta.append("<td >").append(result.getString("direccion_alumno")).append("</td>");
                respuesta.append("<td >").append(result.getString("correo_alumno")).append("</td>");
                respuesta.append("<td >").append(result.getString("telefono_alumno")).append("</td>");
                respuesta.append("<td >").append(result.getString("sucursal_alumno")).append("</td>");
                respuesta.append("<td >").append(result.getString("grado_alumno")).append("</td>");
                respuesta.append("<td >").append(result.getString("nivel_alumno")).append("</td>");
                respuesta.append("<td >").append(result.getString("fecha_alumno")).append("</td>");
                respuesta.append("<td id=\"").append(result.getString("numero_carne"))
                        .append("\"  onclick=\"eliminarAlumno(this.id);\">") 
                         //.append("\"  onclick=\"eliminarAlumno("+result.getString("numero_carne")+");\">") 
                        .append(" <a class=\"btn btn-warning\"'><i class=\"fas fa-edit\"></i>  </a>"
                                +" <a class=\"btn btn-danger\"'> <i class=\"fas fa-trash-alt\"></i> </a>"
                                + " <td></tr>");
                }
            }else{
                respuesta.append("error al consultar");
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public String eliminarALumno(int carne){        
        String sql = "DELETE FROM alumno WHERE numero_carne="+carne;              
       try{     
            abrirConexion();
            statement = conexion.prepareStatement(sql); 
            int resultado = statement.executeUpdate();
            if(resultado > 0){
                return String.valueOf(resultado);
            }else{
                return String.valueOf(resultado);
            }
        }catch(SQLException e){ 
            return e.getMessage();
        }
    }
    
    
}
