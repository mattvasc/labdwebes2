/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.ActorDAO;
import DAO.MovieDAO;
import Model.Actor;
import Model.Movie;
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
        
        
        //Instanciando o baguio da gugou que gera Gson
        GsonBuilder builder = new GsonBuilder();
        Gson gson = builder.create();
        
        //Avisando o tipo da resposta:
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if (request.getParameter("act_id") != null) {

            Actor a = new Actor(Integer.parseInt(request.getParameter("act_id")));
            MovieDAO mv = new MovieDAO();
            ArrayList<Movie> result;
            result = mv.getTopTenMovie(a);
            response.getWriter().print(gson.toJson(result));

        } else {
            int n_lang;

            if (request.getParameter("n_lang") == null) {
                n_lang = 0;
            } else {
                n_lang = Integer.parseInt(request.getParameter("n_lang"));
            }

            // Retorna um vetor numérico das páginas que devem ser criadas... {32, 29, 28, 27, ..., X }
            if (request.getParameter("criar").equals("1")) {

                ArrayList<Integer> qtd = aDAO.getNLang(n_lang);
                response.getWriter().print(gson.toJson(qtd));

            } else if (request.getParameter("criar").equals("0")) {

                // Retorna o tamanho daquela paginação dos atores que falam "n_lang" idiomas.
                if (request.getParameter("limit") == null) {
                    int qtd;
                    if (request.getParameter("completa").equals("0")) {
                        qtd = aDAO.getQtd(n_lang, 0);
                    } else {
                        qtd = aDAO.getQtd(n_lang, 1);
                    }

                    response.getWriter().print(gson.toJson(qtd));
                } else {
                    // Retorna uma porção do conjunto dos personagens solicitados
                    if ("0".equals(request.getParameter("completa"))) {/* Paginacao Agrupada */
                        ArrayList<Actor> acts = aDAO.getActor(n_lang, Integer.parseInt(request.getParameter("limit")), Integer.parseInt(request.getParameter("offset")), 0);
                        response.getWriter().print(gson.toJson(acts));
                    } else {
                        ArrayList<Actor> acts = aDAO.getActor(n_lang, Integer.parseInt(request.getParameter("limit")), Integer.parseInt(request.getParameter("offset")), 1);
                        response.getWriter().print(gson.toJson(acts));
                    }
                }
            }
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
