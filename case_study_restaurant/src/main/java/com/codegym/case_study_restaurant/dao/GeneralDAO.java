package com.codegym.case_study_restaurant.dao;

import java.util.List;

public interface GeneralDAO<T> {
    void add(T object);
    void update(T object);
    void delete(int id);
    T findById(int id);
    List<T> findAll();
}
