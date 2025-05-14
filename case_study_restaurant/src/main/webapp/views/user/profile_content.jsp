<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.codegym.case_study_restaurant.model.User" %>
<%
  User user = (User) session.getAttribute("user");
  if (user == null) {
    response.sendRedirect("/login");
    return;
  }
%>

<!-- Hero Start -->
<div class="container-fluid bg-light py-6 my-6 mt-0">
  <div class="container text-center animated bounceInDown">
    <h1 class="display-1 mb-4">Your profile</h1>
  </div>
</div>
<!-- Hero End -->

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<%
  String message = (String) request.getAttribute("message");
  if (message != null) {
    // Phân loại thông báo: lỗi hay thành công (có thể dùng thêm biến nếu muốn)
    boolean isError = message.toLowerCase().contains("fail") || message.toLowerCase().contains("incorrect");
%>
<div style="text-align: center" class="alert <%= isError ? "alert-danger" : "alert-success" %> alert-dismissible fade show" role="alert">
  <%= message %>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%
  }
%>

<div class="container">
  <div class="row flex-lg-nowrap">
    <div class="col">
      <div class="row">
        <div class="col mb-3">
          <div class="card">
            <div class="card-body">
              <div class="e-profile">

                <!-- ẢNH ĐẠI DIỆN -->
                <div class="row">
                  <div class="col-12 col-sm-auto mb-3">
                    <div class="mx-auto" style="width: 140px;">
                      <% if (user.getAvatarUrl() != null && !user.getAvatarUrl().isEmpty()) { %>
                      <img src="<%= user.getAvatarUrl() %>" class="rounded" style="width: 140px; height: 140px; object-fit: cover;">
                      <% } else { %>
                      <div class="d-flex justify-content-center align-items-center rounded" style="height: 140px; background-color: rgb(233, 236, 239);">
                        <span style="color: rgb(166, 168, 170); font: bold 8pt Arial;">No Avatar</span>
                      </div>
                      <% } %>
                    </div>
                  </div>
                  <div class="col d-flex flex-column justify-content-between mb-3">
                    <div>
                      <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap"><%= user.getFullName() %></h4>
                      <p class="mb-0">Username: <%= user.getUsername() %></p>
                      <div class="text-muted"><small>Join: <%= user.getCreatedAt() %></small></div>
                    </div>
                    <div>
                      <form action="/profile" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="action" value="updateAvatar"/>
                        <input type="file" name="avatarFile" accept="image/*" required>
                        <button class="btn btn-sm btn-outline-primary mt-2" type="submit">
                          <i class="fa fa-fw fa-camera"></i> Update avatar
                        </button>
                      </form>
                    </div>
                  </div>
                </div>

                <!-- THÔNG TIN CÁ NHÂN -->
                <form action="/profile" method="post">
                  <input type="hidden" name="action" value="updateProfile"/>
                  <div class="row">
                    <div class="col">
                      <div class="form-group">
                        <label>Full name</label>
                        <input class="form-control" type="text" name="fullName" value="<%= user.getFullName() %>"/>
                      </div>
                      <br>
                      <div class="form-group">
                        <label>Username</label>
                        <input class="form-control" type="text" name="username" value="<%= user.getUsername() %>"/>
                      </div>
                      <br>
                      <div class="form-group">
                        <label>Email</label>
                        <input class="form-control" type="email" name="email" value="<%= user.getEmail() %>"/>
                      </div>
                      <br>
                      <div class="form-group">
                        <label>Phone number</label>
                        <input class="form-control" type="text" name="phone" value="<%= user.getPhone() %>"/>
                      </div>
                    </div>
                  </div>
                  <br>
                  <div class="d-flex justify-content-end">
                    <button class="btn btn-primary" type="submit">Update profile</button>
                  </div>
                </form>

                <hr class="mt-4 mb-4"/>

                <!-- ĐỔI MẬT KHẨU -->
                <form action="/profile" method="post">
                  <input type="hidden" name="action" value="changePassword"/>
                  <div class="row">
                    <div class="col">
                      <div class="form-group">
                        <label>Current password</label>
                        <input class="form-control" type="password" name="currentPassword" required/>
                      </div>
                      <div class="form-group">
                        <label>New password</label>
                        <input class="form-control" type="password" name="newPassword" required/>
                      </div>
                      <div class="form-group">
                        <label>Confirm new password</label>
                        <input class="form-control" type="password" name="confirmPassword" required/>
                      </div>
                    </div>
                  </div>
                  <br>
                  <div class="d-flex justify-content-end">
                    <button class="btn btn-warning" type="submit">Change password</button>
                  </div>
                </form>

              </div>
            </div>
          </div>
        </div>
        <!-- Sidebar -->
        <div class="col-12 col-md-3 mb-3">
          <div class="card mb-3">
            <div class="card-body">
              <div class="px-xl-3">
                <form action="/logout" method="post">
                  <button class="btn btn-block btn-secondary">
                    <i class="fa fa-sign-out"></i> <span>Sign out</span>
                  </button>
                </form>
              </div>
            </div>
          </div>
          <div class="card">
            <div class="card-body">
              <h6 class="card-title font-weight-bold">Support</h6>
              <p class="card-text">Contact to the support service if you need any help!</p>
              <button type="button" class="btn btn-primary">Help</button>
            </div>
          </div>
        </div>
        <!-- End Sidebar -->
      </div>
    </div>
  </div>
</div>
