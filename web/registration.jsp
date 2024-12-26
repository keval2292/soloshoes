<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Solo Shoes</title>
        <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/login.css">
        <link rel="icon" type="image/x-icon" href="images/solo.ico">
    </head>
    <body>
        <input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
        <main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
            <div class="container">
                <div class="card login-card">
                    <div class="row no-gutters">
                        <div class="col-md-5">
                            <img src="images/login.jpg" alt="login" class="login-card-img">
                        </div>
                        <div class="col-md-7">
                            <div class="card-body">
                                <div class="brand-wrapper">
                                    <img src="images/solo.png" alt="logo" class="logo">
                                </div>
                                <p class="login-card-description">SIGN UP</p>
                                <form action="registration" method="post">
                                    <div class="form-group">
                                        <label for="email" class="sr-only">Name</label>
                                        <input type="text" name="name" id="name" class="form-control" placeholder="enter your Name" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" class="sr-only">Email:</label>
                                        <input type="email" name="email" id="email" class="form-control" placeholder="enter the Email address" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" class="sr-only">Password:</label>
                                        <input type="password" name="password" id="password" class="form-control" placeholder="enter the password" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="sr-only">Confirm Password:</label>
                                        <input type="password" name="confirmPassword" id="confirmPassword" class="form-control" placeholder="enter the Confirm Password" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="sr-only">Confirm Password:</label>
                                        <select name="userType" id="userType" class="form-control   ">
                                            <option value="user">user</option>
                                            <option value="admin">admin</option>
                                        </select>
                                    </div>
                                    <input name="login" id="login" class="btn btn-block login-btn mb-4" type="submit" value="Sign Up">
                                </form>
                                <p class="login-card-footer-text">you have already account? <a href="login.jsp" class="text-reset">Login here</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script type="text/javascript">
            var status = document.getElementById("status").value;
            if (status ==="success"){
                swal("Congrats","Account Created Successfully", "success");
            }else if(status ==="failed"){
                swal("oops!","something wrong!","error");
            }
        </script>
    </body>
</html>
