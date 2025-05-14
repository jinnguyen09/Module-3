package com.codegym.case_study_restaurant.controller;

import com.codegym.case_study_restaurant.dao.UserDAO;
import com.codegym.case_study_restaurant.dao.impl.UserDAOImpl;
import com.codegym.case_study_restaurant.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "LoginController", urlPatterns = "/signin")
public class SigninController extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/signin_content.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("usernameOrEmail");
        String password = request.getParameter("password");

        User user = userDAO.checkLogin(username, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("role", user.getRole());
            response.sendRedirect(request.getContextPath() + "/home");
        } else {
            // Đăng nhập thất bại -> báo lỗi
            request.setAttribute("errorMessage", "Username or password incorrect!");
            request.getRequestDispatcher("/views/signin_content.jsp").forward(request, response);
        }
    }
}
