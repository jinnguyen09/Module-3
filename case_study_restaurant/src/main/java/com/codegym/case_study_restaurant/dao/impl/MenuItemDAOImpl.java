package com.codegym.case_study_restaurant.dao.impl;

import com.codegym.case_study_restaurant.dao.MenuItemDAO;
import com.codegym.case_study_restaurant.model.MenuItem;
import com.codegym.case_study_restaurant.service.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MenuItemDAOImpl implements MenuItemDAO {

    @Override
    public List<MenuItem> findAll() {
        List<MenuItem> items = new ArrayList<>();
        String sql = "SELECT * FROM menu_items";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                MenuItem item = new MenuItem(
                        rs.getInt("item_id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getDouble("price"),
                        rs.getString("category"),
                        rs.getString("image_url"),
                        rs.getBoolean("is_available")
                );
                items.add(item);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return items;
    }

    @Override public void add(MenuItem object) {}
    @Override public void update(MenuItem object) {}
    @Override public void delete(int id) {}
    @Override public MenuItem findById(int id) { return null; }
    @Override public List<MenuItem> findByCategory(String category) { return null; }
}
