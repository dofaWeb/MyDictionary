/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Dictionary;

/**
 *
 * @author NHAT
 */
public class DictionaryDAO {

    private Connection conn = null;

    public DictionaryDAO() {
        try {
            conn = db.DBConnection.getConnection();
            if (conn == null) {
                throw new Exception("Database connection failed.");
            }
        } catch (Exception e) {
            System.out.println("Error in LoginDAO constructor: " + e.getMessage());
        }
    }

    public ArrayList<Dictionary> getAllDictionary() {
        ArrayList<Dictionary> dictList = new ArrayList<>();
        PreparedStatement pre = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM sql12726597.Dictionary;";
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                Dictionary dict = new Dictionary();
                dict.setEng(rs.getString("Eng"));
                dict.setVn(rs.getString("Vn"));
                dict.setId(rs.getInt("Id"));
                dictList.add(dict);
            }
        } catch (Exception e) {
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pre != null) {
                    pre.close();
                }
            } catch (Exception e) {
            }
            db.DBConnection.closeConnection(conn);
        }
        return dictList;
    }

    public Dictionary getDictionaryByID(String Id) {
        Dictionary dict = new Dictionary();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM sql12726597.Dictionary WHERE Id = ?";
            pst = conn.prepareStatement(sql);
            pst.setString(1, Id);
            rs = pst.executeQuery();
            if (rs.next()) {
                dict.setEng(rs.getString("Eng"));
                dict.setVn(rs.getString("Vn"));
                dict.setId(rs.getInt("Id"));
            }
        } catch (Exception e) {

        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
            }
            db.DBConnection.closeConnection(conn);
        }
        return dict;
    }

    public int insertDictionary(Dictionary dict) {
        int count = 0;
        PreparedStatement pre = null;
        try {
            String sql = "INSERT INTO sql12726597.Dictionary"
                    + " (`Eng`,`Vn`)"
                    + " VALUES"
                    + "(?,?);";
            pre = conn.prepareStatement(sql);
            pre.setString(1, dict.getEng());
            pre.setString(2, dict.getVn());
            count = pre.executeUpdate();
        } catch (Exception e) {
        } finally {
            try {
                if (pre != null) {
                    pre.close();
                }
            } catch (Exception e) {
            }
            db.DBConnection.closeConnection(conn);
        }
        return count;
    }

    public int uppdate(Dictionary newinfo) {
        PreparedStatement pst = null;
        int count = 0;
        try {
            String sql = "UPDATE sql12726597.Dictionary SET Eng = ?, Vn = ? WHERE Id = ?";
            pst = conn.prepareStatement(sql);
            pst.setString(1, newinfo.getEng());
            pst.setString(2, newinfo.getVn());
            pst.setInt(3, newinfo.getId());
            count = pst.executeUpdate();
        } catch (Exception e) {

        } finally {
            try {
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
            }
            db.DBConnection.closeConnection(conn);
        }
        return count;
    }

    public int delete(String Id) {
        int count = 0;
        PreparedStatement pst = null;
        try {
            String sql = "Delete from sql12726597.Dictionary where Id = ?";
            pst = conn.prepareStatement(sql);
            pst.setString(1, Id);
            count = pst.executeUpdate();
        } catch (Exception e) {

        } finally {
            try {
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
            }

            db.DBConnection.closeConnection(conn);
        }
        return count;
    }

    public void killConnect() {
        String sql = "CALL KillUserProcesses('sql12726597');";
        PreparedStatement pre = null;

        try {
            if (conn == null || conn.isClosed()) {
                throw new SQLException("Database connection is not available.");
            }

            pre = conn.prepareStatement(sql);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error Code: " + e.getErrorCode());
            System.out.println("SQL State: " + e.getSQLState());
            System.out.println("Message: " + e.getMessage());
        } finally {
            try {
                if (pre != null) {
                    pre.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            db.DBConnection.closeConnection(conn);
        }
    }

    public void trigger() {
        int a = 1;
        a++;
    }
}
