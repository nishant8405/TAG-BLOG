package com.tech.blog.helper;

import java.sql.*;

public class ConnectionHelper {

    private static Connection con;

    public static Connection getConnection() {

        try {

            if (con == null) {

                //load the driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                //create a connection
                String url = "jdbc:mysql://localhost:3306/techblog";
                String user = "root";
                String password = "root";

                con = DriverManager.getConnection(url, user, password);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
