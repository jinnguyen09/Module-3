package com.codegym.case_study_restaurant.controller.guest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "ReviewController", urlPatterns = "/review")
public class ReviewController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            request.setAttribute("contentPage", "/views/guest/review_content.jsp");
            request.getRequestDispatcher("/layout.jsp").forward(request, response);
    }
}