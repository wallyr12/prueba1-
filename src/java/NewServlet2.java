/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


import Clases.Catedratico;
import Clases.CatedraticoController;
import Clases.ConexionBaseDeDatos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GERARD
 */
@WebServlet(urlPatterns = {"/NewServlet2"})
public class NewServlet2 extends HttpServlet {
    
    
     Catedratico catedratico;
    CatedraticoController registroCatedratico;
     Catedratico[] catedraticosRegistrados;
     StringBuffer objetoRespuesta = new StringBuffer();
    
    
    

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter respuesta = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            
            registroCatedratico=new CatedraticoController();
           String control = request.getParameter("control");
           
           if(control.toUpperCase().equals("GUARDAR")){
               catedratico=new Catedratico(
                Integer.parseInt(request.getParameter("codigo")),
                request.getParameter("nombre"),
                request.getParameter("apellido"),        
                request.getParameter("correo"),
                request.getParameter("direccion"),
                request.getParameter("sucursal"),
                request.getParameter("grado"), 
                request.getParameter("nivel"), 
                request.getParameter("fecha"),    
                       
                Integer.parseInt(request.getParameter("telefono")));                
                registroCatedratico.guardarCatedratico2(catedratico);//almacenarlo en BD                 
           }else if(control.toUpperCase().equals("ELIMINAR")){
               int codigoEliminar= Integer.parseInt(request.getParameter("codigo_catedratico"));
               registroCatedratico.eliminarCatedratico(codigoEliminar);
           }
                        
            
           // registroAlumno.guardarAlumno(alumno);//almacenarlo en el array
            //alumnosRegistrados= registroAlumno.getAlumnos();// consultar alumnos en el array                       
                    
           registroCatedratico.getCatedraticos2(objetoRespuesta);//consultar alumnos en la BD
           respuesta.write(objetoRespuesta.toString());             
            
            
            
            
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
