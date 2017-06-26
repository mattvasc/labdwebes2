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
 * @author ingridmsp
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

    
    public Adcional getAdd(int id){
    
        Adcional add = null;
        connection = ConnectionFactory.getConnection();
        try {
            
            CallableStatement call = connection.prepareCall("{additional_fields(?)}");
            call.setInt(1,id);
            ResultSet rs = call.executeQuery();
            
            // array atores -- array diretores  -- array lang 
            while (rs.next()) {
                add = new Movie(rs.getArray(1),rs.getArray(2),rs.getArray(2));
            }
            
        
        } catch (SQLException e) {

            System.out.print("SQL EXCEPTION: " + e.getMessage());

        } finally {
            return add;
        }
    }
    
    public ArrayList<Movie> getMovie(String GENERO, ArrayList<Actor> atores) {

        ArrayList<Movie> mv = null;
        connection = ConnectionFactory.getConnection();
        
        try {

            CallableStatement call = connection.prepareCall("{call select_movie_actors_in_common(?,?,?,?,?,?)}");

            // passando as coisas pra stored procedure
            call.setString(1, GENERO);
            int i;
            for(i= 0; i<atores.size();i++){
                 call.setString ((i+2), atores.get(i).getActorName());  // passa a qnt de atores que tem. de 1 a 5       
            }
               for(;i<5;i++)
                 call.setNull((i+2), java.sql.Types.VARCHAR);  

            // executando a query
            System.out.println(call.toString());
            ResultSet rs = call.executeQuery(); // retorna movieid, title, mvyear, genre

            mv = new ArrayList<Movie>();

            while (rs.next()) {
                System.out.println(rs.getString(2));
                mv.add(new Movie(rs.getInt(1),rs.getString(2),rs.getString(3),new Genero(rs.getString(4)))); // fazer a instanciação direito depois que pegar do bd
            }

        } catch (SQLException e) {

            System.out.print("SQL EXCEPTION: " + e.getMessage());
            mv = null;

        } finally {
            return mv;
        }

    }
}
