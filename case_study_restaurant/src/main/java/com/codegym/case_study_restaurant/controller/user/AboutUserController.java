package com.codegym.case_study_restaurant.controller.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "AboutUserController", urlPatterns = "/aboutUser")
public class AboutUserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("contentPage", "/views/user/aboutUser_content.jsp");
        request.getRequestDispatcher("/layoutUser.jsp").forward(request, response);
    }
}
