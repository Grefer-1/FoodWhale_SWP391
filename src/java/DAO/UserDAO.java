/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import dal.MyDAO;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author ADMIN
 */
public class UserDAO extends MyDAO {

    public User getUserByEmail(String email) throws Exception {
        User user = new User();
        String xsql = "select * from [FoodWhale].[dbo].[User] where Email='?' ";
        try {
            if (con != null) {
                ps = con.prepareStatement(xsql);
                ps.setString(1, email);
                rs = ps.executeQuery();
                while (rs.next()) {
                    // query information in db
                    int uID = rs.getInt("uID");               
                    email = rs.getString("email");
                    String password = rs.getString("password");
                    String username = rs.getString("username");
                    String image = rs.getString("image");
                    Date date = rs.getDate("date");
                    String gender = rs.getString("gender");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    String role = rs.getString("role");
//                      user.setuID(rs.getInt(1));
//                      user.setEmail(rs.getString(2));
//                      user.setPassword(rs.getString(3));
//                      user.setUsername(rs.getString(4));
//                      user.setImage(rs.getString(5));
//                      user.setDate(rs.getDate(6));
//                      user.setGender(rs.getString(7));
//                      user.setAddress(rs.getString(8));
//                      user.setPhone(rs.getString(9));
//                      user.setRole(rs.getString(10));
                }
            }
        } catch (SQLException e) {

        }
        return user;
    }
       public static void main(String[] args) throws Exception {
           UserDAO e = new UserDAO();
//           e.getUserByEmail("hagthe153279@fpt.edu.vn");
           System.out.println(e.getUserByEmail("hagthe153279@fpt.edu.vn"));
    }
}
