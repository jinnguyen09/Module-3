<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.codegym.case_study_restaurant.model.MenuItem" %>

<!-- Hero Start -->
<div class="container-fluid bg-light py-6 my-6 mt-0">
    <div class="container text-center animated bounceInDown">
        <h1 class="display-1 mb-4">Menu</h1>
        <ol class="breadcrumb justify-content-center mb-0 animated bounceInDown">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item"><a href="#">Pages</a></li>
            <li class="breadcrumb-item text-dark" aria-current="page">Menu</li>
        </ol>
    </div>
</div>
<!-- Hero End -->

<!-- Menu Start -->
<div class="container-fluid menu bg-light py-6 my-6">
    <div class="container">
        <div class="text-center wow bounceInUp" data-wow-delay="0.1s">
            <small class="d-inline-block fw-bold text-dark text-uppercase bg-light border border-primary rounded-pill px-4 py-1 mb-3">Our Menu</small>
            <h1 class="display-5 mb-5">Most Popular Food in the World</h1>
        </div>
        <div class="tab-class text-center">
            <ul class="nav nav-pills d-inline-flex justify-content-center mb-5 wow bounceInUp" data-wow-delay="0.1s">
                <li class="nav-item p-2">
                    <a class="d-flex py-2 mx-2 border border-primary bg-white rounded-pill active" data-bs-toggle="pill" href="#tab-6">
                        <span class="text-dark" style="width: 150px;">Breakfast</span>
                    </a>
                </li>
                <li class="nav-item p-2">
                    <a class="d-flex py-2 mx-2 border border-primary bg-white rounded-pill" data-bs-toggle="pill" href="#tab-7">
                        <span class="text-dark" style="width: 150px;">Lunch</span>
                    </a>
                </li>
                <li class="nav-item p-2">
                    <a class="d-flex py-2 mx-2 border border-primary bg-white rounded-pill" data-bs-toggle="pill" href="#tab-8">
                        <span class="text-dark" style="width: 150px;">Dinner</span>
                    </a>
                </li>
                <li class="nav-item p-2">
                    <a class="d-flex py-2 mx-2 border border-primary bg-white rounded-pill" data-bs-toggle="pill" href="#tab-9">
                        <span class="text-dark" style="width: 150px;">Soft Drink</span>
                    </a>
                </li>
                <li class="nav-item p-2">
                    <a class="d-flex py-2 mx-2 border border-primary bg-white rounded-pill" data-bs-toggle="pill" href="#tab-10">
                        <span class="text-dark" style="width: 150px;">Buffet</span>
                    </a>
                </li>
            </ul>
            <div class="tab-content">
                <%
                    List<MenuItem> menuItems = (List<MenuItem>) request.getAttribute("menuItems");
                    String defaultImg = "img/default.jpg";
                %>
                <div id="tab-6" class="tab-pane fade show p-0 active">
                    <div class="row g-4">
                        <%
                            if (menuItems != null) {
                                for (MenuItem item : menuItems) {
                                    if (!"breakfast".equalsIgnoreCase(item.getCategory())) continue;
                        %>
                        <div class="col-lg-6 wow bounceInUp" data-wow-delay="0.1s">
                            <div class="menu-item d-flex align-items-center">
                                <img class="flex-shrink-0 img-fluid rounded-circle" src="../img/menu-01.jpg" alt="">
                                <div class="w-100 d-flex flex-column text-start ps-4">
                                    <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                        <h4><%= item.getName() %> <%= item.isAvailable() ? "✔" : "✘" %></h4>
                                        <h4 class="text-primary"><%= item.getPrice() %> $</h4>
                                    </div>
                                    <p class="mb-0"><%= item.getDescription() %></p>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
                <div id="tab-7" class="tab-pane fade show p-0">
                    <div class="row g-4">
                        <%
                            if (menuItems != null) {
                                for (MenuItem item : menuItems) {
                                    if (!"lunch".equalsIgnoreCase(item.getCategory())) continue;
                        %>
                        <div class="col-lg-6">
                            <div class="menu-item d-flex align-items-center">
                                <img class="flex-shrink-0 img-fluid rounded-circle" src="../img/menu-01.jpg" alt="">
                                <div class="w-100 d-flex flex-column text-start ps-4">
                                    <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                        <h4><%= item.getName() %> <%= item.isAvailable() ? "✔" : "✘" %></h4>
                                        <h4 class="text-primary"><%= item.getPrice() %> $</h4>
                                    </div>
                                    <p class="mb-0"><%= item.getDescription() %></p>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
                <div id="tab-8" class="tab-pane fade show p-0">
                    <div class="row g-4">
                        <%
                            if (menuItems != null) {
                                for (MenuItem item : menuItems) {
                                    if (!"dinner".equalsIgnoreCase(item.getCategory())) continue;
                        %>
                        <div class="col-lg-6">
                            <div class="menu-item d-flex align-items-center">
                                <img class="flex-shrink-0 img-fluid rounded-circle" src="../img/menu-01.jpg" alt="">
                                <div class="w-100 d-flex flex-column text-start ps-4">
                                    <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                        <h4><%= item.getName() %> <%= item.isAvailable() ? "✔" : "✘" %></h4>
                                        <h4 class="text-primary"><%= item.getPrice() %> $</h4>
                                    </div>
                                    <p class="mb-0"><%= item.getDescription() %></p>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
                <div id="tab-9" class="tab-pane fade show p-0">
                    <div class="row g-4">
                        <%
                            if (menuItems != null) {
                                for (MenuItem item : menuItems) {
                                    if (!"softdrink".equalsIgnoreCase(item.getCategory())) continue;
                        %>
                        <div class="col-lg-6">
                            <div class="menu-item d-flex align-items-center">
                                <img class="flex-shrink-0 img-fluid rounded-circle" src="../img/menu-06.jpg" alt="">
                                <div class="w-100 d-flex flex-column text-start ps-4">
                                    <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                        <h4><%= item.getName() %> <%= item.isAvailable() ? "✔" : "✘" %></h4>
                                        <h4 class="text-primary"><%= item.getPrice() %> $</h4>
                                    </div>
                                    <p class="mb-0"><%= item.getDescription() %></p>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
                <div id="tab-10" class="tab-pane fade show p-0">
                    <div class="row g-4">
                        <%
                            if (menuItems != null) {
                                for (MenuItem item : menuItems) {
                                    if (!"buffet".equalsIgnoreCase(item.getCategory())) continue;
                        %>
                        <div class="col-lg-6">
                            <div class="menu-item d-flex align-items-center">
                                <img class="flex-shrink-0 img-fluid rounded-circle" src="../img/menu-06.jpg" alt="">
                                <div class="w-100 d-flex flex-column text-start ps-4">
                                    <div class="d-flex justify-content-between border-bottom border-primary pb-2 mb-2">
                                        <h4><%= item.getName() %> <%= item.isAvailable() ? "✔" : "✘" %></h4>
                                        <h4 class="text-primary"><%= item.getPrice() %> $</h4>
                                    </div>
                                    <p class="mb-0"><%= item.getDescription() %></p>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Menu End -->


