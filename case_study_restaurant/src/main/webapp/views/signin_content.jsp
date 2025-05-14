<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
  <title>Sign In - Pho Ham Liverpool</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/login-form/css/style.css">

</head>
<body class="img js-fullheight" style="background-image: url(/login-form/images/bg.jpg);">

<section class="ftco-section">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-6 text-center mb-5">
        <h2 class="heading-section">Sign In - Pho Ham Liverpool</h2>
      </div>
    </div>
    <div class="row justify-content-center">
      <div class="col-md-6 col-lg-4">
        <div class="login-wrap p-0">
          <h3 class="mb-4 text-center">Have an account?</h3>
          <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger text-center" role="alert">
                ${errorMessage}
            </div>
          </c:if>
          <form id="loginForm" action="${pageContext.request.contextPath}/signin" method="post" class="signin-form">
            <div class="form-group">
              <input type="text" class="form-control" name="usernameOrEmail" placeholder="Username Or Email" required>
            </div>
            <div class="form-group">
              <input id="password-field" type="password" class="form-control" name="password" placeholder="Password" required>
              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
            </div>
            <div class="form-group">
              <button id="loginButton" type="submit" class="form-control btn btn-primary submit px-3">
                <span id="buttonText">Sign In</span>
                <span id="buttonSpinner" class="spinner-border text-light" role="status" aria-hidden="true" style="display:none;"></span>
              </button>
            </div>
            <div class="form-group d-md-flex">
              <div class="w-50">
                <label class="checkbox-wrap checkbox-primary">Remember Me
                  <input type="checkbox" checked>
                  <span class="checkmark"></span>
                </label>
              </div>
              <div class="w-50 text-md-right">
                <a href="#" style="color: #fff">Forgot Password</a>
              </div>
            </div>
          </form>
          <p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
          <div class="social d-flex text-center">
            <a href="#" class="px-2 py-2 mr-md-1 rounded"><span class="ion-logo-facebook mr-2"></span> Facebook</a>
            <a href="#" class="px-2 py-2 ml-md-1 rounded"><span class="ion-logo-twitter mr-2"></span> Twitter</a>
          </div>
          <br>
          <p class="w-100 text-center" style="background-color: black;">&mdash;<a href="${pageContext.request.contextPath}/views/signup_content.jsp"> Click Here To Sign up, If you don't have an account yet! </a>&mdash;</p>
        </div>
      </div>
    </div>
  </div>
</section>

<script src="${pageContext.request.contextPath}/login-form/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/login-form/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/login-form/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/login-form/js/main.js"></script>

<script>
  $(document).ready(function() {
    $('#loginForm').on('submit', function() {
      $('#loginButton').prop('disabled', true);
      $('#buttonText').hide();
      $('#buttonSpinner').show();
    });
    if ($("#alertMessage").text().trim() !== "") {
      setTimeout(function() {
        $("#alertMessage").fadeOut("slow");
      }, 4000);
    }
  });
</script>

</body>
</html>

