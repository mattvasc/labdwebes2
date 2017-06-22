/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
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
    
    public ArrayList getMovie(String GENERO,String A1,String A2,String A3,String A4,String A5){
    
          ArrayList<Movie> mv = null;
          connection = ConnectionFactory.getConnection();
 
            try{
            
            CallableStatement call = connection.prepareCall("{call DINAMIC_ACTOR(?,?,?,?,?,?)}");
            
            // passando as coisas pra stored procedure
            call.setString(1,GENERO);
            call.setString(2,A1);
            call.setString(3,A2);
            call.setString(4,A3);
            call.setString(5,A4);
            call.setString(6,A5);
            
            // executando a query
            ResultSet rs = call.executeQuery();
            
            mv =  new ArrayList<>();
            
            while (rs.next()) {
                    mv.add(new Movie()); // fazer a instanciação direito depois que pegar do bd
                }
            
            }catch (SQLException e){
            
                System.out.print("SQL EXCEPTION: " + e.getMessage());
                mv = null;
            
            } finally{
                return mv;
            }
   
    }
}
