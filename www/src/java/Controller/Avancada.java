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

        
         //No controller vai ter algo:
        //doPost(){
        //Bla = request.getParameterValue("nome");
        //// faz bla virar de json para java array
        //For(ator : Atores)
        //{ new actor num arraylist}
        //}
        String json = request.getParameter("tagINGRID");

        if (json != null) {
            JSONObject json_actor = new JSONObject(json);
            JSONArray array_actor = json_actor.getJSONArray("label_do_array");

            Actor[] acts;
            acts = new Actor[array_actor.length()];
            Genero genre = new Genero();

            /*Primeira entrada do json é o genero.*/
            genre.setGenre((String) array_actor.get(0));
            System.out.println(genre.getGenre());

            for (int i = 1; i < array_actor.length(); i++) {
                acts[i].setActorName((String) array_actor.get(i));
                System.out.println("[" + i + "]: " + acts[i].getActorName());
            }

        } else {
            response.getWriter().print("[\"Escolha um gênero!\"]");
        }

        
        
        
        MovieDAO mv = new MovieDAO();

        GsonBuilder builder = new GsonBuilder();
        Gson gson = builder.create();

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
