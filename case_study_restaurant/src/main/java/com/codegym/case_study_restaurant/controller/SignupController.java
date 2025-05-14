package com.codegym.case_study_restaurant.controller;

import com.codegym.case_study_restaurant.dao.UserDAO;
import com.codegym.case_study_restaurant.dao.impl.UserDAOImpl;
import com.codegym.case_study_restaurant.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;

@WebServlet(name = "RegisterController", urlPatterns = "/signup")
public class SignupController extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/signup_content.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        if (userDAO.existsByUsername(username)) {
            request.setAttribute("errorMessage", "Username has been used!");
            request.getRequestDispatcher("/views/signup_content.jsp").forward(request, response);
            return;
        }

        if (userDAO.existsByEmail(email)) {
            request.setAttribute("errorMessage", "Email has been used!");
            request.getRequestDispatcher("/views/signup_content.jsp").forward(request, response);
            return;
        }

        if (userDAO.existsByPhone(phone)) {
            request.setAttribute("errorMessage", "Phone number has been used!");
            request.getRequestDispatcher("/views/signup_content.jsp").forward(request, response);
            return;
        }

        User newUser = new User();
        newUser.setFullName(fullname);
        newUser.setUsername(username);
        newUser.setPassword(password);
        newUser.setEmail(email);
        newUser.setPhone(phone);
        newUser.setRole("user");
        newUser.setCreatedAt(Timestamp.from(Instant.now()));

        boolean success = userDAO.signup(newUser);

        if (success) {
            request.setAttribute("successMessage", "Registration Successful, redirecting to login page!.");
            request.getRequestDispatcher("/views/signup_content.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Registration Failed, please try again!.");
            request.getRequestDispatcher("/views/signup_content.jsp").forward(request, response);
        }
    }
}
