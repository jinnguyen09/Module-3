<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, model.ThueTro" %>
<!DOCTYPE html>
<html>
<head>
  <title>Quản lý thuê trọ</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-4">

<h2>Danh sách thuê phòng trọ</h2>

<form method="get" action="thue-tro" class="mb-3">
  <input type="text" name="keyword" placeholder="Tìm theo mã phòng, tên, SĐT" class="form-control w-50 d-inline">
  <button type="submit" class="btn btn-primary">Tìm kiếm</button>
</form>

<form method="post" action="thue-tro">
  <input type="hidden" name="action" value="confirmXoa" />

  <table class="table table-bordered table-hover">
    <thead class="table-light">
    <tr>
      <th>Chọn</th>
      <th>Mã phòng</th>
      <th>Tên người thuê</th>
      <th>SĐT</th>
      <th>Ngày bắt đầu</th>
      <th>Hình thức TT</th>
      <th>Ghi chú</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<ThueTro> list = (List<ThueTro>) request.getAttribute("list");
      if (list != null) {
        for (ThueTro t : list) {
    %>
    <tr>
      <td><input type="checkbox" name="chonXoa" value="<%= t.getMaPhongTro() %>"/></td>
      <td><%= t.getMaPhongTroFormatted() %></td>
      <td><%= t.getTenNguoiThue() %></td>
      <td><%= t.getSoDienThoai() %></td>
      <td><%= t.getNgayBatDau() %></td>
      <td><%= t.getHinhThucThanhToan() %></td>
      <td><%= t.getGhiChu() %></td>
    </tr>
    <%  }
    }
    %>
    </tbody>
  </table>

  <div class="mt-3">
    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#formTaoMoi">
      Tạo mới
    </button>
    <button type="submit" class="btn btn-danger">Xóa</button>
  </div>
</form>


<div class="modal fade" id="formTaoMoi" tabindex="-1" aria-labelledby="formTaoMoiLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form method="post" action="thue-tro" class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="formTaoMoiLabel">Tạo mới thông tin thuê trọ</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <input type="hidden" name="action" value="create" />

        <div class="mb-2">
          <label>Mã phòng trọ</label>
          <input type="text" class="form-control" readonly
                 value="<%= request.getAttribute("nextMaPhongFormatted") %>" />
        </div>

        <div class="mb-2">
          <label>Họ tên người thuê (*)</label>
          <input type="text" name="tenNguoiThue" class="form-control" required />
        </div>

        <div class="mb-2">
          <label>Số điện thoại (*)</label>
          <input type="text" name="soDienThoai" class="form-control" required />
        </div>

        <div class="mb-2">
          <label>Ngày bắt đầu thuê (*)</label>
          <input type="date" name="ngayBatDau" class="form-control" required />
        </div>

        <div class="mb-2">
          <label>Hình thức thanh toán (*)</label>
          <select name="hinhThucThanhToan" class="form-select" required>
            <option value="Theo tháng">Theo tháng</option>
            <option value="Theo quý">Theo quý</option>
            <option value="Theo năm">Theo năm</option>
          </select>
        </div>

        <div class="mb-2">
          <label>Ghi chú</label>
          <textarea name="ghiChu" class="form-control" maxlength="200"></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">Tạo mới</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
      </div>
    </form>
  </div>
</div>

<% if (request.getAttribute("showPopupXacNhan") != null) { %>
<div class="modal fade show" style="display:block; background-color: rgba(0,0,0,0.5);" tabindex="-1">
  <div class="modal-dialog">
    <form method="post" action="thue-tro" class="modal-content">
      <input type="hidden" name="action" value="xoaThueTro"/>
      <%
        String[] ids = (String[]) request.getAttribute("dsId");
        for (String id : ids) {
      %>
      <input type="hidden" name="dsXoa" value="<%=id%>"/>
      <% } %>
      <div class="modal-header">
        <h5 class="modal-title">Xác nhận xóa</h5>
      </div>
      <div class="modal-body">
        <p>Bạn có muốn xóa thông tin thuê trọ
          <strong><%= String.join(", ", (List<String>) request.getAttribute("dsMa")) %></strong> không?
        </p>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-danger">Có</button>
        <a href="thue-tro" class="btn btn-secondary">Không</a>
      </div>
    </form>
  </div>
</div>
<% } %>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
