package com.g13.hotel.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class JDBCUtils {

    private JDBCUtils(){}

    private static String driverClass;
    private static String url;
    private static String username;
    private static String password;
    private static Connection con;

    //读取配置文件，注册驱动
    static {
        try {
            InputStream is = JDBCUtils.class.getClassLoader().getResourceAsStream("config.properties");
            Properties prop = new Properties();
            prop.load(is);

            driverClass=prop.getProperty("driverClass");
            url=prop.getProperty("url");
            username=prop.getProperty("username");
            password=prop.getProperty("password");

            Class.forName(driverClass);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    //数据库链接
    public static Connection getConnection(){
        try {
            con= DriverManager.getConnection(url,username,password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }
    //释放资源
    public static void close(Connection con, Statement stat, ResultSet rs){
        if(con!=null){
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(stat!=null){
            try {
                stat.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(rs!=null){
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public static void close(Connection con, Statement stat){
        if(con!=null){
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(stat!=null){
            try {
                stat.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
