package com.g13.hotel.Dao;

import com.g13.hotel.bean.Client;
import com.g13.hotel.util.JDBCUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ClientDao {
    //查找客人
    public Client findById(long id){
        Client client = new Client();
        Connection con = null;
        Statement stat = null;
        ResultSet rs = null;

        try {
            con= JDBCUtils.getConnection();
            stat =con.createStatement();
            String sql = "select * from client where id='"+id+"'";
            rs = stat.executeQuery(sql);

            while (rs.next()){
                long Id=rs.getInt("id");
                String name=rs.getString("name");
                String tel= rs.getString("tel");
                String rtype=rs.getString("rtype");
                long rid=rs.getInt("rid");

                client.setId(Id);
                client.setName(name);
                client.setTel(tel);
                client.setRtype(rtype);
                client.setRid(rid);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.close(con,stat,rs);
        }
        return client;
    }

    //增加客人
    public int insert(Client client){
        Connection con = null;
        Statement stat = null;
        int result = 0;


        try {
            con = JDBCUtils.getConnection();
            stat = con.createStatement();

            String sql = "insert into client values('"+client.getId()+"','"+client.getName()+"','"+client.getTel()+"','"+client.getRtype()+"','"+client.getRid()+"')";
            result = stat.executeUpdate(sql);

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.close(con,stat);
        }
        return  result;
    }

    //删除客人
    public int del(Client client){
        Connection con = null;
        Statement stat = null;
        int result = 0;

        try {
            con = JDBCUtils.getConnection();
            stat = con.createStatement();

            String sql = "delete from client where id='"+client.getId()+"'";
            result = stat.executeUpdate(sql);

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.close(con,stat);
        }
        return  result;
    }
}

