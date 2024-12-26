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

            <h1 class="heading contactus"><span>About</span> us</h1>

            <div class="about">
                <div class="card">
                    <div class="card-image">
                        <img src="images/about.jpg" alt="Company Logo">
                    </div>
                    <div class="card-content">
                        <h1>Our story</h1>
                        <p>Solo Shoes began with a simple vision: to redefine the way people experience footwear. Founded in 2015,
                            our journey started with a passion for crafting not just shoes, but a remarkable experience for our
                            customers. From a small boutique with a few handpicked styles, we’ve grown into a leading e-commerce
                            destination for premium, fashion-forward shoes.

                        </p>
                        <p> Over the years, we’ve expanded our collection to include a diverse range of footwear, from classic
                            elegance to cutting-edge trends. Our team, a group of dedicated fashion enthusiasts and industry
                            experts, works tirelessly to curate styles that cater to every taste and occasion.</p>
                    </div>
                </div>

            </div>

        </section>

        <section class="stats-section">
            <div class="stats-card">
                <div class="stats-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="140" height="140" fill="currentColor" class="bi bi-emoji-smile-fill" viewBox="0 0 16 16">
                    <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16M7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5M4.285 9.567a.5.5 0 0 1 .683.183A3.5 3.5 0 0 0 8 11.5a3.5 3.5 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683M10 8c-.552 0-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5S10.552 8 10 8"/>
                    </svg>
                </div>
                <div class="stats-info">
                    <h2>Happy Customers</h2>
                    <p class="stats-number">5 million+</p>
                </div>
            </div>
            <div class="stats-card">
                <div class="stats-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="140" height="140" fill="currentColor" class="bi bi-hourglass" viewBox="0 0 16 16">
                    <path d="M2 1.5a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-1v1a4.5 4.5 0 0 1-2.557 4.06c-.29.139-.443.377-.443.59v.7c0 .213.154.451.443.59A4.5 4.5 0 0 1 12.5 13v1h1a.5.5 0 0 1 0 1h-11a.5.5 0 1 1 0-1h1v-1a4.5 4.5 0 0 1 2.557-4.06c.29-.139.443-.377.443-.59v-.7c0-.213-.154-.451-.443-.59A4.5 4.5 0 0 1 3.5 3V2h-1a.5.5 0 0 1-.5-.5m2.5.5v1a3.5 3.5 0 0 0 1.989 3.158c.533.256 1.011.791 1.011 1.491v.702c0 .7-.478 1.235-1.011 1.491A3.5 3.5 0 0 0 4.5 13v1h7v-1a3.5 3.5 0 0 0-1.989-3.158C8.978 9.586 8.5 9.052 8.5 8.351v-.702c0-.7.478-1.235 1.011-1.491A3.5 3.5 0 0 0 11.5 3V2z"/>
                    </svg>
                </div>
                <div class="stats-info">
                    <h2>Years of Experience</h2>
                    <p class="stats-number">15 years</p>
                </div>
            </div>
            <div class="stats-card">
                <div class="stats-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                    <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z"/>
                    </svg>
                </div>
                <div class="stats-info">
                    <h2>Total Sales</h2>
                    <p class="stats-number">₹ 50 million +</p>
                </div>
            </div>
        </section>
        <!-- footer section starts -->
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
                        <h3>Priya Patel</h3>
                        <p>My shopping experience at Solo Shoes was wonderful! The variety of styles available is amazing, and I love how detailed the product images are. I found the perfect pair for my upcoming event. The checkout process was smooth, and I received my order ahead of schedule.</p>
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