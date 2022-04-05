package com.g13.hotel.Dao;

import com.g13.hotel.bean.Manager;
import com.g13.hotel.util.JDBCUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ManagerDao {
    //登录获取
    public Manager getman(String name, String pwd){
        Manager manager =new Manager();
        Connection con = null;
        Statement stat=null;
        ResultSet rs=null;

        try {
            con= JDBCUtils.getConnection();
            stat=con.createStatement();
            String sql = "select * from manager where name = '" + name + "' and passw = '"+pwd+"'";
            rs = stat.executeQuery(sql);
            while(rs.next()){
                String m_name = rs.getString("name");
                String passw = rs.getString("passw");

                manager.setName(m_name);
                manager.setPassw(passw);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.close(con,stat,rs);
        }
        return manager;
    }

    //修改密码
    public int Changepwd(String name, String psw){
        Manager manager =new Manager();
        Connection con = null;
        Statement stat=null;
        int result=0;

        try {
            con=JDBCUtils.getConnection();
            stat=con.createStatement();
            String sql="update manager set passw = '"+psw+"' where name = '"+name+"'";
            result=stat.executeUpdate(sql);

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.close(con,stat);
        }
        return result;
    }
}
