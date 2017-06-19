/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import java.sql.*;

/**
 *
 * @author porperyus
 */
public class TesteDuDAO {
    private Connection connection;  
  
    public TesteDuDAO() {
        this.connection = ConnectionFactory.getConnection();        
    } 
    
    public String query(int limit, int off) throws SQLException {
        PreparedStatement statement = null;
        ResultSet rs = null;

        String SQL = "SELECT movieid, title, genre, actorname FROM (SELECT movieid, genre FROM genre WHERE genre = 'Comedy') AS generos INNER JOIN (SELECT movieid, actorname, actorid FROM act INNER JOIN (SELECT actorname, actorid FROM actor WHERE actor.actorname = 'Sandler, Adam (I)') AS ator USING(actorid))  AS bla USING (movieid) INNER JOIN movie USING (movieid) LIMIT "+limit+" OFFSET "+off+";";
        statement = connection.prepareStatement(SQL);
        rs = statement.executeQuery();
        
        String rst = "";
        while (rs.next()) {
            rst += "<tr>";
            rst += "<td>"+rs.getInt(1)+"</td>";
            rst += "<td>"+rs.getString(2)+"</td>";
            rst += "<td>"+rs.getString(3)+"</td>";
            rst += "<td>"+rs.getString(4)+"</td>";
            rst += "</tr>";
        }
        System.out.println(rst);
        
        return rst;
    }
}
