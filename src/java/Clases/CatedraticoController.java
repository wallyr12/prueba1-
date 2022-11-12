/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



/**
 *
 * @author GERARD
 */
public class CatedraticoController {
    
       Catedratico[] tablaCatedratico;
    int indiceArray;
    private ConexionBaseDeDatos conectorBD;
    private Connection conexion;
    private PreparedStatement statement = null;
    private ResultSet result = null;
    
    public CatedraticoController(){
        this.tablaCatedratico = new Catedratico[100];
        this.indiceArray=0;
    }
    
     public void guardarCatedratico(Catedratico catedratico){
        this.tablaCatedratico[this.indiceArray]=catedratico;  
        this.indiceArray=this.indiceArray+1;
        // procedimiento para almacenar en la Base de Datos
    }
    
    public Catedratico[] getCatedraticos(){
        return this.tablaCatedratico;
    }
    
    public void abrirConexion(){
        conectorBD= new ConexionBaseDeDatos();
        conexion=conectorBD.conectar();
    }    
   
    
    public String guardarCatedratico2(Catedratico catedratico){        
        String sql = "INSERT INTO rapidito.catedratico(numero_carne, nombre_catedratico, apellido_catedratico, correo_catedratico, direccion_catedratico, telefono_catedratico, sucursal_catedratico, grado_catedratico, nivel_catedratico, fecha_catedratico) ";
             sql += " VALUES(?,?,?,?,?,?,?,?,?,?)";              
       try{     
            abrirConexion();
            statement = conexion.prepareStatement(sql); 
            statement.setInt(1, catedratico.getCodigo());
            statement.setString(2, catedratico.getNombre());
             statement.setString(3, catedratico.getApellido());
            statement.setString(4, catedratico.getCorreo());
            statement.setString(5, catedratico.getDireccion());
            statement.setInt(6, catedratico.getTelefono());
            statement.setString(7, catedratico.getSucursal());
            statement.setString(8, catedratico.getGrado());
            statement.setString(9, catedratico.getNivel());
            statement.setString(10, catedratico.getFecha());
            
            
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
    
    public void getCatedraticos2(StringBuffer respuesta){   
        String sql="select * from rapidito.catedratico";
        try{
        abrirConexion();
        respuesta.setLength(0); 
        statement= conexion.prepareStatement(sql);                        
        result = statement.executeQuery();            
            if (result!=null){
                while (result.next()){
                respuesta.append("<tr>");
                respuesta.append("<td >").append(result.getString("numero_carne")).append("</td>");
                respuesta.append("<td >").append(result.getString("nombre_catedratico")).append("</td>");
                respuesta.append("<td >").append(result.getString("apellido_catedratico")).append("</td>");
                respuesta.append("<td >").append(result.getString("direccion_catedratico")).append("</td>");
                respuesta.append("<td >").append(result.getString("correo_catedratico")).append("</td>");
                respuesta.append("<td >").append(result.getString("telefono_catedratico")).append("</td>");
                respuesta.append("<td >").append(result.getString("sucursal_catedratico")).append("</td>");
                respuesta.append("<td >").append(result.getString("grado_catedratico")).append("</td>");
                respuesta.append("<td >").append(result.getString("nivel_catedratico")).append("</td>");
                respuesta.append("<td >").append(result.getString("fecha_catedratico")).append("</td>");
                respuesta.append("<td id=\"").append(result.getString("numero_carne"))
                        .append("\"  onclick=\"eliminarCatedratico(this.id);\">") 
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
    
    public String eliminarCatedratico(int carne){        
        String sql = "DELETE FROM catedratico WHERE numero_carne="+carne;              
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
