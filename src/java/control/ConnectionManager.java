/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.sql.Connection;
import java.sql.DriverManager;



/**
 *
 * @author NVQuang
 */
public class ConnectionManager {
    public static Connection con = null;

    public static Connection getDBConnection() {
        String dbUrl = "jdbc:mysql://localhost:3306/ql_bansach";
        String dbClass = "com.mysql.jdbc.Driver";

        try {
            Class.forName(dbClass);
            con = (com.mysql.jdbc.Connection) DriverManager.getConnection (dbUrl, "root", "");
        }catch(Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
