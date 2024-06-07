package com.airline.controller;

import com.airline.model.User;
import com.airline.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "login":
                    login(request, response);
                    break;
                case "register":
                    register(request, response);
                    break;
                default:
                    response.sendRedirect("index.jsp");
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userService.getUserByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("flights.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRole("CUSTOMER");

        userService.registerUser(user);
        response.sendRedirect("login.jsp");
    }
}
