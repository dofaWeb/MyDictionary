/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DictionaryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Dictionary;

/**
 *
 * @author NHAT
 */
public class WordController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet WordController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WordController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String uri = request.getRequestURI();
        HttpSession session = request.getSession();
        if (uri.endsWith("/Word")) {
            request.getRequestDispatcher("/Word.jsp").forward(request, response);
        } else if (uri.endsWith("/AddWord")) {
            request.getRequestDispatcher("/AddWord.jsp").forward(request, response);
        }else if(uri.startsWith("/Word/Edit/")){
            String[] path = uri.split("/");
            String Id = path[path.length-1];
            request.setAttribute("EditWord", Id);
            request.getRequestDispatcher("/Edit.jsp").forward(request, response);
        }else if(uri.startsWith("/Word/Delete/")){
            String[] path = uri.split("/");
            String Id = path[path.length-1];
            DictionaryDAO dictDAO = new DictionaryDAO();
            dictDAO.delete(Id);
            response.sendRedirect("/List");
        }
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
        String key = request.getParameter("Word");
        if (key!=null && key.equalsIgnoreCase("AddWord")) {
            AddWordPost(request, response);

            request.getRequestDispatcher("/AddWord.jsp").forward(request, response);
        }
        if(request.getParameter("editBtn")!=null){
            String Eng = request.getParameter("engTxt");
            String Vn = request.getParameter("vnTxt");
            String Id = request.getParameter("idTxt");
            Dictionary dict = new Dictionary(Eng, Vn, Integer.parseInt(Id));
            DictionaryDAO dictDAO = new DictionaryDAO();
            dictDAO.uppdate(dict);
            response.sendRedirect("/List");
        }
    }

    void AddWordPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Eng = request.getParameter("Eng");
        String Vn = request.getParameter("Vn");
        if (!Eng.equals("") && !Vn.equals("")) {
            DictionaryDAO dictdao = new DictionaryDAO();
            dictdao.insertDictionary(new Dictionary(Eng, Vn));
        }else {
            request.setAttribute("Add Word Error", "You need to fill both fileds to submit");
        }
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
