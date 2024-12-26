<%
    String username = null;
    String role = null;
    if (session.getAttribute("userID") == null) {
        response.sendRedirect("login.jsp");
    } else {
        username = (String) session.getAttribute("uname");
        role = (String) session.getAttribute("Role");
        if (username == null && role == null) {
            username = "<a href=\"login.jsp\">No login </a>";
            role = "no role";
        }
    }

%>
<%@ page import="java.sql.*,java.util.*" %>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Solo shoes</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <header class="header">

            <a href="index.jsp" class="logo"> <i class="fas fa-shoe-prints"></i> Solo shoes</a>

            <nav class="navbar">
                <a href="index.jsp">home</a>
                <a href="shoes.jsp">shoes</a>
                <a href="aboutus.jsp">about us</a>
                <a href="contactus.jsp">contact</a>
                <a href="viewOrder.jsp">Order</a>
            </nav>

            <div class="icons">
                <div id="menu-btn" class="fa fa-bars"></div>

                <a href="cart.jsp" class="fas fa-shopping-cart"></a>
                <a href="#" id="user-btn" class="fa fa-user-circle"></a>
            </div>


            <div class="user-box">
                <p>username : <span><%= username%></span></p>
                <p>Role : <span><%= role%></span></p>
                <form action="logout" method="post">
                    <input type="submit" class="delete-btn btn1" value="Logout">
                </form>
            </div>

        </header>
        <h1 class="heading contactus"><span>Your</span> Cart</h1>
        <section class="cart-card">
            <%            Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
                if (cart == null || cart.isEmpty()) {
            %>
            <p>Your cart is empty.</p>
            <%
            } else {
            %>
            <table  class="cart-table">
                <tr>
                    <th>Product Image</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                </tr>
                <%
                    double grandTotal = 0;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/soloshoes", "root", "");

                    for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
                        int productId = entry.getKey();
                        int quantity = entry.getValue();

                        PreparedStatement stmt = con.prepareStatement("SELECT * FROM `products` WHERE pid = ?");
                        stmt.setInt(1, productId);
                        ResultSet rs = stmt.executeQuery();

                        if (rs.next()) {
                            String name = rs.getString("pname");
                            double price = rs.getDouble("price");
                            double total = price * quantity;

                            grandTotal += total;
                %>
                <tr>
                    <td><img src="images/<%= rs.getString("image")%> " width="80px" height="80px" alt="Product Image"></td>
                    <td> <%= rs.getString("pname")%></td>
                    <td><%= quantity%></td>
                    <td><%= total%></td>
                   
                </tr>
                <%
                        }

                        rs.close();
                        stmt.close();
                    }
                    con.close();
                %>
            </table>
            <div class="total-amount">
                Total Amount: <span><%= grandTotal%></span>
            </div>  
            <div class="card-link">

                <form action="order.jsp" method="post">
                    <a href="shoes.jsp" class="tabtn">continue shopping</a>
                    <input type="submit" class="tabtn" value="Place Order">
                </form>
            </div>
            <%
                }
            %>
        </section>
        <section class="footer">

            <div class="box-container">

                <div class="box">
                    <h3>our services</h3>
                    <a href="#">pricing</a>
                    <a href="#">discount</a>
                    <a href="#">refund policy</a>
                    <a href="#">shipping mode</a>
                </div>

                <div class="box">
                    <h3>quick links</h3>
                    <a href="#">home</a>
                    <a href="#">shoes</a>
                    <a href="#">about us</a>
                    <a href="#">contact us</a>
                </div>

                <div class="box">
                    <h3>social links</h3>
                    <a href="#"> <i class="fab fa-facebook-f"></i> facebook</a>
                    <a href="#"> <i class="fab fa-twitter"></i> twitter</a>
                    <a href="#"> <i class="fab fa-instagram"></i> instagram</a>
                    <a href="#"> <i class="fab fa-linkedin"></i> linkedin</a>
                </div>

            </div>

        </section>

        <section class="credit">
            &copy; copyright @ 2024 by Solo shoes
        </section>
        <!-- footer section ends -->

        <!-- swiper js cdn link -->
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

        <!-- custom js file link  -->
        <script src="css/script.js"></script>
    </body>
</html>
