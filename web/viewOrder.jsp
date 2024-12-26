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
<%@ page import="java.util.*, java.sql.*,java.io.PrintWriter" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
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
        <h1 class="heading contactus"><span>Order</span> List</h1>
        <section class="view">
            <%

                PreparedStatement orderStmt = null;
                PreparedStatement itemsStmt = null;
                ResultSet itemsRs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/soloshoes", "root", "");

                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    PreparedStatement stmt = con.prepareStatement("SELECT * FROM `orders` WHERE userId=? ");
                    stmt.setInt(1, (Integer) session.getAttribute("userID"));
                    ResultSet rs = stmt.executeQuery();

                    // Check if there are any orders
                    if (rs.isBeforeFirst()) {
                        while (rs.next()) {
                            int orderId = rs.getInt("oid");
                            String customerName = username;
                            String address = rs.getString("address");
                            String mobileno = rs.getString("mobileno");
                            String orderDate = dateFormat.format(rs.getTimestamp("placed_on"));

            %>
            <div class="order-section">
                <h3>Order ID: <%= orderId%></h3>
                <p><strong>Name:</strong> <%= customerName%></p>
                <p><strong>Address:</strong> <%= address%></p>
                <p><strong>Order Date:</strong> <%= orderDate%></p>
                <%
                    // Fetch items for the current order
                    String itemQuery = "SELECT * FROM `orders` WHERE oid=?";
                    itemsStmt = con.prepareStatement(itemQuery);
                    itemsStmt.setInt(1, orderId);
                    itemsRs = itemsStmt.executeQuery();

                    double totalAmount = 0;

                    while (itemsRs.next()) {
                        String productName = itemsRs.getString("Product");

                %>
                <p><strong>Order Items:</strong> <%= productName%> </p>
                <%
                    }
                %>
                <p><strong>Order status:</strong> <%= rs.getString("status")%></p>
            </div>
            <hr/>
            <%
                }
            } else {
            %>
            <p>No orders found.</p>
            <%
                }
                con.close();
            } catch (Exception e) {
                out.println(e);
            %>
            <p>Error: Unable to fetch order data.</p>
            <%
                } finally {
                    try {

                        if (itemsRs != null) {
                            itemsRs.close();
                        }
                        if (orderStmt != null) {
                            orderStmt.close();
                        }
                        if (itemsStmt != null) {
                            itemsStmt.close();
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
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
                    <a href="index.jsp">home</a>
                    <a href="shoes.jsp">shoes</a>
                    <a href="aboutus.jsp">about us</a>
                    <a href="contactus.jsp">contact us</a>
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
