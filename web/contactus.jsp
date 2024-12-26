<%
    String username = (String) session.getAttribute("uname");
    String role = (String) session.getAttribute("Role");
    String btn = "<input type=\"submit\" class=\"delete-btn btn1\" value=\"Logout\">";
    if (username == null && role == null) {
        username = "<a href=\"login.jsp\">No login </a>";
        role = "no role";
        btn = "<a class=\"delete-btn btn1\" href=\"login.jsp\">login</a> ";
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <!-- header section starts -->

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
                    <%= btn%>
                </form>
            </div>

        </header>

        <!-- contact section starts -->

        <section class="contact" id="contact">

            <h1 class="heading contactus"><span>contact</span> us</h1>

            <div class="row">

                <div class="image">
                    <img src="images/demo.jpg" alt="">
                </div>

                <form action="contact" method="post">
                    <h3>get in touch</h3>
                    <div class="inputBox">
                        <input type="text" placeholder="Your Name" name="name" required>
                        <input type="email" placeholder="Your Email" name="email" required>
                    </div>
                    <div class="inputBox">
                        <input type="number" placeholder="Your Number" name="phoneNumber" required>
                        <input type="text" placeholder="Your Subject" name="subject" required>
                    </div>
                    <textarea placeholder="Your Message" cols="30" rows="10" name="message" required></textarea>
                    <input type="submit" value="send message" class="btn">
                </form>

            </div>

        </section>

        <!-- contact section ends -->

        <!-- footer section starts -->

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