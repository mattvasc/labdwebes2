/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Genero;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 *
 * @author spectrus
 */
public class GeneroDAO {
    private Connection c;
    public ArrayList getGeneros(){ 
        ArrayList<Genero> g = null;
        c = ConnectionFactory.getConnection();
        try {
              CallableStatement call = c.prepareCall("{call getGenres()}");
              ResultSet rs = call.executeQuery();
               g = new ArrayList<>();
              while(rs.next()){
                  g.add(new Genero(rs.getString(1)));
              }
             
        } catch (SQLException e) {
            g = null;
        } finally {
            return g;
        }
    }
}
