package com.codegym.case_study_restaurant.dao;

import com.codegym.case_study_restaurant.model.User;

public interface UserDAO {
    User checkLogin(String username, String password);
    boolean signup(User user);
    boolean existsByUsername(String username);
    boolean existsByEmail(String email);
    boolean existsByPhone(String phone);
    void updatePassword(User user);
    void updateAvatar(User user);
    boolean updateProfile(User user);
}
