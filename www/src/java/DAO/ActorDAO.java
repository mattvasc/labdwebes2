/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Actor;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

public class ActorDAO {

    private Connection c;

    // Quantidade da paginacao agrupada
    public int getQtd(int x) {
        c = ConnectionFactory.getConnection();
        try {
            PreparedStatement ps;
            ps = c.prepareStatement("SELECT COUNT(n_lang) FROM actor WHERE n_lang = ?");
            ps.setInt(1, x);
            System.out.println("getQtd, completa = 0 , : " + ps.toString());

            ResultSet rs = ps.executeQuery();
            rs.next();
            x = rs.getInt(1);

        } catch (SQLException e) {

            System.out.println("***** Erro no ActorDAO.getQtd(): " + e.getMessage());
            x = -1;
        }

        return x;
    }

    // Quantidade da paginacao completa
    public int getQtd(int min, int max) {
        int x = 0;
        c = ConnectionFactory.getConnection();

        try {

            PreparedStatement ps = c.prepareStatement("SELECT COUNT(n_lang) FROM actor WHERE n_lang >= ? AND n_lang <= ?");
            ps.setInt(1, min);
            ps.setInt(2, max);

            ResultSet rs = ps.executeQuery();
            rs.next();
            x = rs.getInt(1);

        } catch (SQLException e) {
            System.out.println("***** Erro no ActorDAO.getQtd(): " + e.getMessage());

        } finally {
            return x;
        }
    }

    public ArrayList getActor(int n_lang_min, int n_lang_max, int page_size, int offset) {
        ArrayList<Actor> a = null;
        c = ConnectionFactory.getConnection();
        try {
            CallableStatement call = c.prepareCall("{call getActors(?,?,?,?)}");
            call.setInt(1, n_lang_min); // qual rang da paginacao?
            call.setInt(2, n_lang_max);
            call.setInt(3, page_size); // Qual tamanho da pagina?
            call.setInt(4, offset); // Qual pagina?
            System.out.println(call);
            ResultSet rs = call.executeQuery();
            a = new ArrayList();
            while (rs.next()) { // id, actor, n_lang
                a.add(new Actor(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (SQLException e) {

        } finally {
            return a;
        }
    }

    // Get actor para pags agrupadas
    public ArrayList getActor(int n_lang, int page_size, int offset) {
        // Lista de retorno de resultados
        ArrayList<Actor> a = null;
        // Cria ou pega a conexao do banco de dados:
        c = ConnectionFactory.getConnection();
        try {
            // Preparando para chamar uma stored procedure do lado de lá...
            CallableStatement call;

            call = c.prepareCall("{call getActors(?,?,?)}");

            call.setInt(1, n_lang); // qual paginacao?
            call.setInt(2, page_size); // Qual tamanho da pagina?
            call.setInt(3, offset); // Qual pagina?
            System.out.println("getActor, completa = 0, : " + call.toString());
            // executando a query
            ResultSet rs = call.executeQuery();

            a = new ArrayList<>();
            // Adicionando o resultado do banco na Arraylist
            while (rs.next()) { // id, name
                a.add(new Actor(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.print("SQL EXCEPTION: " + e.getMessage());
            a = null;
        } finally {
            return a;
        }
    }

    public ArrayList getNLang(int min, int max) {
        // Lista de retorno de resultados
        ArrayList<Integer> n_lang = null;
        // Cria ou pega a conexao do banco de dados:
        c = ConnectionFactory.getConnection();
        try {
            // Preparando para chamar uma stored procedure do lado de lá...
            CallableStatement call = c.prepareCall("{call getNLang(?, ?)}");
            call.setInt(1, min);
            call.setInt(2, max);

            // executando a query
            ResultSet rs = call.executeQuery();

            n_lang = new ArrayList<>();
            // Adicionando o resultado do banco na Arraylist
            while (rs.next()) {
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
