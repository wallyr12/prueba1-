/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

public class Alumno {
    private int codigo;
    private String nombre;
    private String apellido;
    private String correo;
    private String direccion;
    private String sucursal;
    private String grado;
    private String nivel;
    private String fecha;
    private int telefono;

    
    public Alumno(int codigo, String nombre, String apellido, String correo, String direccion, String sucursal, String grado, String nivel, String fecha, int telefono){
        this.codigo=codigo;
        this.nombre=nombre;
        this.apellido=apellido;
        this.correo=correo;
        this.direccion=direccion;   
        this.sucursal=sucursal;   
        this.grado=grado;   
        this.nivel=nivel;   
        this.fecha=fecha;   
        
        this.telefono=telefono;   
    }

  
  

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    
    
      public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    
    
    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getSucursal() {
        return sucursal;
    }

    public void setSucursal(String sucursal) {
        this.sucursal = sucursal;
    }

    public String getGrado() {
        return grado;
    }

    public void setGrado(String grado) {
        this.grado = grado;
    }

    public String getNivel() {
        return nivel;
    }

    public void setNivel(String nivel) {
        this.nivel = nivel;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
    
    
    
        public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }
}

