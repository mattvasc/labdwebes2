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
        // Lista de retorno de resultados
        ArrayList<Genero> g = null;
        // Cria ou pega a conexao do banco de dados:
        c = ConnectionFactory.getConnection();
        try {
              // Preparando para chamar uma stored procedure do lado de lá...
              CallableStatement call = c.prepareCall("{call getGenres()}");
              // executando a query
              ResultSet rs = call.executeQuery();
              
               g = new ArrayList<>();
               // Adicionando o resultado do banco na Arraylist
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
