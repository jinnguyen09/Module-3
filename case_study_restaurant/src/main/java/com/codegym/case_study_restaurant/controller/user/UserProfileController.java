package com.codegym.case_study_restaurant.controller.user;

import com.codegym.case_study_restaurant.dao.UserDAO;
import com.codegym.case_study_restaurant.dao.impl.UserDAOImpl;
import com.codegym.case_study_restaurant.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet(name = "UserProfileController", urlPatterns = "/profile")
@MultipartConfig
public class UserProfileController extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = session != null ? (User) session.getAttribute("user") : null;
        if (user == null) {
            response.sendRedirect("/login");
            return;
        }

        request.setAttribute("user", user);
        request.setAttribute("contentPage", "/views/user/profile_content.jsp");
        request.getRequestDispatcher("/layoutUser.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = session != null ? (User) session.getAttribute("user") : null;
        if (user == null) {
            response.sendRedirect("/login");
            return;
        }

        String action = request.getParameter("action");

        if ("updateProfile".equals(action)) {
            String fullName = request.getParameter("fullName");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            user.setFullName(fullName);
            user.setUsername(username);
            user.setEmail(email);
            user.setPhone(phone);
            boolean success = userDAO.updateProfile(user);
            if (success) {
                session.setAttribute("user", user);
                request.setAttribute("message", "Profile updated successfully!");
            } else {
                request.setAttribute("message", "Failed to update profile. Please try again.");
            }

        } else if ("changePassword".equals(action)) {
            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");

            if (!user.getPassword().equals(currentPassword)) {
                request.setAttribute("message", "Current password is incorrect.");
            } else if (!newPassword.equals(confirmPassword)) {
                request.setAttribute("message", "New password is incorrect.");
            } else {
                user.setPassword(newPassword);
                userDAO.updatePassword(user);
                session.setAttribute("user", user);
                request.setAttribute("message", "Password changed sucessfully!");
            }

        } else if ("updateAvatar".equals(action)) {
            Part filePart = request.getPart("avatarFile");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("/uploads/");
            new File(uploadPath).mkdirs();
            filePart.write(uploadPath + File.separator + fileName);

            user.setAvatarUrl(request.getContextPath() + "/uploads/" + fileName);
            userDAO.updateAvatar(user);
            session.setAttribute("user", user);
        }

        request.setAttribute("user", user);
        request.setAttribute("contentPage", "/views/user/profile_content.jsp");
        request.getRequestDispatcher("/layoutUser.jsp").forward(request, response);
    }
}
