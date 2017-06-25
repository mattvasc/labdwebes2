/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Actor;
import Model.Genero;
import Model.Movie;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author porperyus
 */
public class MovieDAO {

    private Connection connection;

    public MovieDAO() {
        this.connection = ConnectionFactory.getConnection();
    }

    public ArrayList<Movie> getTopTenMovie(Actor a) {
        ArrayList<Movie> retorno = null;
        try {
            connection = ConnectionFactory.getConnection();
            CallableStatement call = connection.prepareCall("SELECT * FROM getTenMoviesByActorId(?);");
            // passando as coisas pra stored procedure
            call.setInt(1, a.getActorId());
            ResultSet rs = call.executeQuery();

            retorno = new ArrayList<Movie>();

            while (rs.next()) {
                retorno.add(new Movie(rs.getInt(1), rs.getString(2), rs.getString(3))); 
            }

        } catch (SQLException e) {
            System.out.println("Erro na getTopTenMovies: " + e.getLocalizedMessage());
        } finally {
            return retorno;

        }
    }

    public ArrayList<Movie> getMovie(String GENERO, String A1, String A2, String A3, String A4, String A5) {

        ArrayList<Movie> mv = null;
        connection = ConnectionFactory.getConnection();
        Genero gen;
        
        try {

            CallableStatement call = connection.prepareCall("{call DINAMIC_ACTOR(?,?,?,?,?,?)}");

            // passando as coisas pra stored procedure
            call.setString(1, GENERO);
            call.setString(2, A1);
            call.setString(3, A2);
            call.setString(4, A3);
            call.setString(5, A4);
            call.setString(6, A5);

            // executando a query
            ResultSet rs = call.executeQuery(); // retorna movieid, title, mvyear, genre

             gen = new Genero(rs.getString(4));
            mv = new ArrayList<Movie>();

            while (rs.next()) {
                mv.add(new Movie(rs.getInt(1),rs.getString(2),rs.getString(3),gen)); // fazer a instanciação direito depois que pegar do bd
            }

        } catch (SQLException e) {

            System.out.print("SQL EXCEPTION: " + e.getMessage());
            mv = null;

        } finally {
            return mv;
        }

    }
}
