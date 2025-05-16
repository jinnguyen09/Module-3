package com.codegym.baithimodule3;

import model.ThueTro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ThueTroDAO {
    private Connection conn;

    public ThueTroDAO(Connection conn) {
        this.conn = conn;
    }

    public List<ThueTro> getAll(String keyword) throws SQLException {
        List<ThueTro> list = new ArrayList<>();
        String sql = "SELECT t.maPhongTro, t.tenNguoiThue, t.soDienThoai, t.ngayBatDau, " +
                "h.tenHinhThuc, t.ghiChu FROM ThueTro t " +
                "JOIN HinhThucThanhToan h ON t.hinhThucThanhToan_id = h.id";

        if (keyword != null && !keyword.trim().isEmpty()) {
            sql += " WHERE t.tenNguoiThue LIKE ? OR t.soDienThoai LIKE ? OR t.maPhongTro LIKE ?";
        }

        PreparedStatement ps = conn.prepareStatement(sql);

        if (keyword != null && !keyword.trim().isEmpty()) {
            String k = "%" + keyword + "%";
            ps.setString(1, k);
            ps.setString(2, k);
            ps.setString(3, k);
        }

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            ThueTro t = new ThueTro();
            t.setMaPhongTro(rs.getInt("maPhongTro"));
            t.setTenNguoiThue(rs.getString("tenNguoiThue"));
            t.setSoDienThoai(rs.getString("soDienThoai"));
            t.setNgayBatDau(rs.getDate("ngayBatDau"));
            t.setHinhThucThanhToan(rs.getString("tenHinhThuc"));
            t.setGhiChu(rs.getString("ghiChu"));
            list.add(t);
        }

        return list;
    }


    public int getNextMaPhong() throws SQLException {
        String sql = "SELECT MAX(maPhongTro) FROM ThueTro";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt(1) + 1;
        }
        return 1;
    }
}

