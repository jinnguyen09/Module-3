package com.codegym.case_study_restaurant.controller;

import com.codegym.case_study_restaurant.dao.MenuItemDAO;
import com.codegym.case_study_restaurant.dao.impl.MenuItemDAOImpl;
import com.codegym.case_study_restaurant.model.MenuItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", urlPatterns = "/home")
public class HomeController extends HttpServlet {
    private MenuItemDAO menuItemDAO;

    @Override
    public void init() throws ServletException {
        menuItemDAO = new MenuItemDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<MenuItem> menuItems = menuItemDAO.findAll();
        request.setAttribute("menuItems", menuItems);

        //Đường dẫn file JSP nội dung chính cho layout
        request.setAttribute("contentPage", "/views/home_content.jsp");

        //Hiển thị layout + nội dung
        request.getRequestDispatcher("/layoutUser.jsp").forward(request, response);
    }
}

