/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;


/**
 *
 * @author spectrus
 */
public class ConnectionFactory{

    private static Connection conexao;
    public static Connection getConnection(){
        if(conexao != null)
            return conexao;
        
        try {       
         Class.forName("org.postgresql.Driver");
         
         
        Properties props = new Properties();
        props.setProperty("user","aluno");
        props.setProperty("password","aluno");
        props.setProperty("ssl","false");
        String url = "jdbc:postgresql://localhost/imdb";
        
        conexao = DriverManager.getConnection(url, props);

         System.out.println("Conexão com o Banco de dados Aberta!");

      } catch ( ClassNotFoundException | SQLException e ) {
         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
         //System.exit(0);
      } finally{
        return conexao;
        }
      
        
    }
    
}
