package com.g13.hotel.Dao;

import com.g13.hotel.bean.Room;
import com.g13.hotel.util.JDBCUtils;

import java.sql.*;
import java.util.ArrayList;

public class RoomDao {
    //修改房价状态
    public int update(Room rm){
        Connection con = null;
        Statement stat = null;
        int result = 0;

        try {
            con= JDBCUtils.getConnection();
            stat =con.createStatement();
            String sql = "update room set state='"+rm.getState()+"' where id='"+rm.getId()+"'";
            result = stat.executeUpdate(sql);

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.close(con,stat);
        }
        return result;
    }

    //查找房价
    public Room findByrid(long rid){
        Room room = new Room();
        Connection con = null;
        Statement stat = null;
        ResultSet rs = null;

        try {
            con = JDBCUtils.getConnection();
            stat =con.createStatement();
            String sql = "select * from room where id='" + rid + "'";
            rs = stat.executeQuery(sql);

            while (rs.next()) {
                long id = rs.getInt("id");
                String type = rs.getString("type");
                long price = rs.getInt("price");
                long state = rs.getInt("state");

                room.setId(id);
                room.setType(type);
                room.setPrice(price);
                room.setState(state);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.close(con,stat,rs);
        }
        return room;
    }

    //查看所有房间
    public ArrayList<Room> findAll(){
        ArrayList<Room> list = new ArrayList<>();
        Connection con =null;
        Statement stat = null;
        ResultSet rs = null;

        try {
            con=JDBCUtils.getConnection();
            stat = con.createStatement();
            String sql = "select * from room";
            rs= stat.executeQuery(sql);

            while(rs.next()){
                long id = rs.getInt("id");
                String type = rs.getString("typr");
                long price = rs.getInt("price");
                long state = rs.getInt("state");

                Room room = new Room();
                room.setId(id);
                room.setType(type);
                room.setPrice(price);
                room.setState(state);

                list.add(room);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.close(con,stat,rs);
        }

        return list;
    }

    //查看可住房间
    public ArrayList<Room> CheckinAble(){
        ArrayList<Room> list = new ArrayList<>();
        Connection con =null;
        Statement stat = null;
        ResultSet rs = null;

        try {
            con=JDBCUtils.getConnection();
            stat = con.createStatement();
            String sql = "select * from room where state = 1";
            rs= stat.executeQuery(sql);

            while(rs.next()){
                long id = rs.getInt("id");
                String type = rs.getString("typr");
                long price = rs.getInt("price");
                long state = rs.getInt("state");

                Room room = new Room();
                room.setId(id);
                room.setType(type);
                room.setPrice(price);
                room.setState(state);

                list.add(room);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.close(con,stat,rs);
        }

        return list;
    }
}

