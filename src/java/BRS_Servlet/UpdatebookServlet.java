/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BRS_Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 91790
 */
@WebServlet(name = "UpdatebookServlet", urlPatterns = {"/UpdatebookServlet"})
public class UpdatebookServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try
        {
            DBConnection db=new DBConnection();
            Statement st=db.stt;
            String bid=request.getParameter("sb1");
            String bn=request.getParameter("bn");
            String cateid=request.getParameter("cid");
            String subcateid=request.getParameter("scid");
            String aut=request.getParameter("aut");
            String pub=request.getParameter("pub");
            String price=request.getParameter("pc");
            String edition=request.getParameter("ed");            
            System.out.println("update book id = "+bid);
            
                        
            st.executeUpdate("Update book set BookName='"+bn+"', CateId='"+cateid+"', SubCateId='"+subcateid+"', Author='"+aut+"', Publisher='"+pub+"', Price='"+price+"', Edition='"+edition+"' where BookId = '"+bid+"'");
            
            response.sendRedirect("Adminviewbk.jsp");
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
            /* TODO output your page here. You may use following sample code. */
            
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
