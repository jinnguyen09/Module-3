package com.codegym.case_study_restaurant.dao;

import com.codegym.case_study_restaurant.model.MenuItem;
import java.util.List;

public interface MenuItemDAO extends GeneralDAO<MenuItem> {
    List<MenuItem> findByCategory(String category);
}