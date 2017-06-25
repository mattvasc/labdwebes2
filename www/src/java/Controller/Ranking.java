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
        String opcao = request.getParameter("opcao");
        if (opcao != null) {
            switch (opcao) {
                // Retorna 10 filmes que aquele ator fez
                case "top10":
                    Actor a = new Actor(Integer.parseInt(request.getParameter("act_id")));
                    MovieDAO mv = new MovieDAO();
                    ArrayList<Movie> result;
                    result = mv.getTopTenMovie(a);
                    response.getWriter().print(gson.toJson(result));

                    break;
                // Retorna o inteiro de qtd de atores
                case "qtd":
                    int qtd;
                    if (request.getParameter("completa").equals("0")) {
                        qtd = aDAO.getQtd(Integer.parseInt(request.getParameter("n_lang")));
                    } else {
                        qtd = aDAO.getQtd(Integer.parseInt(request.getParameter("n_lang_min")), Integer.parseInt(request.getParameter("n_lang_max")));
                    }
                    response.getWriter().print(gson.toJson(qtd));
                    break;
                //Retorna a pagina solicitada
                case "pagina":
                    int limite = Integer.parseInt(request.getParameter("limit"));
                    int offset = Integer.parseInt(request.getParameter("offset"));
                    ArrayList<Actor> acts = null;
                    if ("0".equals(request.getParameter("completa"))) {/* Paginacao Agrupada */
                        int nlang;
                        if (request.getParameter("n_lang") == null) {
                            System.out.println("É nulo!!!!!!!");
                            nlang = 1;
                        } else {
                            nlang = Integer.parseInt(request.getParameter("n_lang"));
                            System.out.println(nlang);

                        }
                        acts = aDAO.getActor(nlang, limite, offset);
                    } else {
                        /*Paginacao Completa!*/

                        int nlangmin;
                        int nlangmax;
                        if (request.getParameter("n_lang_min") == null) {
                            System.out.println("É nulo!!!!!!!");
                            nlangmin = 1;
                        } else {
                            String s = request.getParameter("n_lang_min");
                            System.out.println(s);
                            nlangmin = Integer.valueOf(s);
                        }
                        if (request.getParameter("n_lang_max") == null) {
                            System.out.println("É nulo!!!!!!!");
                            nlangmax = 1;
                        } else {
                            nlangmax = Integer.valueOf(request.getParameter("n_lang_max"));
                        }

                        acts = aDAO.getActor(nlangmin, nlangmax, limite, offset);
                    }
                    response.getWriter().print(gson.toJson(acts));

                    break;
                // Retorna um vetor numérico das páginas que devem ser criadas... {32, 29, 28, 27, ..., X } 
                case "quaispaginas": // agrupada only
                    int min = Integer.parseInt(request.getParameter("n_lang_min"));
                    int max = Integer.parseInt(request.getParameter("n_lang_max"));

                    ArrayList<Integer> nlangs = aDAO.getNLang(min, max);
                    response.getWriter().print(gson.toJson(nlangs));
                    break;
                default:
                    response.getWriter().print("[\"Opção Invalida!\"]");
                    break;
            }
        } else {
            response.getWriter().print("[\"Falta fornecer a opção!\"]");

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
                System.out.println("ESTOU FAZENDO GET MAMAE!!!!!!!");

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
        System.out.println("ESTOU FAZENDO POST MAMAE!!!!!!!");
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
