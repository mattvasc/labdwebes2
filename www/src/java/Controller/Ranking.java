/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.ActorDAO;
import Model.Actor;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.util.ArrayList;
/**
 *
 * @author spectrus
 */
public class Ranking extends HttpServlet {

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
        ActorDAO aDAO = new ActorDAO();
        
        /*
            DOCUMENTAÇÃO
        
            parametros obritaŕios:
        
            (criar=1, x=<int>)   exemplo via GET: localhost:8084/Raking?criar=1&x=20
                    OU
        
            (criar=0, n_lang=<int>, limit=<int>, offset=<int>) exemplo via GET: localhost:8084/Ranking?criar=0&n_lang=2&limit=10&offset=5
        
        
        
        */
        
        GsonBuilder builder = new GsonBuilder();
        Gson gson = builder.create();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        if(request.getParameter("criar").equals("1")){
            ArrayList<Integer> qtd = aDAO.getNLang( Integer.parseInt(request.getParameter("x")) );
            response.getWriter().print(gson.toJson(qtd));
        }
        else if(request.getParameter("criar").equals("0")){
             ArrayList<Actor> acts = aDAO.getActor(Integer.parseInt(request.getParameter("n_lang")), Integer.parseInt(request.getParameter("limit")), Integer.parseInt(request.getParameter("offset")));
             response.getWriter().print(gson.toJson(acts));
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
