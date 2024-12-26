<%@ page session="true" %>
<%
    int todayorder = 0;
    int pending = 0;
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
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/soloshoes", "root", "");
        Statement stmt = con.createStatement();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        ResultSet rs = stmt.executeQuery("SELECT COUNT(oid),count(status=\"pending\") FROM orders JOIN users ON orders.userId = users.userID WHERE DATE(orders.placed_on) = CURDATE();");
        while (rs.next()) {
            todayorder = rs.getInt(1);
            pending=rs.getInt(2);
        }
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
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
                <div class="box-container">

                    <div class="box box1">
                        <div class="text">
                            <h2 class="topic-heading">60.5k</h2>
                            <h2 class="topic">Total Orders</h2>
                        </div>
                        <i class="fas fa-box icon"></i>
                    </div>

                    <div class="box box2">
                        <div class="text">
                            <h2 class="topic-heading"><%= pending %></h2>
                            <h2 class="topic">Pending Orders</h2>
                        </div>
                        <i class="fas fa-hourglass-half icon"></i>
                    </div>

                    <div class="box box3">
                        <div class="text">
                            <h2 class="topic-heading"><%= todayorder %></h2>
                            <h2 class="topic">Today's Orders</h2>
                        </div>
                        <i class="fas fa-calendar-day icon"></i>
                    </div>

                    <div class="box box4">
                        <div class="text">
                            <h2 class="topic-heading">70</h2>
                            <h2 class="topic">Customer Feedback</h2>
                        </div>
                        <i class="fas fa-comment-alt icon"></i>
                    </div>
                </div>

                <div class="report-container">
                    <div class="report-header">
                        <h1 class="recent-Articles">Today Orders</h1>
                        <a class="view" href="Order.jsp">View All</a>
                    </div>

                    <div class="report-body">
                        <table class="cart-table">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>phone n.</th>
                                    <th>Address</th>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Date</th>
                                    <th>status</th>
                                </tr>
                            </thead>
                            <%
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/soloshoes", "root", "");
                                    Statement stmt = con.createStatement();
                                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                    ResultSet rs = stmt.executeQuery("SELECT * FROM orders JOIN users ON orders.userId = users.userID WHERE DATE(orders.placed_on) = CURDATE();");
                                    while (rs != null && rs.next()) {
                            %>
                            <tbody>
                                <tr>
                                    <td><%= rs.getString("Name")%></td>
                                    <td><%= rs.getString("mobileno")%></td>
                                    <td><%= rs.getString("address")%></td>
                                    <td><%= rs.getString("Product")%></td>
                                    <td><%= rs.getInt("price")%></td>
                                    <td><%= dateFormat.format(rs.getTimestamp("placed_on"))%></td>
                                    <td><%= rs.getString("status")%></td>
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

