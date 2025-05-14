package com.codegym.case_study_restaurant.controller.guest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "BlogController", urlPatterns = "/blog")
public class BlogController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

            request.setAttribute("contentPage", "/views/guest/blog_content.jsp");
            request.getRequestDispatcher("/layout.jsp").forward(request, response);
    }
}