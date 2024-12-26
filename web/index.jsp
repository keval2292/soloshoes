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
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
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

        <!-- header section ends -->

        <!-- home section starts -->

        <section class="home" id="home">

            <div class="slides-container">

                <div class="slide active">
                    <div class="content">
                        <span></span>
                        <h3>winter collection</h3>
                        <p>Find Your Perfect Fit With SoloShoes</p>
                        <button class="btn">
                            <span><a href="shoes.jsp" style="color: white;">shop now</a></span>
                            <i class="fas fa-arrow-right"></i>
                        </button>
                    </div>
                    <div class="image">
                        <img src="images/header-1.png" alt="">
                    </div>
                </div>

                <div class="slide">
                    <div class="content">
                        <h3>Special Offer</h3>
                        <p>Make A Good Journey With Shoes</p>
                        <button class="btn">
                            <span><a href="shoes.jsp" style="color: white;">shop now</a></span>
                            <i class="fas fa-arrow-right"></i>
                        </button>
                    </div>
                    <div class="image">
                        <img src="images/header-2.png" alt="">
                    </div>
                </div>

            </div>

            <div id="slide-next" onclick="next()" class="fas fa-angle-right"></div>
            <div id="slide-prev" onclick="prev()" class="fas fa-angle-left"></div>

        </section>

        <!-- home section ends -->

        <!-- latest product section starts -->

        <section class="products" id="products">

            <h1 class="heading"><span>latest</span> products</h1>

            <div class="box-container">
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/soloshoes", "root", "");
                        Statement stmt = con.createStatement();
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        ResultSet rs = stmt.executeQuery("SELECT * FROM `products`");
                        while (rs != null && rs.next()) {
                %>
                <div class="box">
                    <div class="image">
                        <img src="images/<%= rs.getString("image")%>" alt="no image">
                    </div>
                    <div class="content">
                        <h3><%= rs.getString("pname")%></h3>
                        <div class="stars">
                            <span>Running shoes</span>
                        </div>
                        <div class="price">MRP : ₹ <%= rs.getDouble("price")%></div>
                        <form action="addToCart" method="post">
                            <input type="hidden" name="productId" value="<%= rs.getString("pid")%>">
                            <input type='submit' value='Add to Cart' class="fas fa-shopping-cart btn">
                        </form>
                    </div>
                </div>
                <%
                        }
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>

        </section>

        <!-- latest product section ends -->

        <!-- banner section starts -->

        <section class="banner-container">

            <div class="banner">
                <img src="images/banner1.jpg" alt="">
                <div class="content">
                    <span>limited offer</span>
                    <h3>upto 40% off</h3>
                    <button class="btn">
                        <span><a href="shoes.jsp" style="color: white;">shop now</a></span>
                        <i class="fas fa-arrow-right"></i>
                    </button>
                </div>
            </div>

            <div class="banner">
                <img src="images/banner2.jpg" alt="">
                <div class="content">
                    <span>limited offer</span>
                    <h3>upto 40% off</h3>
                    <button class="btn">
                        <span><a href="shoes.jsp" style="color: white;">shop now</a></span>
                        <i class="fas fa-arrow-right"></i>
                    </button>
                </div>
            </div>

        </section>

        <!-- banner section ends -->

        <!-- featured product section starts -->

        <section class="featured" id="featured">

            <h1 class="heading"><span>category</span> products</h1>

            <div class="swiper featured-slider">

                <div class="swiper-wrapper">

                    <div class="swiper-slide slide">
                        <span class="discount">New</span>
                        <div class="image">
                            <img src="images/product-1.png" alt="">
                        </div>
                        <div class="content">
                            <h3>Lifestyle Shoes</h3>
                            <a href="shoes.jsp" class="btn">shop now</a>
                        </div>
                    </div>

                    <div class="swiper-slide slide">
                        <span class="discount">New</span>
                        <div class="image">
                            <img src="images/product-8.png" alt="">
                        </div>
                        <div class="content">
                            <h3>Jordan Shoes</h3>
                            <a href="shoes.jsp" class="btn">shop now</a>
                        </div>
                    </div>

                    <div class="swiper-slide slide">
                        <span class="discount">New</span>
                        <div class="image">
                            <img src="images/product-9.png" alt="">
                        </div>
                        <div class="content">
                            <h3>Running Shoes</h3>
                            <a href="shoes.jsp" class="btn">shop now</a>
                        </div>
                    </div>

                    <div class="swiper-slide slide">
                        <span class="discount">New</span>
                        <div class="image">
                            <img src="images/product-10.png" alt="">
                        </div>
                        <div class="content">
                            <h3>Basketball Shoes</h3>
                            <a href="shoes.jsp" class="btn">shop now</a>
                        </div>
                    </div>

                    <div class="swiper-slide slide">
                        <span class="discount">New</span>
                        <div class="image">
                            <img src="images/product-11.png" alt="">
                        </div>
                        <div class="content">
                            <h3>Football Shoes</h3>
                            <a href="shoes.jsp" class="btn">shop now</a>
                        </div>
                    </div>
                    <div class="swiper-slide slide">
                        <span class="discount">New</span>
                        <div class="image">
                            <img src="images/product-12.png" alt="">
                        </div>
                        <div class="content">
                            <h3>Training shoes</h3>
                            <a href="shoes.jsp" class="btn">shop now</a>
                        </div>
                    </div>

                </div>

                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>

            </div>

        </section>

        <!-- featured product section ends -->

        <!-- review section starts -->

        <section class="review" id="review">

            <h1 class="heading"><span>client's</span> review</h1>

            <div class="box-container">

                <div class="box">
                    <div class="image">
                        <img src="images/pic-1.png" alt="">
                    </div>
                    <div class="content">
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <h3>Aanya Verma</h3>
                        <p>I just received my Solo Shoes order, and I couldn’t be happier! The site is easy to navigate, and the filters helped me narrow down my options quickly.</p>
                    </div>
                </div>

                <div class="box">
                    <div class="image">
                        <img src="images/pic-2.png" alt="">
                    </div>
                    <div class="content">
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <h3>Aarav Singh</h3>
                        <p>I recently bought a pair of Solo Shoes, and I’m really impressed! The website is user-friendly, making it easy to find exactly what I was looking for. The quality of the shoes is excellent, and they are super comfortable.</p>
                    </div>
                </div>

                <div class="box">
                    <div class="image">
                        <img src="images/pic-3.png" alt="">
                    </div>
                    <div class="content">
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <h3>Priya Patel</h3>
                        <p>My shopping experience at Solo Shoes was wonderful! The variety of styles available is amazing, and I love how detailed the product images are. I found the perfect pair for my upcoming event. The checkout process was smooth, and I received my order ahead of schedule.</p>
                    </div>
                </div>

            </div>

        </section>

        <!-- review section ends -->

        <!-- send gift section starts -->

        <section class="send">

            <div class="container">

                <div class="content">
                    <h2 class="title">contact info</h2>
                    <p> <i class="fas fa-phone"></i> +123-456-7890 </p>
                    <p> <i class="fas fa-phone"></i> +111-222-3333 </p>
                    <p> <i class="fas fa-envelope"></i> soloshoes@gmail.com </p>
                    <p> <i class="fas fa-map-marker-alt"></i> The M.S.University of Baroda, Pratapgunj,Vadodara, Gujarat-390002</p>
                </div>
                <div class="image">
                    <img src="images/Send gift.png" alt="">
                </div>

            </div>

        </section>

        <!-- send gift section ends -->

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