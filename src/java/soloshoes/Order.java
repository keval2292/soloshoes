/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package soloshoes;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author keval
 */
public class Order extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String address = request.getParameter("address");
        String mobileno = request.getParameter("mobileno");
        String userId = request.getParameter("userId");
        RequestDispatcher dispatcher = null;
        HttpSession session = request.getSession();
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");

        if (cart != null && !cart.isEmpty()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/soloshoes", "root", "");
                StringBuilder productsBuilder = new StringBuilder();
                double totalPrice = 0;

                // Create a concatenated string for products
                for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
                    int productId = entry.getKey();
                    int quantity = entry.getValue();

                    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM `products` WHERE pid = ?");
                    stmt.setInt(1, productId);
                    ResultSet rs = stmt.executeQuery();

                    if (rs.next()) {
                        String productName = rs.getString("pname");
                        double price = rs.getDouble("price");
                        double total = price * quantity;
                        totalPrice += total;

                        productsBuilder.append(productName)
                                .append(" (x").append(quantity).append(") ")
                                .append(" - $").append(total).append("\n");
                    }

                    rs.close();
                    stmt.close();
                }

                // Insert order details into the orders table
                PreparedStatement orderStmt = conn.prepareStatement(
                        "INSERT INTO orders (address, mobileno, Product, price,userId) VALUES (?, ?, ?, ?,?)");

                orderStmt.setString(1, address);
                orderStmt.setString(2, mobileno);
                orderStmt.setString(3, productsBuilder.toString());
                orderStmt.setDouble(4, totalPrice);
                orderStmt.setDouble(5, Integer.parseInt(userId));

                int i = orderStmt.executeUpdate();
                if (i > 0) {
                    request.setAttribute("status", "success");
                    dispatcher = request.getRequestDispatcher("viewOrder.jsp");
                    response.sendRedirect("/soloshoes/viewOrder.jsp");
                }
                dispatcher.forward(request, response);
                orderStmt.close();
                conn.close();

                // Clear cart
                session.removeAttribute("cart");  
                response.sendRedirect("/soloshoes/viewOrder.jsp");

            } catch (Exception e) {

            }
        } else {
            response.getWriter().println("Your cart is empty.");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
