/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.FoodWhaleDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author ADMIN
 */
public class AccountDetailController extends HttpServlet {

    ArrayList<User> userlist = new ArrayList<User>();
    User userdetail = new User();

    private String getCookieByName(Cookie[] cookies, String check) {
        if (cookies == null) {
            return null;
        }
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(check)) {
                return cookie.getValue();
            }
        }
        return null;
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Cookie[] cookies = request.getCookies();
            String role = getCookieByName(cookies, "ROLE");
            if (role == null || role.equals("user") || role.equals("")) {
                response.sendRedirect(request.getContextPath()+"/Homepage");
            } else if (role.equals("staff") || role.equals("admin")) {
                int id = Integer.parseInt(request.getParameter("id"));
                FoodWhaleDAO dao = new FoodWhaleDAO();
                userdetail = dao.getUserByID(id);
                request.setAttribute("userdetail", userdetail);
                request.getRequestDispatcher("/AccountDetail.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDetailController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Cookie[] cookies = request.getCookies();
            String ROLE = getCookieByName(cookies, "ROLE");
            FoodWhaleDAO dao = new FoodWhaleDAO();
            String submit = request.getParameter("submit");
            if (submit.equalsIgnoreCase("Update")) {
                int id = Integer.parseInt(request.getParameter("uid"));
                String image = request.getParameter("image");
                String email = request.getParameter("email");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String gender = request.getParameter("gender");
                String date = request.getParameter("date");
                Date startDate = Date.valueOf(date);
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                String role = request.getParameter("role");
                User u = new User(id, email, password, username, image, startDate, gender, address, phone, role);
                dao.updateUser(u);
                userdetail = dao.getUserByID(id);
                request.setAttribute("userdetail", userdetail);
                request.getRequestDispatcher("/AccountDetail.jsp").forward(request, response);
            } else if (submit.equalsIgnoreCase("Delete")) {
                int id = Integer.parseInt(request.getParameter("uid"));
                dao.deleteUser(id);
                userlist = (ArrayList<User>) dao.getAllAccount();
                request.setAttribute("userlist", userlist);
                request.getRequestDispatcher("/AccountList.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDetailController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
