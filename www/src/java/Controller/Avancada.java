/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.MovieDAO;
import Model.Movie;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.Actor;
import Model.Genero;
import java.util.Enumeration;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author carlagama
 */
public class Avancada extends HttpServlet {

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
        //doPost(){
        //Bla = request.getParameterValue("nome");
        //// faz bla virar de json para java array
        //For(ator : Atores)
        //{ new actor num arraylist}
        //}
        String json = request.getParameter("json");
        if (json != null) {
            JSONObject json_obj = new JSONObject(json);
            
            JSONArray array_actor = json_obj.getJSONArray("ATORES");
//                    System.out.println("array_actor");
              
            String string_genero = json_obj.getString("GENERO");
//                  System.out.println(string_genero);
            Genero genre = new Genero(string_genero);
            
           ArrayList<Actor> acts = new ArrayList<>();
            
            JSONObject intermediario;
//            System.out.println("ENTRANDO NO FOR");
            for(int i =0; i< array_actor.length();i++){
                intermediario = new JSONObject(array_actor.get(i).toString());
                acts.add(new Actor( intermediario.getString("NOME")) );
           }
  
        } else {
            response.getWriter().print("[\"Escolha um gênero!\"]");
        }
        
        MovieDAO mv = new MovieDAO();
        
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        /*ArrayList<Movie> result;
        result = mv.getMovie();
        response.getWriter().print(gson.toJson(result));*/
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
        // processRequest(request, response);
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print("<html><head><meta charset=\"utf-8\"</head><body><h1>Apenas requisições POST por favor!</body></html>");        
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
