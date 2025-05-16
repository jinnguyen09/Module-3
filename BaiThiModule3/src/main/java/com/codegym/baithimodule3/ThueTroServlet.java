package com.codegym.baithimodule3;

import model.ThueTro;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/thue-tro")
public class ThueTroServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");
        try {
            Connection conn = DBConnection.getConnection();
            ThueTroDAO dao = new ThueTroDAO(conn);

            List<ThueTro> danhSach = dao.getAll(keyword);
            int nextMaPhong = dao.getNextMaPhong();

            request.setAttribute("list", danhSach);
            request.setAttribute("nextMaPhongFormatted", String.format("PT-%03d", nextMaPhong));

            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("create".equals(action)) {
            String tenNguoiThue = request.getParameter("tenNguoiThue");
            String soDienThoai = request.getParameter("soDienThoai");
            String ngayStr = request.getParameter("ngayBatDau");
            String hinhThucThanhToan = request.getParameter("hinhThucThanhToan");
            String ghiChu = request.getParameter("ghiChu");

            String error = null;
            if (!tenNguoiThue.matches("^[\\p{L} ]{5,50}$")) {
                error = "Tên người thuê không hợp lệ (chỉ chữ và dài 5-50 ký tự)";
            } else if (!soDienThoai.matches("^\\d{10}$")) {
                error = "Số điện thoại phải gồm đúng 10 chữ số!";
            } else {
                try {
                    LocalDate ngay = LocalDate.parse(ngayStr);
                    if (ngay.isBefore(LocalDate.now())) {
                        error = "Ngày bắt đầu thuê không được trong quá khứ!";
                    }
                } catch (Exception e) {
                    error = "Định dạng ngày không hợp lệ!";
                }
            }

            if (error != null) {
                request.setAttribute("error", error);
                doGet(request, response);
                return;
            }

            try (Connection conn = DBConnection.getConnection()) {
                String sqlFind = "SELECT id FROM HinhThucThanhToan WHERE tenHinhThuc = ?";
                PreparedStatement psFind = conn.prepareStatement(sqlFind);
                psFind.setString(1, hinhThucThanhToan);
                ResultSet rs = psFind.executeQuery();
                int htttId = 1;
                if (rs.next()) {
                    htttId = rs.getInt("id");
                }

                String sqlInsert = "INSERT INTO ThueTro(tenNguoiThue, soDienThoai, ngayBatDau, hinhThucThanhToan_id, ghiChu) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement ps = conn.prepareStatement(sqlInsert);
                ps.setString(1, tenNguoiThue);
                ps.setString(2, soDienThoai);
                ps.setDate(3, Date.valueOf(ngayStr));
                ps.setInt(4, htttId);
                ps.setString(5, ghiChu);

                ps.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }

            response.sendRedirect(request.getContextPath() + "/thue-tro");
        }
        else if ("confirmXoa".equals(action)) {
            String[] ids = request.getParameterValues("chonXoa");
            if (ids == null || ids.length == 0) {
                response.sendRedirect(request.getContextPath() + "/thue-tro");
                return;
            }

            List<String> dsMa = new ArrayList<>();
            for (String id : ids) {
                dsMa.add(String.format("PT-%03d", Integer.parseInt(id)));
            }

            request.setAttribute("dsId", ids);
            request.setAttribute("dsMa", dsMa);
            request.setAttribute("showPopupXacNhan", true);

            doGet(request, response);
        }
        else if ("xoaThueTro".equals(action)) {
            String[] ids = request.getParameterValues("dsXoa");
            if (ids != null) {
                try (Connection conn = DBConnection.getConnection()) {
                    String sql = "DELETE FROM ThueTro WHERE maPhongTro = ?";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    for (String id : ids) {
                        ps.setInt(1, Integer.parseInt(id));
                        ps.addBatch();
                    }
                    ps.executeBatch();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            response.sendRedirect(request.getContextPath() + "/thue-tro");
        }
    }
}
