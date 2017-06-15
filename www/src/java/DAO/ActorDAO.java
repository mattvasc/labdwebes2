/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Actor;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

public class ActorDAO {
      private Connection c;
    public ArrayList getActor(int n_lang, int page_size , int offset){ 
        // Lista de retorno de resultados
        ArrayList<Actor> a = null;
        // Cria ou pega a conexao do banco de dados:
        c = ConnectionFactory.getConnection();
        try {
              // Preparando para chamar uma stored procedure do lado de lá...
              CallableStatement call = c.prepareCall("{call getActors(?,?,?)}");
              call.setInt(1,n_lang);
              call.setInt(2,page_size);
              call.setInt(3, offset);
              
              // executando a query
              ResultSet rs = call.executeQuery();
              
               a = new ArrayList<>();
               // Adicionando o resultado do banco na Arraylist
              while(rs.next()){
                  a.add(new Actor(rs.getInt(1),rs.getString(2)));
              }
             
        } catch (SQLException e) {
            a = null;
        } finally {
            return a;
        }
    }
     public ArrayList getNLang(int x){ 
        // Lista de retorno de resultados
        ArrayList<Integer> n_lang = null;
        // Cria ou pega a conexao do banco de dados:
        c = ConnectionFactory.getConnection();
        try {
              // Preparando para chamar uma stored procedure do lado de lá...
              CallableStatement call = c.prepareCall("{call getNLang(?)}");
              call.setInt(1, x);
              
              // executando a query
              ResultSet rs = call.executeQuery();
              
               n_lang = new ArrayList<>();
               // Adicionando o resultado do banco na Arraylist
              while(rs.next()){
                  n_lang.add(rs.getInt(1));
              }
             
        } catch (SQLException e) {
            System.out.print("SQL EXCEPTION: " + e.getMessage());
            n_lang = null;
        } finally {
            return n_lang;
        }
    }
}
