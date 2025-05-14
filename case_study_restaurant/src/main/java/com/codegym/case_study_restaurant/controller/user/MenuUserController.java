package com.codegym.case_study_restaurant.controller.user;

import com.codegym.case_study_restaurant.dao.MenuItemDAO;
import com.codegym.case_study_restaurant.dao.impl.MenuItemDAOImpl;
import com.codegym.case_study_restaurant.model.MenuItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MenuUserController", urlPatterns = "/menuUser")
public class MenuUserController extends HttpServlet {
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

        request.getRequestDispatcher("/views/shared/user/menuUser.jsp").forward(request, response);
    }
}