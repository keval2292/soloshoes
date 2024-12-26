<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("uname");
    String role = (String) session.getAttribute("Role");
    String btn = "<input type=\"submit\" class=\"delete-btn btn1\" value=\"Logout\">";
    if (role == null || !"admin".equals(role)) {
        response.sendRedirect("../login.jsp");
        return;
    }
    if (username == null && role == null) {
        username = "<a href=\"login.jsp\">No login </a>";
        role = "no role";
        btn = "<a class=\"delete-btn btn1\" href=\"login.jsp\">login</a> ";
    }
%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible"
              content="IE=edge">
        <meta name="viewport" 
              content="width=device-width, 
              initial-scale=1.0">
        <title>solo shoes</title>
        <link rel="stylesheet" 
              href="style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    </head>

    <body>

        <!-- for header part -->
        <header>

            <div class="logosec">
                <div class="logo">solo<span style="color: black;"> shoes</span></div>
                <img src=
                     "https://media.geeksforgeeks.org/wp-content/uploads/20221210182541/Untitled-design-(30).png"
                     class="icn menuicn" 
                     id="menuicn" 
                     alt="menu-icon">
            </div>
            <div class="icons">
               <a href="#" id="user-btn" class="fa fa-user-circle"></a>
            </div>


            <div class="user-box">
                <p>username : <span><%= username%></span></p>
                <p>Role : <span><%= role%></span></p>
                <form action="logout" method="post">
                    <%= btn%>
                </form>
            </div>

        </header>

        <div class="main-container">
            <div class="navcontainer">
                <nav class="nav">
                    <div class="nav-upper-options">
                        <div class="nav-option ">
                            <i class="fas fa-tachometer-alt nav-img"></i>
                            <a href="dashboard.jsp"> Dashboard</a>
                        </div>

                        <div class=" nav-option">
                            <i class="fas fa-box nav-img"></i>
                            <a href="Products.jsp"> Products</a>
                        </div>

                        <div class="nav-option ">
                            <i class="fas fa-shopping-cart nav-img"></i> 
                            <a href="Order.jsp">Orders</a>
                        </div>

                        <div class="nav-option ">
                            <i class="fas fa-envelope nav-img"></i>
                            <a href="messages.jsp"> Messages</a>
                        </div>
                        <div class="nav-option ">
                            <i class="fas fa-sign-out-alt nav-img"></i>
                            <a href="">Logout</a>
                        </div>

                    </div>
                </nav>
            </div>
            <div class="main">
                <div class="form-container">
                    <form action="AddProduct" method="post" enctype="multipart/form-data" class="productForm">
                        <h2 class="formheader">Add Product</h2>

                        <label class="formlable" for="productName">Product Name</label>
                        <input type="text" id="productName" name="productName" placeholder="Enter product name" required>

                        <label class="formlable" for="productPrice">Price ($)</label>
                        <input type="number" id="productPrice" name="productPrice" placeholder="Enter product price" required>

                        <label class="formlable" for="productCategory">Category</label>
                        <input type="text" id="productCategory" name="productCategory" placeholder="Enter product Category" required>

                        <label class="formlable" for="productImage">Product Image</label>
                        <input type="file" id="productImage" name="productImage" required>

                        <input type="submit" value="Add Product" class="formBtn">
                    </form>
                </div>
                <div class="report-container">
                    <div class="report-header">
                        <h1 class="recent-Articles">Product</h1>
                    </div>

                    <div class="report-body">
                        <table class="cart-table">
                            <thead>
                                <tr>
                                    <th>Product Image</th>
                                    <th>Product Name</th>
                                    <th>Product Category</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <%
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/soloshoes", "root", "");
                                    Statement stmt = con.createStatement();
                                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                    ResultSet rs = stmt.executeQuery("SELECT * FROM `products`");
                                    while (rs != null && rs.next()) {
                            %>
                            <tbody>
                                <tr>
                                    <td><img src="../images/<%= rs.getString("image")%> " width="80px" height="80px" alt="Product Image"></td>
                                    <td> <%= rs.getString("pname")%> </td>
                                    <td><%= rs.getDouble("price")%></td>
                                    <td><%= rs.getString("category")%> </td>
                                </tr>
                            </tbody>
                            <%
                                    }
                                    con.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                        </table>
                    </div>
                </div>
            </div>

        </div>


        <script src="./index.js"></script>
    </body>
</html>

