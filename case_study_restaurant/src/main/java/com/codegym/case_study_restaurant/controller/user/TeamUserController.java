package com.codegym.case_study_restaurant.controller.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "TeamUserController", urlPatterns = "/teamUser")
public class TeamUserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            request.setAttribute("contentPage", "/views/user/teamUser_content.jsp");
            request.getRequestDispatcher("/layoutUser.jsp").forward(request, response);
    }
}